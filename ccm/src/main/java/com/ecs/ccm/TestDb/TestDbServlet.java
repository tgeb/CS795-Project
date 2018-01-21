package com.ecs.ccm.TestDb;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 //Connection variables
		String userName="omitted";
		String password="ecs@omitted";		
		String jdbcUrl = "jdbc:mysql://localhost:3306/ccm?useSSL=false";
		String driver = "com.mysql.cj.jdbc.Driver";
		
		try {
			PrintWriter out = response.getWriter();
			out.println("Connecting to db: "+ jdbcUrl);
			
			Class.forName(driver);
			
			Connection myConn = DriverManager.getConnection(jdbcUrl, userName, password);
			out.println("Connection is indeed successful");
			myConn.close();
		}
		catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

}
