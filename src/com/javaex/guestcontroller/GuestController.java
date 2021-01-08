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
				
				rd = request.getRequestDispatcher("./WEB-INF/deleteForm.jsp");
				request.setAttribute("no", no);
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
					response.getWriter().print("비밀번호나 이름이 틀렸습니다\n 다시 입력하시겠습니까?");
					
					response.sendRedirect("./gbc?action=delForm");
				}
				
				
			}
			
			
			
			
			
			
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		
		
	}

}
