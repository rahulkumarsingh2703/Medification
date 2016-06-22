<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-gb" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.theme.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.theme.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/npm"></script>  
<link rel="stylesheet" href="fe/css/bootstrap.min.css" />
<link rel="stylesheet" type="fe/text/css" href="css/isotope.css" media="screen" />
<link rel="stylesheet" href="fe/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<link href="fe/css/animate.css" rel="stylesheet" media="screen">
<link href="fe/js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="fe/css/styles.css" />
<link href="fe/font/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/style.css"> 
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({title: "Rate The Selected Symptom",trigger: "focus"}); 
    $('[data-toggle1="tooltip"]').tooltip({title: "Select Only One",trigger: "hover"});
});
</script>
<style>
iframe {
  margin-top: 10px;
  margin-bottom: 10px;
  float:left;
  -moz-border-radius: 12px;
  -webkit-border-radius: 12px;
  border-radius: 12px;
  height:550px;
  width:100%;
  -moz-box-shadow: 4px 4px 14px #000;
  -webkit-box-shadow: 4px 4px 14px #000;
  box-shadow: 4px 4px 14px #000;
  -moz-transform:rotate(0deg);
  -webkit-transform:rotate(0deg);
  -o-transform:rotate(0deg);
  -ms-transform:rotate(0deg);
  filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=0.0);
  margin: 0;
  padding: 0;
}
div.tooltip{
    max-width: 350px;
}
</style>
<title>Medification</title>
</head>
<body>

<div class="container-fluid" style="text-align: center;">
  <h2>Hospital Directory</h2>
  <p></p>
  <form class="form-inline" role="form">
  <input type="hidden" name="search" value="true">
    <div class="form-group">
    <label for="category">Category:</label>
       <select name="category" id="category"  class="form-control">
                                <option value="">Select Option</option>
                                <option value="All" >All</option>
                                <option value="DENTIST" >DENTIST</option>
                                <option value="HOSPITAL" >HOSPITAL</option>
                                <option value="NURSING HOME" >NURSING HOME</option>
                                
                              </select>
    </div>
    
    <div class="form-group">
      <label for="state">State:</label>
      <select name="state" id="state"  class="form-control">
              <option value="">Select Option</option>
                <option value="All" >All</option>
                                
                                <option value="Andhra Pradesh" >Andhra Pradesh</option>
                                <option value="Assam" >Assam</option>
                                <option value="Bihar" >Bihar</option>
                                <option value="Chandigarh" >Chandigarh</option>
                                <option value="Chattisgarh" >Chattisgarh</option>
                      
                                <option value="Daman and Diu" >Daman and Diu</option>
                                <option value="Delhi" >Delhi</option>
                                <option value="Goa" >Goa</option>
                                <option value="Gujarat" >Gujarat</option>
                                <option value="Haryana" >Haryana</option>
                                <option value="Himachal Pradesh" >Himachal Pradesh</option>
                                <option value="Jammu and Kashmir" >Jammu and Kashmir</option>
                                <option value="Jharkhand" >Jharkhand</option>
                                <option value="Karnataka" >Karnataka</option>
                                <option value="Kerala" >Kerala</option>
                               
                                <option value="Madhya Pradesh" >Madhya Pradesh</option>
                                <option value="Maharashtra" >Maharashtra</option>
                                <option value="Manipur" >Manipur</option>
                                <option value="Meghalaya" >Meghalaya</option>
                                <option value="Mizoram" >Mizoram</option>
                                <option value="Nagaland" >Nagaland</option>
                                <option value="Odisha" >Odisha</option>
                                <option value="Pondicherry" >Pondicherry</option>
                                <option value="Punjab" >Punjab</option>
                                <option value="Rajasthan" >Rajasthan</option>
                        
                                <option value="Tamil Nadu" >Tamil Nadu</option>
                          
                                <option value="Tripura" >Tripura</option>
                                <option value="Uttar Pradesh" >Uttar Pradesh</option>
                                <option value="Uttaranchal" >Uttaranchal</option>
                                <option value="West Bengal" >West Bengal</option>
                              </select>
    </div>
   
    <button type="submit" class="btn btn-default">Search</button>
  </form>
