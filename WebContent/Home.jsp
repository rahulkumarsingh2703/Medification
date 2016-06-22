<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en-gb" class="no-js">
<%
if(!("true".equals((String)session.getAttribute("loginsuccess")))){
	response.sendRedirect("index.jsp");
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Medification</title>
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="fe/css/bootstrap.min.css" />
<link rel="stylesheet" type="fe/text/css" href="css/isotope.css" media="screen" />
<link rel="stylesheet" href="fe/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<link href="fe/css/animate.css" rel="stylesheet" media="screen">
<link href="fe/js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="fe/css/styles.css" />
<link href="fe/font/css/font-awesome.min.css" rel="stylesheet">
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
          <li class="active" id="firstLink"><a href="#home" class="scroll-link">Home</a></li>
          <li><a href="#services" class="scroll-link">Services</a></li>
          <li><a href="#aboutUs" class="scroll-link">About Medification</a></li>
         <!--  <li><a href="#plans" class="scroll-link">Plans</a></li>
          <li><a href="#team" class="scroll-link">Team</a></li>
          <li><a href="#" onclick="signOut();">Sign out</a> -->
          <li><a href="#contactUs" class="scroll-link">Contact Us</a></li>
          <li><a href="Logout.jsp" class="scroll-link">Logout</a></li>
        </ul>
      </div>
      <!--/.navbar-collapse--> 
    </nav>
    <!--/.navbar--> 
  </div>
  <!--/.container--> 
</header>
<!--/.header-->
<div id="#top"></div>
<section id="home">
  <div class="banner-container"> <img src="images/bgg21.png" alt="banner" />
    <div class="container banner-content">
      <div class="hero-text animated fadeInDownBig">
        <!-- <h1 class="responsive-headline" style="font-size: 70px;">Medification<br/>
          </h1> -->
         <a href="#basics" class="arrow-link"> <i class="fa fa-chevron-down"></i> </a> 
        <!--<p>Awesome theme for your Business or Corporate site to showcase <br/>
          your product and service.</p>--> 
      </div>
      
      <!-- <a class="hero-button learn-more smoothscroll text-center" href="#features">Learn More</a>--> 
      <!-- <div class="hero-img"> <img src="images/homepage-1204-background-lapto.png" alt="" class="text-center animated fadeInUpBig"/></div>--> 
    </div>
  </div>
  <div class="container-fluid hero-text2">
  <h2>Medification:<br/>A Smart Disease Predictor and Report Analyzer</h2>
  </div>
</section>
<section id="services" class="page-section colord">
  <div class="container">
    <div class="row"> 
      <!-- item -->
      <div class="col-md-3 text-center"> <a href="SearchH.jsp"><i class="circle"><img src="images/hospital.png" alt="" /></i></a>
        <h3>Search <span class="id-color">Hospital</span></h3>
        <!-- <p></p> -->
      </div>
      <!-- end: --> 
      
      <!-- item -->
      <div class="col-md-3 text-center"><a href="SearchD.jsp"><i class="circle"> <img src="images/eye.png" alt="" /></i></a>
        <h3>Search <span class="id-color">Doctor</span></h3>
        <!-- <p>Nullam ac rhoncus sapien, non gravida purus. Alinon elit imperdiet congue. Integer elit imperdiet congue.</p> -->
      </div>
      <!-- end: --> 
      
      <!-- item -->
      <div class="col-md-3 text-center"><a href="SmartPrediction.jsp"><i class="circle"> <img src="images/symp.png" alt="" /></i></a>
        <h3>Symptom <span class="id-color">Checker</span></h3>
       <!--  <p></p> -->
      </div>
      <!-- end: --> 
      
      <!-- item -->
      <div class="col-md-3 text-center"><a href="ClinicalReport.jsp"><i class="circle"> <img src="images/heart.png" alt="" /></i></a>
        <h3>Report <span class="id-color">Analyzer</span></h3>
        <!-- <p></p> -->
      </div>
      <!-- end:--> 
    </div>
  </div>
  <!--/.container--> 
</section>
<section id="aboutUs">
  <div class="container">
    <div class="heading text-center"> 
      <!-- Heading -->
      <h2>About Medification</h2>
      <!-- <p></p> -->
    </div>
    <div class="row feature design">
      <div class="area1 columns right">
       <!--  <h3>Medification!!! Your ultimate medical online assistant.</h3> -->
        <p>This application is named 'Medification'.</p>
<p>No more hassles and pain of going to the doctor for diagnosis. Medification helps you to predict the disease with the help of few clicks based on the symptoms. The entire idea is to make the process of diagnosis easy and accessible, so that diseases can be predicted on time and precautionary measures can be taken according to the outcome.</p>
<p>It also give provide you system to analyze your clinical report and with our huge data base of hospitals and doctor you can get any information and details at your own place</p>
<p>We are on noble field of medical, We are growing, help us to grouw more!!! join Medifiction</p>
         <!--  <a href="#" class="btn">Download Apps</a>
          <a href="#" class="btn">Free Apps</a> -->
      </div>
      <div class="area2 columns feature-media left"><img src="images/feature-img-11.png" alt="" width="100%"> </div>
    </div>
  <!--   <div class="row dataTxt">	
						<div class="col-md-4 col-sm-6">
							<h4>What We Do?</h4>
							<p>Lorem ipsum dolor consectetursit amet, consectetur adipiscing elit consectetur euismod </p>
                            <p>Lorem ipsum dolor sit amet, ea eum labitur scsstie percipitoleat fabulas complectitur deterruisset at pro. Odio quaeque reformidans est eu, expetendis intellegebat has ut, viderer invenire ut his. Has molestie percipit an. Falli volumus efficiantur sed id, ad vel noster propriae. Ius ut etiam vivendo, graeci iudicabit constituto at mea.</p>
							
							<br>
						</div>
						
						<div class="col-md-4 col-sm-6">
							
							<h4>Why Choose Us?</h4>
							<p>Lorem ipsum dolor consectetursit amet, consectetur adipiscing elit consectetur euismod </p>
                            <ul class="listArrow">
								<li>Lorem ipsum dolor consectetursit amet, consectet</li>
								<li>Has molestie percipit an. Falli volumus efficiantur</li>
								<li>Falli volumus efficiantur sed id, ad vel noster</li>
								<li>Lorem ipsum dolor consectetursit amet, consectetur</li>
								<li>Ius ut etiam vivendo, graeci iudicabit constitutoa</li>
							</ul>
							Accordion starts
							</div>
						
						<div class="col-md-4 col-sm-6">
							<h4>Our Expertise</h4>
							<p>Lorem ipsum dolor consectetursit amet, consectetur adipiscing elit consectetur euismod.</p>
							<h6>Web Designing</h6>
							<div class="progress pb-sm"> 
							  <div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
								 <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
							<h6>Responsive Design</h6>
							<div class="progress pb-sm">
							  <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
								 <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
							<h6>Browser Compatability</h6>
							<div class="progress pb-sm">
							  <div class="progress-bar progress-bar-lblue" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
								 <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
						</div>
						
					</div> -->
  </div>
</section>

<section id="contactUs" class="contact-parlex" >
  <div class="parlex-back" style="background-color: #3ed9ba">
    <div class="container" >
      <div class="row">
        <div class="heading text-center" > 
          <!-- Heading -->
          <h2 style="color: black">Contact Us</h2>
          <p style="color: black">Any Query ? Reach Us !!! we are always here to help you.</p>
        </div>
      </div>
      <div class="row mrgn30"> 
          <div class="col-sm-12 col-md-offset-2 col-md-8">
		  		<!--NOTE: Update your email Id in "contact_me.php" file in order to receive emails from your contact form-->
					<form name="sentMessage" id="contactForm"  novalidate> 
					<div class="control-group">
					<div class="controls">
					<input type="text" class="form-control" 
					placeholder="Full Name" id="name" required
					data-validation-required-message="Please enter your name" />
					<p class="help-block"></p>
					</div>
					</div> 	
					<div class="control-group">
					<div class="controls">
					<input type="email" class="form-control" placeholder="Email" 
					id="email" required
					data-validation-required-message="Please enter your email" />
					</div>
					</div> 	

					<div class="control-group">
					<div class="controls">
					<textarea rows="10" cols="100" class="form-control" 
					placeholder="Message" id="message" required
					data-validation-required-message="Please enter your message" minlength="5" 
					data-validation-minlength-message="Min 5 characters" 
					maxlength="999" style="resize:none"></textarea>
					</div>
					</div> 		 
					<div id="success"> </div> <!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary pull-right" style="background-color: black;">Send</button><br />
					</form>
		  </div>
      </div>
    </div>
    <!--/.container--> 
  </div>
</section>
<footer>
<div class="container">
        <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center"> Copyright 2016 | All Rights Reserved ||<a href="#">Medification</a> </div>
    </div>
    <!-- / .row --> 
  </div>
         
    </div>
    
</footer>
<!--/.page-section-->
<!-- <section class="copyright">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center"> Copyright 2016 | All Rights Reserved -- Designed & Developed by <a href="http://webThemez.com"> Executioners</a> </div>
    </div>
    / .row 
  </div>
</section> -->
<a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a> 

<!--[if lte IE 8]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script><![endif]--> 
<script src="fe/js/modernizr-latest.js"></script> 
<script src="fe/js/jquery-1.8.2.min.js" type="text/javascript"></script> 
<script src="fe/js/bootstrap.min.js" type="text/javascript"></script> 
<script src="fe/js/jquery.isotope.min.js" type="text/javascript"></script> 
<script src="fe/js/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script> 
<script src="fe/js/jquery.nav.js" type="text/javascript"></script> 
<script src="fe/js/jquery.fittext.js"></script> 
<script src="fe/js/waypoints.js"></script> 
 <script src="contact/jqBootstrapValidation.js"></script>
 <script src="contact/contact_me.js"></script>
<script src="fe/js/custom.js" type="text/javascript"></script> 
<script src="fe/js/owl-carousel/owl.carousel.js"></script>

</body>
<script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>

</html>
