<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip({title: "Rate The Selected Symptom",trigger: "focus"}); 
    $('[data-toggle1="tooltip"]').tooltip({title: "Select Only One",trigger: "hover"});
   });
function goBack() {
    //window.history.back();
	window.history.go(-1);
	//iframe.contentWindow.history.back();
	
   }
   
   
</script>
<style>
div.tooltip{
    max-width: 350px;
}</style>
<title>Medification</title>
</head>
<body>
<div id="search">
<% if("true".equals(request.getParameter("search"))){
	
	try{
	Connection con = DataBaseMgr.getDataBaseMgr().getConnection();
	Statement stmt = con.createStatement();
	String sympppf[] = request.getParameterValues("symppf");
	String rate[] = request.getParameterValues("rate");
	int l=sympppf.length;
	int lr=rate.length;

	if(lr==l)
	{
	
	for(int i=0;i<l;i++)
	{
		stmt.executeQuery("insert into s2 values('"+sympppf[i]+"','"+rate[i]+"')");
		stmt.executeQuery("insert into sympcol values('"+sympppf[i]+"','"+rate[i]+"')");
	}
	
	    ResultSet rsett = stmt.executeQuery("select distinct m.symp3 from module1 m, s1 s,s2 ss where m.symp1=s.symp1 and m.symp2=ss.symp2");
	    
	    if (rsett.next()){
				%>
				<div class="container">
				<form method="post" action="4.jsp" class="form-inline" role="form">
				<input type="hidden" name="search" value="true">
				
				<% do{  %>
				<div class="container-fluid">
				<ul class="nav nav-tabs" role="tablist" >
				<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="symppc" value="<%= rsett.getString(1) %>"><%= rsett.getString(1) %></a></li>
				<li class="dropdown" style="float: right;">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
				<li><a><input type="checkbox" name="rate" value="0"> 0 </a></li>
				<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
				<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
				<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
				<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
				<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
				</ul>
				</li>
				</ul>
				</div>
	            <% }while (rsett.next()); %>
	            
				<br>
				<div class="container-fluid">
				<p class="submit"><input type="submit" name="commit" class="btn btn-primary" value="Submit">
				<input type="reset" class="btn btn-danger" value="Reset"></p>
				</div>
				</form>
				</div>
				<%
			}
	    }
	else
	{
		
		%>
			<div class="alert alert-warning">
			<strong>Error!</strong> Something Went Wrong while Selecting value!!! TRY Again.
			<p><input type="button" class="btn btn-default" value="Back" onclick="goBack()"></p>
			</div>
			<%
	}
 		
 				}
 			catch(Exception ex)
 				{
 				//ex.printStackTrace();
 				//out.println("error");
 				%>
			<div class="alert alert-warning">
			<strong>Error!</strong> Something Went Wrong while Selecting value!!! TRY Again.
			<p><input type="button" class="btn btn-default" value="Back" onclick="goBack()"></p>
			</div>
			<%
 				}
 		}
 	
 		%>
</div>
</body>
</html>