</div>
<br/>
<div id="search">
<% if("true".equals(request.getParameter("search"))){
 		String specialization = request.getParameter("category");
 		String state=request.getParameter("state");
 		try{
			Connection con = DataBaseMgr.getDataBaseMgr().getConnection();
			Statement stmt = con.createStatement();
			
			if(specialization.equals("All") && state.equals("All"))
					{
				
				
				ResultSet rset = stmt.executeQuery("select * from hospitallist");
				if (rset.next() ) {
				    
					
				
				%>
			
				<table class="table table-hover">
    <thead>

				 <tr >
				 	    <th>State</th>
	    				<th>City</th> 
	   					<th>Category</th>
	   					<th>Name</th>
	   					<th>Address1</th>
	   					<th>Address2</th>
	   					<th>Area</th>
	   					<th>Pin-Code</th>
	   					<th>Area-Code</th>
	   					<th>Contact</th>
	 			 </tr>
	 			   </thead>
				 <% do{ %>
				  <tbody>
	         		 <tr>
					 
				 		<td><%= rset.getString(2) %></td>
				 		<td><%= rset.getString(3) %></td>
				 		<td><%= rset.getString(4) %></td>
				 		<td><%= rset.getString(5) %></td>
				 		<td><%= rset.getString(6) %></td>
				 		<td><%= rset.getString(7) %></td>
				 		<td><%= rset.getString(8) %></td>
				 		<td><%= rset.getString(9) %></td>
				 		<td><%= rset.getString(10) %></td>
				 		<td><%= rset.getString(11) %></td>
	 				</tr>
	 				 <tbody>
	 			<%}while (rset.next()); %>
				  </table>
		
				
				<%
				}else{
					/* out.println("Select Specific Values"); */
					%>
 					<br><div class="alert alert-danger">
					  <strong>Error ! </strong>Result Not Found.
					</div><%
				}
				}
				
				
				
			
			else if(state.equals("All"))
			{
		
		
		ResultSet rset = stmt.executeQuery("select * from hospitallist where category ='"+specialization+"'");
		if (rset.next() ) {
		    
			
		
		%>
		 
		 <table class="table table-hover">
		<tr >
				 	    <th>State</th>
	    				<th>City</th> 
	   					<th>Category</th>
	   					<th>Name</th>
	   					<th>Address1</th>
	   					<th>Address2</th>
	   					<th>Area</th>
	   					<th>Pin-Code</th>
	   					<th>Area-Code</th>
	   					<th>Contact</th>
	 			 </tr>
	 			
				 <% do{ %>
				  <tbody>
	         		 <tr>
					 
				 		<td><%= rset.getString(2) %></td>
				 		<td><%= rset.getString(3) %></td>
				 		<td><%= rset.getString(4) %></td>
				 		<td><%= rset.getString(5) %></td>
				 		<td><%= rset.getString(6) %></td>
				 		<td><%= rset.getString(7) %></td>
				 		<td><%= rset.getString(8) %></td>
				 		<td><%= rset.getString(9) %></td>
				 		<td><%= rset.getString(10) %></td>
				 		<td><%= rset.getString(11) %></td>
	 				</tr>
			<%}while (rset.next()); %>
		  </table>

		<%
		}else{
			/* out.println("Select Specific Values"); */
			%>
				<br><div class="alert alert-danger">
			  <strong>Error ! </strong> Please Select value Properly.
			</div><%
		}
		}
			

			else if(specialization.equals("All"))
			{
		
		
		ResultSet rset = stmt.executeQuery("select * from hospitallist where state='"+state+"'");
		if (rset.next() ) {
		    
			
		
		%>
		 
		 <table class="table table-hover">
		<tr >
				 	    <th>State</th>
	    				<th>City</th> 
	   					<th>Category</th>
	   					<th>Name</th>
	   					<th>Address1</th>
	   					<th>Address2</th>
	   					<th>Area</th>
	   					<th>Pin-Code</th>
	   					<th>Area-Code</th>
	   					<th>Contact</th>
	 			 </tr>
	 			   
				 <% do{ %>
				  <tbody>
	         		 <tr>
					 
				 		<td><%= rset.getString(2) %></td>
				 		<td><%= rset.getString(3) %></td>
				 		<td><%= rset.getString(4) %></td>
				 		<td><%= rset.getString(5) %></td>
				 		<td><%= rset.getString(6) %></td>
				 		<td><%= rset.getString(7) %></td>
				 		<td><%= rset.getString(8) %></td>
				 		<td><%= rset.getString(9) %></td>
				 		<td><%= rset.getString(10) %></td>
				 		<td><%= rset.getString(11) %></td>
	 				</tr>
			<%}while (rset.next()); %>
		  </table>
	
		<%
		}else{
			/* out.println("Select Specific Values"); */
			%>
				<br><div class="alert alert-danger">
			  <strong>Error ! </strong> Please Select value Properly.
			</div><%
		}
		}

					
			else
			{
				
			
			ResultSet rset = stmt.executeQuery("select * from hospitallist where state='"+state+"' and category='"+specialization+"'");
			if (rset.next() ) {
			    
				
			
			%>
			
			 <table class="table table-hover">
			<tr >
				 	    <th>State</th>
	    				<th>City</th> 
	   					<th>Category</th>
	   					<th>Name</th>
	   					<th>Address1</th>
	   					<th>Address2</th>
	   					<th>Area</th>
	   					<th>Pin-Code</th>
	   					<th>Area-Code</th>
	   					<th>Contact</th>
	 			 </tr>
	 			  
				 <% do{ %>
				  <tbody>
	         		 <tr>
					 
				 		<td><%= rset.getString(2) %></td>
				 		<td><%= rset.getString(3) %></td>
				 		<td><%= rset.getString(4) %></td>
				 		<td><%= rset.getString(5) %></td>
				 		<td><%= rset.getString(6) %></td>
				 		<td><%= rset.getString(7) %></td>
				 		<td><%= rset.getString(8) %></td>
				 		<td><%= rset.getString(9) %></td>
				 		<td><%= rset.getString(10) %></td>
				 		<td><%= rset.getString(11) %></td>
	 				</tr>
 			<%}while (rset.next()); %>
			  </table>
		
			
			<%
			}else{
				/* out.println("Select Value"); */
				%>
					<br><div class="alert alert-danger">
				  <strong>Error ! </strong>Record Not Found.
				</div><%
			}
			}
			}
		catch(Exception ex)
		{
			ex.printStackTrace();
			out.println("error");
		}
		/* out.println("Search performed"); */
	}

	%>
</div>





</body>
</html>