<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>
		
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<meta http-equiv="x-ua-compatible" content="ie=edge">
  	
  	
	<title><tiles:insertAttribute name="title" ignore="true"/></title>
	
	<!-- Favicon-->
    <link rel="shortcut icon" href='<spring:url value="/static/imagenes/fav.png"/>' >
	
	
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href='<spring:url value="/static/css/all.css" />' media="all" />
	  <!-- Google Fonts Roboto -->
<!-- 	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"> -->

	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/bootstrap.min.css" />' media="all" />
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/mdb.min.css" />' media="all" />
	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/estilo.css" />' media="all" />
	<!-- FONTAWESOME 4.7.0 -->
<%-- 	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/all.min.css"/>' media="all" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" href='<spring:url value="/static/css/font-awesome.min.css"/>' media="all" /> --%>

	<!-- SCRIPTS -->
	<script type="text/javascript" src='<spring:url value="/static/js/jquery.min.js"/>' ></script>
	<script type="text/javascript" src='<spring:url value="/static/js/popper.min.js"/>' ></script>
	<script type="text/javascript" src='<spring:url value="/static/js/bootstrap.min.js"/>' ></script>
	<script type="text/javascript" src='<spring:url value="/static/js/mdb.min.js"/>' ></script>
	<script type="text/javascript" src='<spring:url value="/static/js/Chart.min.js"/>' ></script>



	


</head>
<body>

	<header>
		<tiles:insertAttribute name="header" />
	</header>

	<main style="min-height:90vh">
		<div>
			<tiles:insertAttribute name="body" />			
		</div>
	</main>



	<footer class="page-footer font-small blue">
		<tiles:insertAttribute name="footer" />
	</footer>



</body>


</html>
