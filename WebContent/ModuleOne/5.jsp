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
	String sympppo[] = request.getParameterValues("symppo");
	String rate[] = request.getParameterValues("rate");
	int l=sympppo.length;
	int lr=rate.length;
	if(lr==l)
	{
	for(int i=0;i<l;i++)
	{
		stmt.executeQuery("insert into s4 values('"+sympppo[i]+"','"+rate[i]+"')");
		stmt.executeQuery("insert into sympcol values('"+sympppo[i]+"','"+rate[i]+"')");
	}
	
	    ResultSet rsett = stmt.executeQuery("select distinct m.disease_name from module1 m, s1 s,s2 ss,s3 sss,s4 ssss where m.symp1=s.symp1 and m.symp2=ss.symp2 and m.symp3=sss.symp3 and m.symp4=ssss.symp4 ");
	    int count=0;
	    String[] s=new String[100];
	    if (rsett.next()){
				 do{ count++; 
	             s[count++]=rsett.getString(1);
				} while (rsett.next()); 
				
				for(int i=1;i<count;i++)
				{
				if(s[i] != null)
				 stmt.executeQuery("insert into diseasepredicted values('"+s[i]+"')");
				}
				%>
	            <!-- <div class="container">
				<form method="post" action="6.jsp" class="form-inline" role="form">
				<input type="hidden" name="search" value="true">
				<p class="submit"><input type="submit" name="commit" value="search"></p>
				</form>
				</div> -->
				 <%
				 }
	 
 		
 	Connection con1 = DataBaseMgr.getDataBaseMgr().getConnection();
	Statement stmt1 = con1.createStatement();
	Statement stmtq = con1.createStatement();
	Statement stmtqq = con1.createStatement();
	ResultSet rset1=stmt1.executeQuery("select distinct s.symp1,s.rate1,ss.symp2,ss.rate2,sss.symp3,sss.rate3,ssss.symp4,ssss.rate4,d.dp from module1 m,s1 s,s2 ss, s3 sss, s4 ssss, diseasepredicted d where m.symp1=s.symp1 and m.symp2=ss.symp2 and m.symp3=sss.symp3 and m.symp4=ssss.symp4 and m.disease_name=d.dp ");
	
	if (rset1.next()){
		do{
 			String str1=rset1.getString(1);
 			String str2=rset1.getString(2);
 			String str3=rset1.getString(3);
 			String str4=rset1.getString(4);
 			String str5=rset1.getString(5);
 			String str6=rset1.getString(6);
 			String str7=rset1.getString(7);
 			String str8=rset1.getString(8);
 			String str9=rset1.getString(9);
 			
 		
 			
 			
 			 stmtq.executeQuery("insert into finalpredition values('"+str1+"','"+str2+"','"+str3+"','"+str4+"','"+str5+"','"+str6+"','"+str7+"','"+str8+"','"+str9+"')");
 			 stmtq.executeQuery("insert into diseaseres values('"+str9+"')");
 			 
			 } while (rset1.next());
stmtqq.executeQuery("delete from s1");
stmtqq.executeQuery("delete from s2");
stmtqq.executeQuery("delete from s3");
stmtqq.executeQuery("delete from s4");
stmtqq.executeQuery("delete from diseasepredicted");
}
	%>
	<div class="search">
	<form method="post" action="Prediction.jsp">
	<input type="hidden" name="search" value="true">
	<p class="submit"><input type="submit" class="btn btn-primary btn-block" name="commit" value="Predict"></p>
	</form>
	</div><% 
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