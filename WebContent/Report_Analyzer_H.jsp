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
    background: #F44336;
    padding: 20px; 
    width: 32%;
    height: 750px;  
    font-family:cursive;  
    text-align: justify; 
    text-shadow: highlighttext;
       
}

#rcorners2 {
    border-radius: 15px 50px;
    background: #F44336;
    padding: 20px; 
    width: 66%;
    height: 750px;
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
  <form class="form-horizontal" role="form" method="post" action="Report_Analyzer_H.jsp">
    <input type="hidden" name="execute" value="true">
    <div class="form-group">
     <label class="control-label col-sm-6" for="Age">Age:</label>
      <div class="col-sm-5">
       <input type="text" class="form-control" name="age" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Sex">Sex:</label>
      <div class="col-sm-5">
      <select class="form-control" id="sel1" name="sex">
      <option selected="selected" disabled="disabled"></option>
      <option>Male</option>
      <option>Female</option>
      </select>
   </div>
   </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="Chest Pain">Chest Pain:</label>
      <div class="col-sm-5">
      <select class="form-control" id="sel1" name="cp">
      <option selected="selected" disabled="disabled"></option>
      <option>typ_angina</option>
      <option>asympt</option>
      <option>non_anginal</option>
      <option>atyp_angina</option>
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="trestbps">tRest BloodPressure:</label>
      <div class="col-sm-5">
        <input type="text" class="form-control" name="trestbps" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="chol">Cholesterol:</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" name="chol" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="fbs">Fasting Blood Suger:</label>
      <div class="col-sm-5">          
      <select class="form-control" id="sel1" name="fbs">
      <option selected="selected" disabled="disabled"></option>
      <option value="t">True</option>
      <option value="f">False</option>
      </select>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-6" for="restecg">Rest ECG:</label>
      <div class="col-sm-5">          
        <select class="form-control" id="sel1" name="restecg">
      <option selected="selected" disabled="disabled"></option>
      <option>left_vent_hyper</option>
      <option>normal</option>
      <option>st_t_wave_abnormality</option>
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="thalach">Thalach:</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" name="thalach" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="exang">Exang:</label>
      <div class="col-sm-5">          
      <select class="form-control" id="sel1" name="exang">
      <option selected="selected" disabled="disabled"></option>
      <option>yes</option>
      <option>no</option>
      </select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-6" for="oldpeak">oldPeak:</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" name="oldpeak" placeholder="">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="slop">Slop:</label>
      <div class="col-sm-5">          
      <select class="form-control" id="sel1" name="slop">
      <option selected="selected" disabled="disabled"></option>
      <option>up</option>
      <option>flat</option>
      <option>down</option>
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-6" for="ca">CA:</label>
      <div class="col-sm-5">          
        <input type="text" class="form-control" name="ca" placeholder="">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-6" for="thal">Thal:</label>
      <div class="col-sm-5">          
      <select class="form-control" id="sel1" name="thal">
      <option selected="selected" disabled="disabled"></option>
      <option>fixed_defect</option>
      <option>normal</option>
      <option>reversable_defect</option>
      </select>
      </div>
    </div>
    
    
    
    
    <div class="form-group">        
      <div class="col-sm-offset-6 col-sm-5">
        <button type="submit" class="btn btn-default btn-group-justified">Submit</button>
      </div>
    </div>
  </form>
  </div>

 <div class="col-sm-8" id="rcorners2">
 <h3>Heart Disease</h3>
 <p>Heart disease describes a range of conditions that affect your heart. Diseases under the heart disease umbrella include blood vessel diseases, such as coronary artery disease; heart rhythm problems (arrhythmias) and heart defects you're born with (congenital heart defects).

