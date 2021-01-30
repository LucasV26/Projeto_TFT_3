<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int id = Integer.parseInt(request.getParameter("idSyn"));

	sinergia syn = new sinergia(id);
	syn.delete();
	
	out.write("{ \"success\": true }");
%>