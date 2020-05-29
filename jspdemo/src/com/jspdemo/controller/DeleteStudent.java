package com.jspdemo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspdemo.dao.StudentDao;


public class DeleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		int rollNo=Integer.parseInt(request.getParameter("rollNo"));
		
		
	StudentDao std= new StudentDao();
		
		Boolean b=std.deleteStudent(rollNo);
		if(b) {
			out.println("student deleted sucessfully");
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request,response);	
		}
		
		else {
			out.println("student not deleted sucessfully");
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request,response);	
		}
			
		
		
	}

	

}
