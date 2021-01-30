<%@page import="models.build"%>
<%@page import="models.buildcamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true }";
	int champID = Integer.parseInt(request.getParameter("champID"));
	int buildID = Integer.parseInt(request.getParameter("buildID"));
	int userID = Integer.parseInt(request.getParameter("userID"));
	
	build checkBuild = new build();
	checkBuild.setID(buildID);
	checkBuild.searchBuild();
	if(userID == checkBuild.getID_USUARIO()){
		buildcamp deletion = new buildcamp(champID, buildID);
		int success = deletion.delete();
		if(success == 0){
			saida = "{ \"success\": false }";
		}
	}else{
		saida = "{ \"success\": false }";
	}
	
	out.write(saida);
%>