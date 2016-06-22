<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.Statement,com.project.db.DataBaseMgr,java.sql.ResultSet,org.apache.jasper.JasperException" %>
     
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
</script>
<style>
div.tooltip{
    max-width: 350px;
}</style>
<title>Medification</title>
</head>
<body>
<div class="container">

<%

Connection con1 = DataBaseMgr.getDataBaseMgr().getConnection();
Statement stmtqq = con1.createStatement();

stmtqq.executeQuery("delete from s1");
stmtqq.executeQuery("delete from s2");
stmtqq.executeQuery("delete from s3");
stmtqq.executeQuery("delete from s4");
stmtqq.executeQuery("delete from diseasepredicted"); %>



<form method="post" action="2.jsp" class="form-inline" role="form" >
<input type="hidden" name="search" value="true">

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Headache" >Headache</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Chest Pain">Chest Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Abdominal Pain">Abdominal Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Joint pain">Joint pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Stomach Bloating/Pain">Stomach Bloating/Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Body Pain">Body Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Muscle Pain">Muscle Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Muscle Pain">Muscle Ache</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Bone Pain">Bone Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Skeletal Deformation">Skeletal Deformation</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="Back Pain">Back Pain</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="1"> 1 [Lowest]</a></li>
<li><a><input type="checkbox" name="rate" value="2"> 2</a></li>
<li><a><input type="checkbox" name="rate" value="3"> 3</a></li>
<li><a><input type="checkbox" name="rate" value="4"> 4</a></li>
<li><a><input type="checkbox" name="rate" value="5"> 5 [Highest]</a></li>
</ul>
</li>
</ul>
</div>

<div class="container-fluid">
<ul class="nav nav-tabs" role="tablist" >
<li><a href="#" data-toggle="tooltip" data-placement="bottom" style="min-width: 250px;"><input type="checkbox" name="sympp" value="None of This">None of This</a></li>
<li class="dropdown" style="float: right;">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Rating <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu" data-toggle1="tooltip" data-placement="left">
<li><a><input type="checkbox" name="rate" value="0"> 0 </a></li>

</ul>
</li>
</ul>
</div>

<br>
<div class="container-fluid">
<p class="submit"><input type="submit" name="commit" class="btn btn-primary" value="Submit">
<input type="reset" class="btn btn-danger" value="Reset"></p>
</div>
</form>

</div>

</body>
</html>