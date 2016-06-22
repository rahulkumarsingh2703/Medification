<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,java.sql.ResultSet,
java.io.BufferedReader,
java.io.FileReader,

weka.classifiers.trees.J48.*,
javax.servlet.*,
javax.servlet.http.HttpServlet.*,
org.apache.jasper.*,
java.io.File,
java.io.FileNotFoundException,
weka.classifiers.trees.*,
org.apache.catalina.*,
java.io.BufferedReader,
java.io.FileReader,
weka.core.DenseInstance,
weka.core.Instance,
weka.core.Instances,

weka.classifiers.Classifier,
java.lang.*,

org.apache.tomcat.*,
java.sql.*,
javax.servlet.ServletException,

com.project.dm.diabetes.Prediction,
java.lang.*,
java.io.PrintWriter.*,
com.project.dm.diabetes.*,
java.io.BufferedReader.*,
java.io.FileReader.*,
weka.classifiers.trees.*,
org.apache.commons.*,

java.io.File.*,
java.io.FileNotFoundException.*,
weka.core.DenseInstance.*,


weka.core.SerializationHelper.*,


javax.servlet.*,
java.io.PrintWriter.*,



java.io.*,
java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Medification</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>



<style> 
#rcorners1 {
    border-radius: 15px 50px;
    background: #00ACC1;
    padding: 20px; 
    width: 32%;
    height: 400px;  
    font-family:cursive;  
    text-align: justify; 
    text-shadow: highlighttext;
       
}

#rcorners2 {
    border-radius: 15px 50px;
    background: #00ACC1;
    padding: 20px; 
    width: 66%;
    height: 400px;
    margin-left: 0.5%; 
    font-family:cursive;  
    text-align: justify;
    
}
#rcorners2 h3{
 font-weight: bolder;
}
#rcorners2 strong{
 color: #FFF176;
 font-size: large;
 font-weight: lighter;
}

.jumbotron{
background:#009688;

}


</style>

</head>
<body>

<br><br>

<div class="container">
<div class="row" >

<div class="col-sm-4"  id="rcorners1">
  <form class="form-horizontal" role="form" method="post" action="Report_Analyzer.jsp">
    <input type="hidden" name="execute" value="true">
    <div class="form-group">
     <label class="control-label col-sm-6" for="Plasma Glucose">Plasma Glucose:</label>
      <div class="col-sm-4">
       <input type="text" class="form-control" name="pg" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Blood Pressure">Blood Pressure:</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" name="bp" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Insulin">Insulin:</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" name="insu" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Bmi">Bmi:</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" name="bmi" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Diabetes Pedigree">Diabetes Pedigree:</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" name="dp" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Age">Age:</label>
      <div class="col-sm-4">          
        <input type="text" class="form-control" name="age" placeholder="">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-6 col-sm-4">
        <button type="submit" class="btn btn-primary btn-group-justified">Submit</button>
      </div>
    </div>
  </form>
  </div>

 <div class="col-sm-8" id="rcorners2">

<p>
<h3>Diabetes Mellitus (DM), </h3><p>Commonly referred to as <strong>Diabetes</strong>, is a group of metabolic diseases in which there are high blood 
levels over a prolonged period.</p><p>
Diabetes is due to either the pancreas not producing enough insulin or the cells of the body not responding properly to the insulin produced.
Diabetes is a chronic condition associated with abnormally high levels of sugar (glucose) in the blood.</p>
<p>It is diagnosed when a person has too much glucose (sugar) in the blood.
It cannot presently be cured, but it can be controlled, and you can lead a full and active life.</p>
<h3>Common Symptoms</h3>
<p>Weakness, Blurred Vision, Nausea, Frequent Urination, Thirst,
Weight Loss,
Hunger,
Fatigue,
Slow Healing Wounds... </p>

<p style="position: absolute; right: 10px; bottom: 10px;"><button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal">InDetail</button></p>
 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">All About Diabetes</h4>
        </div>
        <div class="modal-body">
          <h3>What Is Diabetes?</h3>

Diabetes is diagnosed when a person has too much glucose (sugar) in the blood. 
This happens because the pancreas cannot make enough insulin.

Glucose is an essential source of energy for the brain as well as a source of energy for the body. 
Glucose in the bloodstream comes from carbohydrate foods, which are changed into glucose after we have eaten them.

Glucose also comes from the liver, where it has been previously stored. 
This ensures a constant supply even when we have not eaten recently.

For people without diabetes the level of glucose in the body is between 4 and 8 mmol/L.

Insulin is produced in the pancreas and has two jobs in the body - the first is to transport glucose from the blood supply into fat and muscle cells, where it can be used for energy. The second is to switch off the liver once the level of glucose in the blood is high enough.

Diabetes is the result of the body not creating enough insulin to keep blood glucose levels in the normal range. 
It cannot presently be cured, but it can be controlled, and you can lead a full and active life.
If you think you have diabetes contact a health-care professional. Diabetes is diagnosed by blood sugar (glucose) testing.
<p>There are three types of diabetes:</p>
<h3>Type 1</h3>
People who do not make any insulin (or very little) have Type 1 diabetes. Because the immune system destroys the pancreas, they have stopped making insulin, and their body is unable to use glucose for energy. They tend to lose weight very quickly because their body is actually being starved. Their health rapidly deteriorates and they would die if insulin were not given.

