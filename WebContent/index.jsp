%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,
java.sql.ResultSet,java.util.Properties, 
javax.mail.internet.MimeMessage,  
javax.mail.internet.*,
java.util.Random,
java.util.*,
javax.activation.*" %>
<%@ page import="com.project.dm.*" %>
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,java.sql.ResultSet,
java.io.BufferedReader,
java.io.FileReader,


java.io.BufferedReader,
java.io.FileReader,

java.io.File,
java.io.FileNotFoundException,

org.apache.jasper.*,
javax.servlet.*,
javax.*,
java.lang.*,
java.io.PrintWriter.*,

java.io.BufferedReader.*,
java.io.FileReader.*,

org.apache.log4j.*,
java.io.File.*,
java.io.FileNotFoundException.*,
org.apache.log4j.Logger.*,

org.apache.jasper.*,
java.lang.*,
javax.servlet.*,
java.io.PrintWriter.*"%>

<%@ page import="java.util.Properties " %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.net.InetAddress.*" %>
<%@ page import="javax.mail.Transport.*" %>
<%@ page import="javax.mail.Message.RecipientType.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medification</title>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="" />
<script type="text/javascript" src="lg/js/bootstrap.js"></script>
<script type="text/javascript" src="lg/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lg/js/npm"></script>  
<link rel="stylesheet" type="text/css" href="lg/css/bootstrap.theme.min.css">
<link rel="stylesheet" type="text/css" href="lg/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="lg/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="lg/css/bootstrap.theme.css">
<link href="lg/css/style.css" rel="stylesheet" type="text/css" media="all"/>

<!--script-->
<script src="lg/js/jquery.min.js"></script>
<script src="lg/js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
				
</script>	
</head>
<body>
	<div class="head" >
		<div class="logo">
			<div class="logo-top">
				<h1><strong style="font-weight: bolder;">"Medification"</strong><br><br>Your Health Our Responsibility</h1>
			</div>
			<div class="logo-bottom">
				<section class="sky-form">									
					<!-- <label class="radio"><input type="radio" name="radio" checked=""><i></i></label>
					<label class="radio"><input type="radio" name="radio"><i></i>Nullam rutrum sagittis interdum</label>										
					<label class="radio"><input type="radio" name="radio"><i></i>Nam cursus eros sed elit</label> -->
				</section>
			</div>
		</div>		
		<div class="login">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Login</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><label>/</label><span>Sign up</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><label>/</label><span>For Doctors</span></li>
						<div class="clearfix"></div>
					</ul>				  	 
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="login-top">
								<form method="post" action="login">
				<p style="text-align: center;color: red"><%
        		if(request.getAttribute("errMsg") != null){
        		out.println((String)request.getAttribute("errMsg"));
        		request.setAttribute("errMsg",null);
        		}
        		%></p>
									<input type="text" class="email" name="email" placeholder="Email" required=""/>
									<input type="password" class="password" name="password" placeholder="Password" required=""/>		
								
								<div class="login-bottom login-bottom1">
									<div class="submit">
										<input type="submit" name="commit" value="LOGIN"/>
									</div>
									<ul>
										<li><p>Or login with</p></li>
										<li><a href="#"><span class="fb"></span></a></li>
										<li><a href="#"><span class="twit"></span></a></li>
										<li><a href="#"><span class="google"></span></a></li>
									</ul>
									<div class="clear"></div>
								</div>
								</form>	
							</div>
						</div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						<div class="login-top">
								<form  method="post" action="index.jsp">
								<input type="hidden" name="search" value="true">
									<input type="text" class="name active" name="name" placeholder="Your Name" required=""/>
									<input type="text" class="email" name="email" placeholder="Email" required=""/>
									<input type="text" class="phone" name="phone" placeholder="Phone No." required=""/>
									<!-- <input type="password" class="password" name="password" placeholder="Password" required=""/>  -->
									
								
								
								<div class="login-bottom">
									<div class="submit">
										<input type="submit" name="commit" value="SIGN UP"/>
									</div>
									<ul>
										<li><p>Or login with</p></li>
										<li><a href="#"><span class="fb"></span></a></li>
										<li><a href="#"><span class="twit"></span></a></li>
										<li><a href="#"><span class="google"></span></a></li>
									</ul>
									<div class="clear"></div>
								</div>	
								</form>
							</div>
							
						</div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
						<div class="login-top">
								<form>
									<!-- <input type="text" class="name active" placeholder="Your Name" required=""/> -->
									<input type="text" class="email" placeholder="Email" required=""/>
									<input type="password" class="password" placeholder="Password" required=""/>		
								</form>
								<div class="login-bottom">
									<div class="submit">
										<input type="submit" value="LOGIN"/>
									</div>
									<ul>
										<li><p>Or login with</p></li>
										<li><a href="#"><span class="fb"></span></a></li>
										<li><a href="#"><span class="twit"></span></a></li>
										<li><a href="#"><span class="google"></span></a></li>
									</ul>
									<div class="clear"></div>
								</div>	
							</div>
							
						</div>										
					</div>	
				</div>
			</div>	
		</div>	
		<div class="clear"></div>
	</div>	
	
	
	<div id="search">
<% if("true".equals(request.getParameter("search"))){
 		String name = request.getParameter("name");
 		String email = request.getParameter("email");
 		String phone = request.getParameter("phone");
 		/* String password1 = request.getParameter("password"); */
 		int r;
 		
 	
 
 		
 	    final String CHAR_LIST =
 		        "abcdefghijklmnopqrstuvwxyz1234567890";
 		   final int RANDOM_STRING_LENGTH = 6;
 		     
 		  
 		 %><%!    
 		    public int getRandomNumber() {
		        int randomInt = 0;
		        Random randomGenerator = new Random();
		        randomInt = randomGenerator.nextInt(36);
		        if (randomInt - 1 == -1) {
		        	return randomInt;
		        } else {
		        	return randomInt - 1;
		        }
 		    }
		   %>
 		    <%     
 		        StringBuffer randStr = new StringBuffer();
 		        for(int i=0; i<RANDOM_STRING_LENGTH; i++){
 		            int number = getRandomNumber();
 		            char ch = CHAR_LIST.charAt(number);
 		            randStr.append(ch);
 		        }
 		        String ps= randStr.toString();
 		   
 		     
 		   System.out.println(ps);

 		
 		
 		
 		
 	  
 	 
 	    
 	  String to=email;//change accordingly  
 	  
 	   //Get the session object  
 	  Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session1 = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("projectmedification","projmedi");
				}
			});

		try {

			Connection con = DataBaseMgr.getDataBaseMgr().getConnection();
			Statement stmt = con.createStatement();
			
			stmt.executeQuery("insert into loginuser values('"+name+"','"+email+"','"+phone+"','"+ps+"')");			
			
			Message message = new MimeMessage(session1);
			message.setFrom(new InternetAddress("projectmedification@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject("Medification: Password");
			message.setText("\nYour login credential for MEDIFICATION is: \n " + "\nName: "+ name + "\nPhone Number: "+ phone + "\nUsername: "+ to +  "\nPassword: " + ps);
			Transport.send(message);
			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

	}
%>


   
 	
</div>
	
	<!-- <div class="account">
			<ul>
				<li><p>Don't have an <a href="#">account?</a></p></li><span>/</span>
				<li><p>Forgot <a href="#">password?</a></p></li>
				<div class="clear"></div>
			</ul>
		</div> -->

	<div class="footer">
		<p><a href="" target="_blank">Medification</a> </p>
	</div>
</body>
<script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>
</html>