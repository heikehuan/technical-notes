
这个类虽然没有在spring中设单例方法，但是在开头有static,refreshCacheMap方法自动执行


public  class  OrganizationCache{
	public static Map map=new ConcurrentHashMap<String,Organization>();
	public static BaseServiceImpl  dao=(BaseServiceImpl)SpringContextUtil.getBean("baseService");
	public final static ReadWriteLock lock = new ReentrantReadWriteLock();
	public final static Lock readLock = lock.readLock();
    public final static Lock writeLock = lock.writeLock();
    static{//初始化map
    	try {
			refreshCacheMap() ;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	/**
 * 
 * 描述：读取缓存里的机构数据
 *
 * @Title: getCacheMap  
 * @return
 * @see com.hjhz.orgGroup.cache.IObjectCache#getCacheMap()     
 * @author:  zhangxiaodi
 * @date: 2012-11-5 上午10:49:47
 */
	public static Map<String,Organization> getCacheMap() {
		readLock.lock();
		try {
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			readLock.unlock();
		}
	}
/**
 * 
 * 描述：刷新机构表缓存
 *
 * @Title: refreshCacheMap  
 * @see com.hjhz.orgGroup.cache.IObjectCache#refreshCacheMap()     
 * @author:  zhangxiaodi
 * @throws InterruptedException 
 * @date: 2012-11-5 上午10:49:23
 */
	public static   void refreshCacheMap() throws InterruptedException {
		writeLock.lock();	
		try {
		   map.clear();
			List list=dao.baseDao.queryListObjectAll("from Organization");
			for(int i=0;i<list.size();i++)
			{
				Organization u=(Organization) list.get(i);
				map.put(u.getUserId(),u);
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
	 * 描述: 根据id查找一个对象
	 *
	 * @Title: getObjectById  
	 * @param id
	 * @return    
	 * @return Object    
	 * @author:  zhangxiaodi
	 * @date: 2012-11-7 上午10:57:01
	 */
public static Organization getObjectById(String id) {
	 readLock.lock();
	 try {
		return (Organization) map.get(id);
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}finally
	{
		readLock.unlock();
	}
}
public static void addObject(Organization org){
	 writeLock.lock();
	 try {
		map.put(org.getUserId(), org);
	} catch (Exception e) {
		e.printStackTrace();
	}finally
	{
		writeLock.unlock();
	}
}
}
