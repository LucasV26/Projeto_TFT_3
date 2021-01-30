<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int id = Integer.parseInt(request.getParameter("idChamp"));

	campeao camp = new campeao(id);
	camp.delete();
	
	out.write("{ \"success\": true }");
%>