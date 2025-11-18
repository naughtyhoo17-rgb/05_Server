package edu.kh.jsp2.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/el/scope")
public class ELTestServlet2 extends HttpServlet{
	
	// a 태그에 대한 요청은 무조건 GET, thus doGet() 오버라이딩
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
		
		// 요청 처리
		
		/* 1. page scope => JSP 파일에서만 확인 가능 (딱 1 페이지만 유효)
		   2. request scope => 요청받은 Servlet과 위임된 JSP까지 유지되는 객체
		   3. session scope => 클라이언트가 서버에 첫 요청 시 서버 쪽에 생성되는 객체,
		   					 브라우저를 종료하거나 지정된 세션 만료 시간이 지나면 사라짐
		  					 unless 계속 유지 (thus 로그인한 사람의 정보 등을 저장)
		   4. application scope => 서버 전체에 1개만 존재하는 객체, thus 모든 클라이언트가 공유
	    						 서버 시작 시 생성 & 서버 종료 시 소멸 */
		
		// request scope(req 객체)
		// 1) 객체에 값(속성) 추가하는 방법 => 범위객체.setAttribute("key", value);
		// 2) 객체에서 값(속성) 얻어오는 방법 => 범위객체.getAttribute("key");
		req.setAttribute("requestValue", "request scope 객체에 세팅한 값");
		// 범위객체에 세팅한 값(속성) 형태 => K:V
		// requestValue = request scope 객체에 세팅한 값
		
		// session scope
		// 1) session scope 객체 얻어오기
		HttpSession session = req.getSession(); 
		// 2) session scope 값 세팅
		session.setAttribute("sessionValue", "session scope 객체에 세팅한 값");
		// sessionValue = session scope 객체에 세팅한 값
		
		// application scope
		// 1) application scope 객체 얻어오기
		ServletContext application= req.getServletContext();
		// 2) application scope 값 세팅
		application.setAttribute("applicationValue", "application scope에 세팅된 값");
		// ----------------------------------------------------------------------------
		
		/* 범위별 우선순위 확인!
		 => 좁은 범위가 우선순위가 높다
		 	page > request > session > application */
		
		// key값을 동일하게 하여 범위별 객체에 값 추가
		req.setAttribute("menu", "짬뽕(request)");
		session.setAttribute("menu", "짜장(session)");
		application.setAttribute("menu", "볶음밥(application)");
		
		
		// ---------------------------------------------------------------------------
		// 응답 처리
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/el/scope.jsp");
		
		dispatcher.forward(req, resp);
		
		
		
		
		
	}

}
