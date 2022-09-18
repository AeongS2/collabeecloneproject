package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//추상메서드가 본질인  인터페이스
public interface Action {
	void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException;
}
