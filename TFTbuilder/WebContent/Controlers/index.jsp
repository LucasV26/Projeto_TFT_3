<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	int userID = 0;

	if(session.getAttribute("userLogin") != null){	
		userID = (int) session.getAttribute("userLogin");
	}
%>

<%@include file='../Views/head.html'%>

<% if(userID == 0){ %>
	<%@include file='../Views/loginForm.html'%>
<% }else{ %>
	<%@include file='../Views/navBar.jsp'%>
	<%@include file='../Views/welcomePage.jsp'%>
<% } %>

<%@include file='../Views/foot.html'%>
		