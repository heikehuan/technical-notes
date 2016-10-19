1.�÷�����������ֹͣʱ�Զ�ִ�д���,ԭ����ʹ��servlet�ļ�����������һ��servlet�ಢ��ʵ��ServletContextListener �ӿڣ�
T1.java
package  com.abc.test;

import  java.io.File;
import  java.io.FileWriter;
import  java.io.IOException;

import  javax.servlet.ServletContextEvent;
import  javax.servlet.ServletContextListener;
import  javax.servlet.http.HttpServlet;

public   class  T1  extends  HttpServlet  implements  ServletContextListener {
     // ������ֹͣʱִ�и��¼� 
     public   void  contextDestroyed(ServletContextEvent sce) {
        DeleteFile(); // ɾ������������ʱ�������ļ� 
    }
     // ����������ʱִ�и��¼� 
     public   void  contextInitialized(ServletContextEvent sce) {
        WriteFile(); // ���һ���µ��ı��ļ� 
    }

     public   void  WriteFile() {
         try  {
            FileWriter fw  =   new  FileWriter( " c:/WriteData.txt " );
             //  ���ַ���д���ļ� 
            fw.write( " Hello World�� " );
            fw.write( " Hello Everyone! " );
            fw.close();
        }  catch  (IOException e) {
        }
    }

     public   void  DeleteFile() {
        File f  =   new  File( " c:/WriteData.txt " );
         //  ����ļ��Ƿ���ڣ�������ڣ�ֱ��ɾ���ļ� 
         if  (f.exists()) {
            f.delete();
        }
    }

}
��д�����Ҫ��web.xml�����һ��listener ���Ա��ø�servlet���Զ�ִ�У���web.xml������������ݣ�
 <listener> 
 <listener-class>com.abc.test.T1 </listener-class> 
 </listener>
listener-class��������ݾ��Ǹղ���ӵ�servlet��
���ھͿ���ʹ���ˣ���ʹ�õ�Tomcat5.5���������������������ᷢ��C:�̸�Ŀ¼�½������ļ�WriteData.txt��ֹͣ��������WriteData.txt�ֻᱻ�Զ�ɾ����
��������ʱ������Ҫ��ȡ������Ϣ�����԰�������Ϣ��ӵ�web.xml������
<context-param>      
	<param-name>YourName</param-name>      
	<param-value>YourValue</param-value>  
</context-param>
��Servlet�п�����ô��ȡ��
this.getServletContext().getInitParameter("YourName");

2.Web��������ʱ�Զ�����Servlet������ȡ���ݿ�����
��web.xml��������һ��servlet�� 
 �����Ҫ���������޸����£� 
<servlet>
<servlet-name>t1</servlet-name>
<servlet-class>com.abc.test.T1</servlet-class>
<load-on-startup>1</load-on-startup>
</servlet>

 <load-on-startup>���web�����Ƿ���������ʱ��ͼ������servlet
��ֵΪ0���ߴ���0ʱ����ʾweb������Ӧ������ʱ�ͼ������servlet��
����һ������ʱ����û��ָ��ʱ����ָʾ�����ڸ�servlet��ѡ��ʱ�ż��أ�
������ֵԽС��������servlet�����ȼ�Խ�ߡ�
��д���Servlet���Ҫ��дinit()������������doGet(),doPost()��ִ�в����ġ�������һ����򵥵����ӣ�

package com.abc.test;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class T1 extends HttpServlet {
	public T1() {
	  super ();
	}

	public void init() throws ServletException {
		System.out.println("test");
	}
}

����web�������ڿ���̨���Կ���"test"��ôһ����Ϣ��
Ȼ���������޸����ǵĴ��룬�����Servlet���Զ�ȡ���ݿ�����ݣ���������صĴ���
�Ҳ������ݿ��õ���spring��HibernateTemplate��JdbcTemplate���������ݿ�����beanע��ķ�ʽ����action��ע��service��ʵ�֣���ȡ���ݿ����ݣ���ʵ���ڵĹؼ����ǵõ����service��ʵ����������ǰ��д��һƪ���£�������������ó��ˣ�JSPѧϰ�ʼ�(��ʮ)��spring���Զ����������ļ�������ȡ����

��������һ���������д���servlet���������£�
package com.abc.test;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.abc.test.Service1;

public class T1 extends HttpServlet {

	public T1() {
		super();
	}

	public void init() throws ServletException {
		ServletContext sc = getServletContext();
		WebApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
		Service1 service = (Service1) ac.getBean("yourServiceId");
		List list = service.getList();	// list���Ǵ����ݿ�ȡ�������ݣ����������صĴ���
	}
}

yourServiceId ������spring�����ļ��������õ�<bean id="yourServiceId">���ܼ򵥰ɣ�Ȼ����Ϳ�������صĲ����ˣ�����Ҫִ��sql�ű������߰Ѵ����ݿ�����ȡ���������ݷŵ�application������static String��ȵȡ�

3.spring���Զ����������ļ�������ȡ���� 
����web.xml������������ݣ�   
<context-param>        
	<param-name>contextConfigLocation</param-name>        
	<param-value>/WEB-INF/applicationContext.xml</param-value>   
</context-param>  
<listener>        
	<listener-class> org.springframework.web.context.ContextLoaderListener</listener-class>   
</listener>

������web��������ʱ�����Զ�����spring�������ļ��������ļ��ж��ʱ�������ÿո񣬻��߶��ţ�����ð�Ÿ�����
�������ǾͿ���ֱ��ʹ���ˣ���������ͨ��ClassPathXmlApplicationContext�ȷ�ʽ���¼��أ������ǻ�ȡ�Ĵ��룺
 ServletContext sc = ServletActionContext.getServletContext(); //��ȡServletContext���ڲ�ͬ���龰����ȡ��ʽ��ͬ��������struts2��action����Ļ�ȡ��ʽ
  WebApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
 ac.getBean("beanid"); //�����������ļ����Ӧ��bean id

<servlet>
	<servlet-name>t1</servlet-name>
	<servlet-class>com.abc.test.T1</servlet-class>
</servlet>

 

