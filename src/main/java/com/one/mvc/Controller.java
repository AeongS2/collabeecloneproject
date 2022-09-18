package com.one.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//num1과 num2가 넘어오고 ActionFactory로 forward함.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("command = " + request.getParameter("command"));
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");  
		//form에서 넘어온 command를 보고  ActionFactory 페이지로 보냄. 해당 action객체 생성, 객체를 리턴해줌.  
		//Action은 인터페이스. action에 객체(의 참조값)이 들어오고 null이 아니면 execute()가 있는 키워드action으로 감. 여기에서 자신들이 뭘 할지 적어놓은 excute()를 실행(그래서 다 뼈대가 같음).
		ActionFactory af = ActionFactory.getInstance();//getAction을 불러오기 위한 것.
		Action action = af.getAction(command);//getAction메서드 실행. 객체가 리턴되어 action으로 대입됨. //다형성?? 부모클래스에 자식 객체
		if(action != null) {
			action.execute(request, response);//대입된 객체의 execute()를 실행함.
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req, resp);
	}
}
