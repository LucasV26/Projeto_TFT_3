<%@page import="models.build"%>
<%@page import="models.buildcamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true }";
	int idBuild = Integer.parseInt(request.getParameter("buildID"));
	int IDuser = Integer.parseInt(request.getParameter("userID"));
	
	build buildAtual = new build();
	buildAtual.setID(idBuild);
	buildAtual.searchBuild();
	
	if(IDuser == buildAtual.getID_USUARIO()){
		buildcamp conexao = new buildcamp(idBuild);
		conexao.clean();
	}else{
		saida = "{ \"success\": false }";
	}
	
	out.write(saida);
	
%>