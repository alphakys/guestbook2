package com.javaex.guestcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.guestbook.GuestDao;
import com.javaex.guestbook.GuestVo;

@WebServlet("/gbc")
public class GuestController extends HttpServlet {
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String action = request.getParameter("action");
			//String name = request.getParameter("name");
			//String password = request.getParameter("password");
			//String content = request.getParameter("content");
			//int no = Integer.parseInt(request.getParameter("no"));

			
			
			GuestDao gd = new GuestDao();
			
			RequestDispatcher rd = null;
			
			if("list".equals(action)) {
				
				List<GuestVo> gList = gd.getList();
				
				rd = request.getRequestDispatcher("./WEB-INF/list.jsp");
				request.setAttribute("guestList", gList);
				
				rd.forward(request, response);
				
			}
		
			else if("delForm".equals(action)) {
				int no = Integer.parseInt(request.getParameter("no"));
				
				rd = request.getRequestDispatcher("./WEB-INF/deleteForm.jsp?no="+request.getParameter("no"));
				
				rd.forward(request, response);
			}
			
			else if("delete".equals(action)) {
				int no = Integer.parseInt(request.getParameter("no"));
				
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				
				int result = gd.delete(no, name, password);
				
				if(result==1) {
					response.sendRedirect("./gbc?action=list");
				}
				else{
					
					response.sendRedirect("./gbc?action=delForm&no="+request.getParameter("no"));
				}
			
				
			}
			
			else if("insert".equals(action)) {
				
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				String content = request.getParameter("content");
				
				GuestVo gv = new GuestVo(name, password, content);
				gd.insert(gv);
				
				response.sendRedirect("./gbc?action=list");
				
			}
			
			else if("upForm".equals(action)) {
				
				rd = request.getRequestDispatcher("./WEB-INF/updateForm.jsp?no="+request.getParameter("no"));
				
				rd.forward(request, response);
			}
			
			
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		
		
	}

}
