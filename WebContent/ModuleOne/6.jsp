<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medification</title>
</head>
<body>
<div id="search">
<% if("true".equals(request.getParameter("search"))){
	try{
		Connection con = DataBaseMgr.getDataBaseMgr().getConnection();
		Statement stmt = con.createStatement();
		Statement stmtq = con.createStatement();
		Statement stmtqq = con.createStatement();
		ResultSet rset=stmt.executeQuery("select distinct s.symp1,s.rate1,ss.symp2,ss.rate2,sss.symp3,sss.rate3,ssss.symp4,ssss.rate4,d.dp from module1 m,s1 s,s2 ss, s3 sss, s4 ssss, diseasepredicted d where m.symp1=s.symp1 and m.symp2=ss.symp2 and m.symp3=sss.symp3 and m.symp4=ssss.symp4 and m.disease_name=d.dp ");
		int count=0;
		if (rset.next()){
			do{
	 			String str1=rset.getString(1);
	 			String str2=rset.getString(2);
	 			String str3=rset.getString(3);
	 			String str4=rset.getString(4);
	 			String str5=rset.getString(5);
	 			String str6=rset.getString(6);
	 			String str7=rset.getString(7);
	 			String str8=rset.getString(8);
	 			String str9=rset.getString(9);
	 			
	 			float r1=Integer.parseInt(str2);
	 			float r2=Integer.parseInt(str4);
	 			float r3=Integer.parseInt(str6);
	 			float r4=Integer.parseInt(str8);
	 			
	 			float avg=((((r1+r2+r3+r4)/4)/5)*100);
	 			
	 			 stmtq.executeQuery("insert into finalpredition values('"+str1+"','"+str2+"','"+str3+"','"+str4+"','"+str5+"','"+str6+"','"+str7+"','"+str8+"','"+str9+"','"+avg+"')");
	 			 stmtq.executeQuery("insert into diseaseres values('"+str9+"')");
	 			 
				 } while (rset.next());
stmtqq.executeQuery("delete from s1");
stmtqq.executeQuery("delete from s2");
stmtqq.executeQuery("delete from s3");
stmtqq.executeQuery("delete from s4");
stmtqq.executeQuery("delete from diseasepredicted");
}
		%>
		<div class="login">
		<form method="post" action="Prediction.jsp">
		<input type="hidden" name="search" value="true">
		<p class="submit"><input type="submit" name="commit" class=".btn-warning" value="Predict"></p>
		</form>
		</div><% 
}
	catch(Exception ex)
	{
		ex.printStackTrace();
		out.println("error");
	}
	
}
%>
</div>
</body>
</html>