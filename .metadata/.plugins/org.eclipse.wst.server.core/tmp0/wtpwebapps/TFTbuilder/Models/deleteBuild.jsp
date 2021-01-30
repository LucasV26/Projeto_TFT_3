<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saida = "{ \"success\": true }";
	int idBuild = Integer.parseInt(request.getParameter("delete"));
	int IDuser = Integer.parseInt(request.getParameter("userID"));
	
	build delBuild = new build();
	delBuild.setID(idBuild);
	delBuild.searchBuild();
	
	if(IDuser == delBuild.getID_USUARIO()){
		delBuild.delete();
	}else{
		saida = "{ \"success\": false }";
	}
	
	out.write(saida);
%>