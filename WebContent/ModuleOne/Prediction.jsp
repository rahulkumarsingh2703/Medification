<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet" %>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<link rel="stylesheet" type="text/css" href="css/style.css"> 
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">

<title>Medification</title>
</head>
<body>
<div id="search">
<% if("true".equals(request.getParameter("search"))){
	
	try{
		Connection con = DataBaseMgr.getDataBaseMgr().getConnection();
		Connection conn = DataBaseMgr.getDataBaseMgr().getConnection();
	   
		Statement stmt = con.createStatement();
		Statement stmtq = con.createStatement();
		Statement stmtqq = conn.createStatement();
		Statement stmtqqq = conn.createStatement();
		
		
		ResultSet rset=stmt.executeQuery("select symp from sympcol");
		ResultSet rsett=stmtq.executeQuery("select distinct diseasename from diseaseres");
		String usersymp[] = new String[100];
		String userdisease[] = new String[100];
		String sympdata[] = new String[100];
		String des;
		int res;
		int j=0;
		String str1="";
		int ii,jj;
		String o="";
		float r,rate=0;
		int k=0;
		String query;
		
		String disease[]=new String[10];
		int risk[]=new int[10];
		
		
		 if (rset.next()){
			do{
			str1=rset.getString("symp");
			usersymp[j]=str1;
			str1="";
			j++;
			} while (rset.next());
			
			 /* for(int i=0;i<j;i++)
			{ 
			out.println(usersymp[i]);
			}  */
			}
		
		 
		 if (rsett.next()){
			do{
			str1=rsett.getString("diseasename");
			userdisease[k]=str1;
			str1="";
			k++;
			} while (rsett.next());
			
			/* for(int i=0;i<k;i++)
			{ 
			out.println(userdisease[i]);
			} */
			}
		
		
		int p=0;
		int count=0;
		
		for(int i=0;i<k;i++)
		{ 
			
			o=userdisease[i];
			//out.println(o);
			//out.println("trial");
			ResultSet rsettt=stmtqq.executeQuery(" select symptom from " + o);
			//out.println("trial");
			if (rsettt.next()){
				do{
					str1=rsettt.getString("symptom");
					sympdata[p]=str1;
					str1="";
					p++;
					} while (rsettt.next());
				
				/* for(int g=0;g<p;g++)
				{ 
				out.println(sympdata[g]);
				}  */
				
			}
		
			
				for(ii=0;ii<j;ii++)
				{
					for(jj=0;jj<p;jj++)
					{
						
						if(sympdata[jj].equalsIgnoreCase(usersymp[ii]))
						{
							
						    String symp=sympdata[jj];
						    System.out.println(symp);
							ResultSet rsetr=stmtqqq.executeQuery("select rate from sympcol where symp=('"+symp+"')");
							if (rsetr.next()){
								do{
							String rates=rsetr.getString("rate");
				 			r=Integer.parseInt(rates);
				 			rate=rate+r;
						    count++;
								}while (rsetr.next());
						}
						
					} 
				
				}
			
			
				}
			
				float countds=p;
				float avg=((rate/countds)/5)*100;
				 res=(int)avg;
				//out.println(res); 
				//out.println(o);
				
				stmt.executeQuery("insert into result(name,rate) values('"+o+"','"+res+"')");
		
		}
			
			
		/* Connection conres = DataBaseMgr.getDataBaseMgr().getConnection();
		Statement stmr = conres.createStatement();
		
		ResultSet result=stmr.executeQuery("select disease_name,description from disease_description m,diseaseres r where r.diseasename=m.disease_name");
		
		if(result.next())
		{
			do{
				String one=result.getString("disease_name");
				String two=result.getString("description");
				stmr.executeQuery("update result set description=('"+two+"') where name=('"+one+"')");
				
			}while(result.next());
		} */
		 Connection conres = DataBaseMgr.getDataBaseMgr().getConnection();
		Statement stmr = conres.createStatement();
		ResultSet resultf=stmr.executeQuery("select * from result");
		if(resultf.next())
		{
		%>
		<div class="container">
		  <h2>RESULT</h2>
		  <p>The following Disease are predicted on the bases of your symptoms with the Risk rate </p>            
		  <table class="table table-hover">
		    <thead>
		      <tr>
		        <th>Predicted Disease</th>
		        <th>Risk Rate</th>
		        
		      </tr>
		    </thead>
		    <tbody>
		    <%do{ %>
		      <tr>
		        <td><%= resultf.getString("name") %></td>
		        <td><%= resultf.getString("rate") %>%</td>
		        
		      </tr>
		      <%}while(resultf.next());%>
		    </tbody>
		  </table>
		</div>

		<%
		}
			//out.println(rate);
			//out.println(p);
			
			stmtqqq.executeQuery("delete from sympcol");
			stmtqqq.executeQuery("delete from diseaseres");
			stmtqqq.executeQuery("delete from result");
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