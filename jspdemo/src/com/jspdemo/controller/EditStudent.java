package com.jspdemo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspdemo.bean.Student;
import com.jspdemo.dao.StudentDao;


public class EditStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		
		int age=Integer.parseInt( request.getParameter("age") );
		int rollNo=Integer.parseInt( request.getParameter("rollNo") );
	
		System.out.println(rollNo);
		
		Student st= new Student();
		st.setName(name);
		st.setAge(age);
		st.setRollno(rollNo);
		StudentDao std =new StudentDao();
		Boolean b= std.edit(st);
		
		if(b) {
			out.println("student edited sucessfully");
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request,response);	
		}
		
		else {
			out.println("student not edited sucessfully");
			RequestDispatcher rd= request.getRequestDispatcher("EditStudent.jsp");
			rd.include(request,response);	
		}
			
		
		
	}

}