The term <strong>heart disease</strong> is often used interchangeably with the term "cardiovascular disease" which generally refers to conditions that involve narrowed or blocked blood vessels that can lead to a heart attack, chest pain or stroke. Other heart conditions, such as those that affect your heart's muscle, valves or rhythm, also are considered forms of heart disease.</p>
 
 
<h3>Input Attributes,</h3>
<h5>Age: In year</h5>
<h5>Sex: Male or Female</h5>
<h5>Chest Pain Type: Chest Pain Type (typ_angina, asympt, non_anginal, atyp_angina)</h5>
<h5>Trest Blood Pressure</h5>
<h5>Cholestrol: Serum Cholestrol</h5>
<h5>Fasting Blood Sugar: ( True: >120 mg/dl; False: <120mg/dl )</h5>
<h5>Rest ECG: Resting Electrographic Results( left_vent_hyper,normal,st_t_wave_abnormality )</h5>
<h5>Thalach: Maximum heart rate achieved</h5>
<h5>Exang: Exercise induced angina (yes or no)</h5>
<h5>Old peak: ST depression induced by exercise relative to rest</h5>
<h5>Slope: The slope of the peak exercise ST segment (up, flat, down)</h5>
<h5>CA: Number of major vessels colored by fluorscopy (1 to 3)</h5>
<h5>Thal: (normal,fixed defect, reversible defect) </h5>
<!-- <p>
<h3>Heart Diseases, </h3><p>Commonly referred to as <strong>Diabetes</strong>, is a group of metabolic diseases in which there are high blood 
levels over a prolonged period.</p><p>
Diabetes is due to either the pancreas not producing enough insulin or the cells of the body not responding properly to the insulin produced.
Diabetes is a chronic condition associated with abnormally high levels of sugar (glucose) in the blood.</p>
<p>It is diagnosed when a person has too much glucose (sugar) in the blood.
It cannot presently be cured, but it can be controlled, and you can lead a full and active life.</p> -->
<h3>Common Symptoms</h3>
<p>Chest Discomfort, Nausea, Indigestion, Shortness of breath, numbness, weakness or coldness, Palpitations, Fast Heartbeat, Sweating, 
Heartburn, Chest Pain, Stomach Pain, Pain in the neck, jaw, throat, upper abdomen or back Sweating and pain, Vomiting, Irregular Heart Beat, Dizziness,
Fainting ... </p>

<!-- <p style="position: absolute; right: 10px; bottom: 10px;"><button type="button" class="btn btn-default " data-toggle="modal" data-target="#myModal">InDetail</button></p> -->
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
	
	
		String age = request.getParameter("age");
 		String sex = request.getParameter("sex");
 		String cp = request.getParameter("cp");
 		String trestbps = request.getParameter("trestbps");
 		String chol = request.getParameter("chol");
 		String fbs = request.getParameter("fbs");
 		String restecg = request.getParameter("restecg");
 		String thalach = request.getParameter("thalach");
 		String exang = request.getParameter("exang");
 		String oldpeak = request.getParameter("oldpeak");
 		String slop = request.getParameter("slop");
 		String ca = request.getParameter("ca");
 		String thal = request.getParameter("thal");
 		
 		String c=",";
 		String q="?";
 		String s=age+c+sex+c+cp+c+trestbps+c+chol+c+fbs+c+restecg+c+thalach+c+exang+c+oldpeak+c+slop+c+ca+c+thal+c+q;
 		System.out.println(s);
 		String msg="";
 		
 				if(!age.isEmpty() && !sex.isEmpty() && !cp.isEmpty() && !trestbps.isEmpty() && !chol.isEmpty() && !fbs.isEmpty()
 						&& !restecg.isEmpty() && !thalach.isEmpty() && !exang.isEmpty() && !oldpeak.isEmpty() && !slop.isEmpty()
 						&& !ca.isEmpty() && !thal.isEmpty())
 				{
 				String rootPath="/Project-Medification/DataBase/heart/bagging/"; 
 				Classifier cls = (Classifier) weka.core.SerializationHelper.read(rootPath+"hmodel.model");
 				Instances instances = new Instances(
 	 	                new BufferedReader(
 	 	                        new FileReader("/Project-Medification/DataBase/heart/bagging/pre.arff")));
 				
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
 					
 					if(prediction.equalsIgnoreCase(">50_1"))
 					{
 						msg="You are sick";
 						
 						%>
 						
 						<div class="cotainer">
 						<%-- <table class="table table-striped">
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
  						</table> --%>
 						</div>
 						<div class="alert alert-danger">
 						  <strong>Sick</strong> Chances of Having Heart Diseases.
 						</div><%
 					}
 					if(prediction.equalsIgnoreCase("<50"))
 					{
 						msg="Healthy";
 						
 						%><div class="cotainer">
 						<%-- <table class="table table-striped">
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
  						</table> --%>
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
					  <strong>Error ! </strong> Please Enter values Properly.
					</div><%
				}
 					
 				}
 					 
	
 		
 			
 			
 		
 

	%>

  
 	
</div>
</div> 
</body>
</html>