<%@page import="models.build"%>
<%@page import="java.sql.ResultSet"%>
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
		buildcamp insertion = new buildcamp(champID, buildID);
		ResultSet rs = insertion.selectJoin("count(ID_CAMPEAO) as contagem", " ", "ID_BUILD = " + insertion.getID_BUILD());
		
		if(rs.next()){
			if(rs.getInt("contagem") < 9){
				insertion.save();
			}else{
				saida = "{ \"success\": false, \"message\": \"Sua Build já atingiu o limite máximo de campeões, remova um antes de inserir novos!\" }";
			}
		}
	}else{
		saida = "{ \"success\": false, \"message\": \"Opa! Parece que você acabou entrando na build de outra pessoa! Desculpe, mas você não pode alterar os dados aqui.\" }";
	}
	
	out.write(saida);
%>