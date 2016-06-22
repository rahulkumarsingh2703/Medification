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
<div class="container">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Medification: Smart Disease Prediction</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Disease Prediction Based on your Input Symptoms</a></li>
    </ul>
  </div>
</nav>
<div class="container" >
<iframe src="1.jsp" frameborder="0" style="overflow: scroll;"></iframe>
</div>
</div>
</body>
</html>