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


public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		
		int age=Integer.parseInt( request.getParameter("age") );
		
		Student st= new Student();
		st.setName(name);
		st.setAge(age);
		
		StudentDao std =new StudentDao();
		Boolean b= std.save(st);
		
		if(b) {
			out.println("student added sucessfully");
			RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
			rd.include(request,response);	
		}
		
		else {
			out.println("student not added sucessfully");
			RequestDispatcher rd= request.getRequestDispatcher("AddStudent.jsp");
			rd.include(request,response);	
		}
			
			
		}
		
	}