They therefore require insulin by injection several times each day. Along with some dietary changes, this will allow the person to maintain good health.

<h3>Type 2</h3>
People with Type 2 diabetes are still making insulin but the production is sluggish or their body is resistant to insulin. Becoming overweight is almost always the cause of the body becoming resistant to insulin, and can trigger Type 2 diabetes, even in young people. Type 2 diabetes can be treated with weight loss and regular physical activity. Medication in the form of tablets is often required to reduce the resistance to insulin or to stimulate the pancreas to make more insulin. Type 2 diabetes is a progressive condition in that the pancreas continues to get more sluggish over time. People with type 2 diabetes may eventually require insulin.

<h3>Diabetes of pregnancy (gestational diabetes)</h3>
Gestational diabetes is when a pregnant woman has high levels of glucose in her blood. High blood glucose is caused because the mother cannot produce enough insulin (a pregnant woman's insulin needs are two to three times that of someone who is not pregnant). Unlike Type 1 and Type 2 diabetes, gestational diabetes is only temporary and usually disappears after pregnancy. However, a woman who has had gestational diabetes has an increased risk (50-60%) of developing Type 2 diabetes in the future; therefore they should be tested for diabetes each year.


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

</div>




  
  
  
  
  
 

<div id="execute">
<% if("true".equals(request.getParameter("execute"))){
	
	
		String pg = request.getParameter("pg");
 		String bp = request.getParameter("bp");
 		String insu = request.getParameter("insu");
 		String bmi = request.getParameter("bmi");
 		String dp = request.getParameter("dp");
 		String age = request.getParameter("age");
 		String c=",";
 		String q="?";
 		String s=pg+c+bp+c+insu+c+bmi+c+dp+c+age+c+q;
 		
 		String msg="";
 		
 				if(!pg.isEmpty() && !bp.isEmpty() && !insu.isEmpty() && !bmi.isEmpty() && !dp.isEmpty() && !age.isEmpty())
 				{
 				String rootPath="/Project-Medification/DataBase/diabetes/bagging/"; 
 				Classifier cls = (Classifier) weka.core.SerializationHelper.read(rootPath+"dmodel.model");
 				Instances instances = new Instances(
 	 	                new BufferedReader(
 	 	                        new FileReader("/Project-Medification/DataBase/diabetes/bagging/pre.arff")));
 				
 				instances.setClassIndex(instances.numAttributes()-1);
 				//String s=("131,0,0,43.2,0.27,26,?");
 				String[] dataString = s.split(",");
 	 			double data[] = new double[dataString.length];
 	 			for(int i=0; i<dataString.length; i++) {
 	 				try {
 	 					data[i] = Double.parseDouble(dataString[i]);
 	 				} catch (Exception e) {
 	 					data[i] = Double.NaN;
 	 				}
 	 			}
 	 			Instance instance1 = new DenseInstance(1.0, data);
 				instances.add(instance1);
 				
 				
 				int s1=0;
 					Instance instance = instances.instance(s1);
 					
 					double result = cls.classifyInstance(instance);
 					instance.setClassValue(result);
 					
 					String prediction=instance.classAttribute().value((int)result);
 					//out.println(prediction);
 					
 					if(prediction.equalsIgnoreCase("true"))
 					{
 						msg="You are sick";
 						%>
 						
 						<div class="cotainer">
 						<table class="table table-striped">
   					 	<thead>
      					<tr>
        				<th>Plasma Glucose:</th>
        				<th>Blood Pressure:</th>
       					<th>Insulin:</th>
        				<th>Body Mass Index:</th>
        				<th>Diabetes Pedigree:</th>
        				<th>Age:</th>
      					</tr>
    					</thead>
    					<tbody>
      					<tr>
        				<td><%=pg%></td>
        				<td><%=bp%></td>
        				<td><%=insu%></td>
        				<td><%=bmi%></td>
        				<td><%=dp%></td>
        				<td><%=age%></td>
      					</tr>
    					</tbody>
  						</table>
 						</div>
 						<div class="alert alert-danger">
 						  <strong>Sick</strong> Chances of being diabetes.
 						</div><%
 					}
 					if(prediction.equalsIgnoreCase("false"))
 					{
 						msg="Healthy";
 						
 						%><div class="cotainer">
 						<table class="table table-striped">
   					 	<thead>
      					<tr>
        				<th>Plasma Glucose:</th>
        				<th>Blood Pressure:</th>
       					<th>Insulin:</th>
        				<th>Body Mass Index:</th>
        				<th>Diabetes Pedigree:</th>
        				<th>Age:</th>
      					</tr>
    					</thead>
    					<tbody>
      					<tr>
        				<td><%=pg%></td>
        				<td><%=bp%></td>
        				<td><%=insu%></td>
        				<td><%=bmi%></td>
        				<td><%=dp%></td>
        				<td><%=age%></td>
      					</tr>
    					</tbody>
  						</table>
 						</div>
 						<br><div class="alert alert-success">
 						    <strong>Healthy</strong> 
 						    </div><%
 					}
 				
 				}
 				else
 				{
 					%>
 					<br><div class="alert alert-danger">
					  <strong>Error ! </strong> Please Enter values.
					</div><%
				}
 					
 				}
 					 
	
 		
 			
 			
 		
 

	%>

  
 	
</div>


 </div> 


</body>


</html>