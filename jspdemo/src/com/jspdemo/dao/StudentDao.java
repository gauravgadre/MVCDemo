package com.jspdemo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.jspdemo.bean.Student;
import com.jspdemo.utill.DBConnection;


public class StudentDao {
	
	
	
	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;

	public List<Student> getStudents() {

		List<Student> list = null;
		Student Student = null;

		try {

			list = new ArrayList<Student>();
			String sql = "SELECT * FROM Student";
			connection = DBConnection.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				
				Student = new Student();
				Student.setRollno(resultSet.getInt(1));
				Student.setName(resultSet.getString(2));
				Student.setAge(resultSet.getInt(3));
				
				list.add(Student);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
	
	public boolean save(Student st) {
		boolean status = false;
		try {
			String sql = "INSERT INTO student(name,age )VALUES('"+st.getName()+"','"+st.getAge()+"' )";
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			status = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return status;
	}
	
	
	public Student get(int rollno) {
		Student Student = null;
		try {
			Student = new Student();
			String sql = "SELECT * FROM Student where rollno=" + rollno;
			connection = DBConnection.getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {

				Student.setRollno(resultSet.getInt(1));
				Student.setName(resultSet.getString(2));
				Student.setAge(resultSet.getInt(3));
				
				
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Student;
	}
	
	
	public boolean edit(Student st) {
		boolean flag = false;
		try {
			System.out.println(st.getName());
            System.out.println(st.getAge());
			System.out.println(st.getRollno());
			String sql = "UPDATE  student SET name = '" + st.getName() + "', age = '" + st.getAge()+ "' where rollno=" + st.getRollno();
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public boolean deleteStudent(int rollno) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM student where rollno=" + rollno;
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public int count() {
	int count=0;
		try {
			String sql = "select count(*) from student";
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			ResultSet rs=preparedStatement.executeQuery();
		
		      rs.next();
		     count = rs.getInt(1);
		      System.out.println(count);
		      return count;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
		
	
	
}
