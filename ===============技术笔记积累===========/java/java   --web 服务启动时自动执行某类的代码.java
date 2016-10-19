1.让服务器启动或停止时自动执行代码,原理是使用servlet的监听器，建立一个servlet类并且实现ServletContextListener 接口：
T1.java
package  com.abc.test;

import  java.io.File;
import  java.io.FileWriter;
import  java.io.IOException;

import  javax.servlet.ServletContextEvent;
import  javax.servlet.ServletContextListener;
import  javax.servlet.http.HttpServlet;

public   class  T1  extends  HttpServlet  implements  ServletContextListener {
     // 服务器停止时执行该事件 
     public   void  contextDestroyed(ServletContextEvent sce) {
        DeleteFile(); // 删除启动服务器时建立的文件 
    }
     // 服务器启动时执行该事件 
     public   void  contextInitialized(ServletContextEvent sce) {
        WriteFile(); // 添加一个新的文本文件 
    }

     public   void  WriteFile() {
         try  {
            FileWriter fw  =   new  FileWriter( " c:/WriteData.txt " );
             //  将字符串写入文件 
            fw.write( " Hello World！ " );
            fw.write( " Hello Everyone! " );
            fw.close();
        }  catch  (IOException e) {
        }
    }

     public   void  DeleteFile() {
        File f  =   new  File( " c:/WriteData.txt " );
         //  检查文件是否存在，如果存在，直接删除文件 
         if  (f.exists()) {
            f.delete();
        }
    }

}
类写完后，需要在web.xml中添加一个listener ，以便让该servlet类自动执行，在web.xml中添加如下内容：
 <listener> 
 <listener-class>com.abc.test.T1 </listener-class> 
 </listener>
listener-class里面的内容就是刚才添加的servlet类
现在就可以使用了，我使用的Tomcat5.5服务器，启动服务器，会发现C:盘根目录下建立了文件WriteData.txt，停止服务器，WriteData.txt又会被自动删除。
启动服务时可能需要读取配置信息，可以把配置信息添加到web.xml，比如
<context-param>      
	<param-name>YourName</param-name>      
	<param-value>YourValue</param-value>  
</context-param>
在Servlet中可以这么读取：
this.getServletContext().getInitParameter("YourName");

2.Web服务启动时自动加载Servlet，并读取数据库内容
在web.xml这样定义一个servlet： 
 如果需要自启动，修改如下： 
<servlet>
<servlet-name>t1</servlet-name>
<servlet-class>com.abc.test.T1</servlet-class>
<load-on-startup>1</load-on-startup>
</servlet>

 <load-on-startup>标记web容器是否在启动的时候就加载这个servlet
当值为0或者大于0时，表示web容器在应用启动时就加载这个servlet；
当是一个负数时或者没有指定时，则指示容器在该servlet被选择时才加载；
正数的值越小，启动该servlet的优先级越高。
在写这个Servlet里，需要重写init()方法，其他如doGet(),doPost()是执行不到的。下面是一个最简单的例子：

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

重启web容器，在控制台可以看到"test"这么一行信息。
然后我们来修改我们的代码，让这个Servlet可以读取数据库的内容，并进行相关的处理。
我操作数据库用的是spring的HibernateTemplate和JdbcTemplate，访问数据库是以bean注入的方式，在action里注入service的实现，读取数据库数据，其实现在的关键就是得到这个service的实例化对象，以前我写的一篇文章，这里可以派上用场了：JSP学习笔记(五十)：spring中自动加载配置文件，及读取方法

现在来看一下我们如何写这个servlet，代码如下：
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
		List list = service.getList();	// list就是从数据库取到的内容，你可以做相关的处理
	}
}

yourServiceId 就是在spring配置文件里面配置的<bean id="yourServiceId">。很简单吧，然后你就可以做相关的操作了，比如要执行sql脚本，或者把从数据库里面取出来的数据放到application，或者static String里，等等。

3.spring中自动加载配置文件，及读取方法 
配置web.xml，添加如下内容：   
<context-param>        
	<param-name>contextConfigLocation</param-name>        
	<param-value>/WEB-INF/applicationContext.xml</param-value>   
</context-param>  
<listener>        
	<listener-class> org.springframework.web.context.ContextLoaderListener</listener-class>   
</listener>

这样在web容器启动时，将自动加载spring的配置文件，配置文件有多个时，可以用空格，或者逗号，或者冒号隔开。
下面我们就可以直接使用了，而不用再通过ClassPathXmlApplicationContext等方式重新加载，下面是获取的代码：
 ServletContext sc = ServletActionContext.getServletContext(); //获取ServletContext，在不同的情景，获取方式不同，这里是struts2里action类里的获取方式
  WebApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
 ac.getBean("beanid"); //这里获得配置文件里对应的bean id

<servlet>
	<servlet-name>t1</servlet-name>
	<servlet-class>com.abc.test.T1</servlet-class>
</servlet>

 

