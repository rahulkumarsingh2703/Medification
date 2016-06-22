package com.project.dm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import com.project.dm.SendHtmlMail;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.project.dm.SendHtmlMail;
import com.project.db.DataBaseMgr;
import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;  
import java.util.Random;


public class SignupUser extends HttpServlet {

	private static final long serialVersionUID = 1L;
	RequestDispatcher rd;
	String name;
	String email;
	String phone;
	String password;
	
	Statement stmt;
	String query;
	

	
	public SignupUser() {
        
        // TODO Auto-generated constructor stub
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			PrintWriter out = response.getWriter();
	
			name = request.getParameter("name");
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			password = request.getParameter("password");
			
		
		
			query = "INSERT INTO loginuser " +
	                "VALUES ('"+name+"','"+email+"','"+phone+"','"+password+"')";
			
			
			try{
				Connection con; 
				con=DataBaseMgr.getDataBaseMgr().getConnection();
				out.println("Successfully SignedUp"+ name);
				stmt = con.createStatement();
				stmt.executeUpdate(query);
				rd = request.getRequestDispatcher("index.jsp");	
				rd.forward(request, response);
				if (con != null) {
					System.out.println("nSuccessfullly connected to Oracle DB");}
				
				SendHtmlMail.mail(email,password);
			
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				out.println("Error");
				
				
			}
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			
		
			
			doGet(request, response);
		}

	}

