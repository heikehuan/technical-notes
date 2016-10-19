package com.hjhz.orgGroup.cache;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import com.hjhz.base.pojo.UserInfo;
import com.hjhz.base.service.BaseServiceImpl;
import com.hjhz.base.util.SpringContextUtil;
public class UserCache {
	public static Map map=new ConcurrentHashMap<String,UserInfo>();
	public static BaseServiceImpl  dao=(BaseServiceImpl)SpringContextUtil.getBean("baseService");
	public final static ReadWriteLock lock = new ReentrantReadWriteLock();
	public final static Lock readLock = lock.readLock();
    public final static Lock writeLock = lock.writeLock();
    static{
    	try {
			refreshCacheMap() ;//初始化用户缓存
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    /**
     * 
     * 描述: 得到缓存里一个用户
     *
     * @Title: getUserByUserName  
     * @param userName
     * @return    
     * @return UserInfo    
     * @author:  zhangxiaodi
     * @date: 2013-2-25 上午10:08:19
     */
    public static UserInfo getUserByUserName(String userName){
   	 readLock.lock();
   	 try {
   		return (UserInfo) map.get(userName);
   	} catch (Exception e) {
   		e.printStackTrace();
   		return null;
   	}finally
   	{
   		readLock.unlock();
   	}
    }
    /**
     * 
     * 描述: 加载所有有效的用户
     *
     * @Title: refreshCacheMap      
     * @return void    
     * @author:  zhangxiaodi
     * @date: 2013-2-25 上午10:08:42
     */
    public static void  refreshCacheMap(){
    writeLock.lock();	
	try {
	   map.clear();
		List list=dao.baseDao.queryListObjectAll("from UserInfo user where user.userStat=1");
		for(int i=0;i<list.size();i++)
		{
			UserInfo u=(UserInfo) list.get(i);
			map.put(u.getUserName(),u);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally
	{
		writeLock.unlock();
	}
    }
    /**
     * 
     * 描述: 新增用户到缓存
     *
     * @Title: addObject  
     * @param u    
     * @return void    
     * @author:  zhangxiaodi
     * @date: 2013-2-25 上午10:13:54
     */
    public static void addObject(UserInfo u){
    	writeLock.lock();
   	 try {
   		map.put(u.getUserName(), u);
   	} catch (Exception e) {
   		e.printStackTrace();
   	}finally
   	{
   		writeLock.unlock();
   	}
    }
}
