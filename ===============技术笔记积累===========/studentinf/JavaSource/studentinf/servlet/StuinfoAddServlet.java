package studentinf.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentinf.Bean.Studentinf;
import studentinf.Dao.StuInfoDAO;

public class StuinfoAddServlet extends HttpServlet {
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public StuinfoAddServlet() {
		super();
	}

	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest arg0, HttpServletResponse arg1)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest arg0, HttpServletResponse arg1)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		
	//	int sid = Integer.parseInt(request.getParameter("sid"));
		String sname = request.getParameter("sname");
		int snumber = Integer.parseInt(request.getParameter("snumber"));
		String sex = request.getParameter("sex");
		String speciality = request.getParameter("speciality");
		int birthday = Integer.parseInt(request.getParameter("birthday"));
		
		Studentinf stu = new Studentinf();
	//	stu.setSid(sid);
		stu.setSname(sname);
		stu.setSnumber(snumber);
		stu.setSex(sex);
		stu.setSpeciality(speciality);
		stu.setBirthday(birthday);
		
		String jsp="/add.jsp";
		int n=0;
		StuInfoDAO stuinf=new StuInfoDAO();
		
		try {
			n=stuinf.insert(stu);
			
		} catch (SQLException e) {
			request.setAttribute("fail","fail");
			e.printStackTrace();
		}
		
		if(n>0){
			jsp="/success.jsp";
			request.setAttribute("info","³É¹¦£¡");
		}
		RequestDispatcher re = this.getServletContext().getRequestDispatcher(jsp);
		re.forward(request, response);
				
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		System.out.println("-----------------");
	}
}