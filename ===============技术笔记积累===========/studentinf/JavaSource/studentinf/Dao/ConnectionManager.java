/*
 * Created on 2011-7-19
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package studentinf.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

/**
 * @author Administrator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ConnectionManager {
	
	private  static ConnectionManager cf = new ConnectionManager();
	private  ConnectionManager(){
	//�������ݿ�����	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,"���ݿ���������쳣");
		}
		
	}
	
	public static Connection getConnection() throws SQLException{
	//��������
		String url="jdbc:oracle:thin:@172.16.1.248:1521:jtcrma";
		return DriverManager.getConnection(url,"jtcrm_app","test_pass");				
	}
	//�ر�����
	public static void close(ResultSet rs,PreparedStatement pre,
			Statement sta,Connection conn) throws SQLException{
		
		if(rs!=null){
			rs.close();
		}
		if(pre!=null){
			pre.close();
		}
		if(sta!=null){
			sta.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
	

}
