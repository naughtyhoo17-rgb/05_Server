package edu.kh.jsp2.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/fr/redirect")
public class RedirectServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
		
		// request scope에 속성값 추가
		req.setAttribute("str2", "request scope에 세팅된 값");
		
		// session scope에 속성값 추가
		HttpSession session = req.getSession();
		session.setAttribute("sessionNum", 10000);
		
		// 재요청 (redirect, not forward)
			/* resp.sendRedirect("다시 요청할 Servlet 주소");
			  => 파일 경로가 아닌 재요청할 Servlet의 @WebServlet(주소)에 작성된 주소를 작성!
			 
			  *** 재요청(redirect) 무조건 GET 방식(요청) ***    */
		resp.sendRedirect("/fr/result");
		
	}
	
}
