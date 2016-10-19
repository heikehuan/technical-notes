/*
 * Created on 2011-7-20
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package studentinf.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import studentinf.Bean.Studentinf;

/**
 * @author Administrator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class StuInfoDAO {
	Connection conn;
	PreparedStatement pre;
	ResultSet rs;


	/**
	 * 添加学生信息
	 */
	public int insert (Studentinf stu) throws SQLException{
	//	Connection conn = null;
		Statement sta = null;
		int n=0;
				
		String sql = "insert into student32 values (f_get_globalid,'"+stu.getSname()+"','"+stu.getSnumber()+"','"+stu.getSex()+"','"+stu.getSpeciality()+"','"+stu.getBirthday()+"')";				
				
		try{	
			conn = ConnectionManager.getConnection();	
			sta = conn.createStatement();
			n = sta.executeUpdate(sql);			
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				ConnectionManager.close(null,null,sta,conn);
			}
		return n;	
	}
	/**
	 * 显示所有记录
	 * */
	public List getSearch(String sql){
	
		List list = new ArrayList();
		pre = conn.s
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 查看学生信息
	 * @throws SQLException
	 */
	public ArrayList select() throws SQLException{
		
		Connection conn = null;
		Statement sta = null;
		ResultSet rs = null;
				
		String sql = "select * from student32 where sid=? ";
		
		ArrayList arr = new ArrayList();
				
		try{	
			conn = ConnectionManager.getConnection();	
			sta = conn.createStatement();
			rs = sta.executeQuery(sql);
			while(rs.next()){
				Studentinf student = new Studentinf();
				student.setSid(rs.getInt(1));
				student.setSname(rs.getString(2));
				student.setSnumber(rs.getInt(3));
				student.setSex(rs.getString(4));
				student.setSpeciality(rs.getString(5));
				student.setBirthday(rs.getInt(6));
			  
			}
			
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				ConnectionManager.close(rs,null,sta,conn);
			}
		return arr;	
	}


	/**
	 * 删除学生信息
	 * @throws SQLException
	 *  
	 */
	public void delete(Studentinf stu) throws SQLException{

		Connection conn = null;
		Statement sta = null;
		
				
		String sql = "delete from student32 where sid = "+stu.getSid()+"";
		
		
				
		try{	
			conn = ConnectionManager.getConnection();	
			sta = conn.createStatement();
			sta.executeQuery(sql);
			
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				ConnectionManager.close(null,null,sta,conn);
			}
		
	}


	/**
	 * 修改学生信息
	 * @throws SQLException
	 *  
	 */
	public int update(Studentinf stu) throws SQLException{
		Connection conn = null;
		Statement sta = null;
		int n=0;
				
		String sql = "update student32 set sid =f_get_globalid,sname='"+stu.getSname()+"',snumber='"+stu.getSnumber()+"',sex='"+stu.getSex()+"',speciality='"+stu.getSpeciality()+"',birthday='"+stu.getBirthday()+"' where sid="+stu.getSid();				
				
		try{	
			conn = ConnectionManager.getConnection();	
			sta = conn.createStatement();
			n = sta.executeUpdate(sql);			
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				ConnectionManager.close(null,null,sta,conn);
			}
		return n;
		
		 
	}
	/**
	 * 
	 * 
	 *根据ID查询某一条记录
	 * @return 
	 */
	public Studentinf  getSearchById(String sql,int id)
	{
		Studentinf jBean = new Studentinf();
		
		try {
			pre = conn.prepareStatement(sql);
			pre.setInt(1, id);
			rs=pre.executeQuery();
			
			while(rs.next())
			{
				jBean.setSid(rs.getInt("sid"));
				jBean.setSname(rs.getString("sname"));
				jBean.setSnumber(rs.getInt("snumber"));
				jBean.setSex(rs.getString("sex"));
				jBean.setSpeciality(rs.getString("speciality"));
				jBean.setBirthday(rs.getInt("birthday"));
				
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return jBean;	
	}

}
