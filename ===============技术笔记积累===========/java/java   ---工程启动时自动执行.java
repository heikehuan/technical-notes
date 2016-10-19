
�������Ȼû����spring���赥�������������ڿ�ͷ��static,refreshCacheMap�����Զ�ִ��


public  class  OrganizationCache{
	public static Map map=new ConcurrentHashMap<String,Organization>();
	public static BaseServiceImpl  dao=(BaseServiceImpl)SpringContextUtil.getBean("baseService");
	public final static ReadWriteLock lock = new ReentrantReadWriteLock();
	public final static Lock readLock = lock.readLock();
    public final static Lock writeLock = lock.writeLock();
    static{//��ʼ��map
    	try {
			refreshCacheMap() ;
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	/**
 * 
 * ��������ȡ������Ļ�������
 *
 * @Title: getCacheMap  
 * @return
 * @see com.hjhz.orgGroup.cache.IObjectCache#getCacheMap()     
 * @author:  zhangxiaodi
 * @date: 2012-11-5 ����10:49:47
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
 * ������ˢ�»�������
 *
 * @Title: refreshCacheMap  
 * @see com.hjhz.orgGroup.cache.IObjectCache#refreshCacheMap()     
 * @author:  zhangxiaodi
 * @throws InterruptedException 
 * @date: 2012-11-5 ����10:49:23
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
	 * ����: ����id����һ������
	 *
	 * @Title: getObjectById  
	 * @param id
	 * @return    
	 * @return Object    
	 * @author:  zhangxiaodi
	 * @date: 2012-11-7 ����10:57:01
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
