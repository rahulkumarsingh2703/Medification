<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-gb" class="no-js">
<%
if(!("true".equals((String)session.getAttribute("loginsuccess")))){
	response.sendRedirect("index.jsp");
}
%>
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


<header class="header">
  <div class="container">
    <nav class="navbar navbar-inverse" role="navigation">
      <div class="navbar-header">
        <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <a href="#" class="navbar-brand scroll-top logo  animated bounceInLeft"><b><i>Medification</i></b></a> </div>
      <!--/.navbar-header-->
      <div id="main-nav" class="collapse navbar-collapse">
        <ul class="nav navbar-nav" id="mainNav">
        <li class="active" id="firstLink"><a href="ClinicalReport.jsp" class="scroll-link">Clinical Report Analyzer</a></li>
          <li><a href="Home.jsp" class="scroll-link">Home</a></li>
          <!-- <li><a href="#services" class="scroll-link">Services</a></li>
          <li><a href="#aboutUs" class="scroll-link">About Medification</a></li> -->
          <!-- <li><a href="#work" class="scroll-link">Portfolio</a></li>
          <li><a href="#plans" class="scroll-link">Plans</a></li>
          <li><a href="#team" class="scroll-link">Team</a></li>
          <li><a href="#" onclick="signOut();">Sign out</a> -->
          <li><a href="Logout.jsp" class="scroll-link">Log Out</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse--> 
    </nav>
    <!--/.navbar--> 
  </div>
  <!--/.container--> 
</header>

<br><br><br>
<div class="container-fluid hero-text2">
<!-- <div class="container"> -->
<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Medification: Smart Disease Prediction</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Disease Prediction Based on your Input Symptoms</a></li>
    </ul>
  </div>
</nav> -->
<!-- <div class="container-fluid" > -->
<!-- <iframe src="Report_Analyzer.jsp" frameborder="0" style="overflow: scroll;"></iframe> -->
<!-- <p><a href="Report_Analyzer.jsp" class="btn btn-primary" role="button">Diabetes Report Analysis</a>
<a href="#" class="btn btn-danger" role="button">Heart Report Analysis</a></p> -->

<div class="container-fluid">
  <h2>Report Analyzer System for Diabetes and Heart Disease</h2>
  <ul class="nav nav-pills" style="position: relative; ">
    <!-- <li class="active"><a data-toggle="pill" href="#home"></a></li> -->
    <li><a data-toggle="pill" href="#menu1" class="btn btn-danger" role="button">Diabetes Report Analysis</a></li>
    <li><a data-toggle="pill" href="#menu2" class="btn btn-danger" role="button">Heart Report Analysis</a></li>
  </ul>
  
  <div class="tab-content">
    <!-- <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p></p>
    </div> -->
    <div id="menu1" class="tab-pane fade">
      <h3></h3>
      <iframe src="Report_Analyzer.jsp" frameborder="0" style="overflow: scroll;"></iframe>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3></h3>
      <iframe src="Report_Analyzer_H.jsp" frameborder="0" style="overflow: scroll; height: 900px;"></iframe>
    </div>
  
  </div>
</div>





</div>
</div>
</div>
</body>
<script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>
</html>