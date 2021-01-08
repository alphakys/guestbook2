package com.javaex.guestcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.guestdao.GuestDao;
import com.javaex.guestvo.GuestVo;
import com.javaex.util.WebUtil;

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
				request.setAttribute("guestList", gList);				
				
				WebUtil.forward("./WEB-INF/list.jsp", request, response);
				
				
			}
		
			else if("delForm".equals(action)) {
				int no = Integer.parseInt(request.getParameter("no"));
				
				//파일 위치
				WebUtil.forward("./WEB-INF/deleteForm.jsp", request, response);
			}
			
			else if("delete".equals(action)) {
				int no = Integer.parseInt(request.getParameter("no"));
				
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				
				int result = gd.delete(no, name, password);
				
				if(result==1) {
					WebUtil.redirect("./gbc?action=list", response);
				}
				
				else{
					
					request.setAttribute("result", result);
					WebUtil.forward("./WEB-INF/deleteForm.jsp", request, response);
					//url
				}
			
				
			}
			
			else if("insert".equals(action)) {
				
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				String content = request.getParameter("content");
				
				GuestVo gv = new GuestVo(name, password, content);
				gd.insert(gv);
				
				WebUtil.redirect("./gbc?action=list", response);
				
			}
			
			else if("upForm".equals(action)) {
				
				int no = Integer.parseInt(request.getParameter("no"));
				
				request.setAttribute("guest", gd.getGuest(no));				

				WebUtil.forward("./WEB-INF/updateForm.jsp", request, response);
			}
			
			else if("update".equals(action)) {
				
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				String content = request.getParameter("content");
				int no = Integer.parseInt(request.getParameter("no"));
				
				GuestVo gv = new GuestVo(no, name, password, content);
				
				int result = gd.update(gv);
				
				if(result==1) {
					WebUtil.redirect("./gbc?action=list", response);
					
					
				}
				else{
					
					request.setAttribute("guest", gd.getGuest(no));
					request.setAttribute("result",result);
					
					WebUtil.forward("./WEB-INF/updateForm.jsp", request, response);
					
				}
				
			}
			
			else {
				
				WebUtil.redirect("./gbc?action=list", response);
				
			}
			
			
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		
		
	}

}
