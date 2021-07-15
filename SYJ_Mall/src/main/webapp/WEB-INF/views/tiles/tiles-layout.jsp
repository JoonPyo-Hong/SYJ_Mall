<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- <link rel = "stylesheet" href = "resources/css/common.css"> -->
    <%-- <title><tiles:insertAttribute name="title" /></title> --%>
  </head>
  
  <body>
  	<%-- <div class='wrap'>
  		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		  <div class='content'>  	
  			<tiles:insertAttribute name="left"></tiles:insertAttribute>
	  		<div class="page_content">
	  			<tiles:insertAttribute name="body"></tiles:insertAttribute>
	  		</div>
  		</div>
  		<tiles:insertAttribute name="foot" ></tiles:insertAttribute>
  	</div> --%>
  	<div>
  		<tiles:insertAttribute name="header" ignore="false"/>
  	</div>
  	
  	 <div>
  		<tiles:insertAttribute name="left" ignore="false"/>
  	</div>
  	
  	<div>
  		<tiles:insertAttribute name="foot" ignore="false"/>
  	</div>
  	
  	<div>
  		<%-- <tiles:insertAttribute name="content" ignore="false"/> --%>
  	</div>
  	
  </body>
  
</html>