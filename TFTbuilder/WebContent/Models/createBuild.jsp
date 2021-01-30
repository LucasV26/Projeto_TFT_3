<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idUser = Integer.parseInt(request.getParameter("idUser"));
	String saida = "{ \"success\": true, \"id\": 0}";
	int aux = build.count(idUser);

	build newBuild = new build(0, idUser, "Nova Build " + aux, "Build recém criada");
	newBuild.save();
	
	int newBuildID = newBuild.returnNewID();
	
	saida = "{ \"success\": true, \"id\": "+newBuildID+"}";
	
	out.write(saida);
%>