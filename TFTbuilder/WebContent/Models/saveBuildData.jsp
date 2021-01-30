<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true }";
	
	String nome = request.getParameter("nome");
	String descrip = request.getParameter("descrip");
	int ID = Integer.parseInt(request.getParameter("id"));
	int IDuser = Integer.parseInt(request.getParameter("idUser"));
	
	build saveBuild = new build();
	
	saveBuild.setID(ID);
	saveBuild.searchBuild();
	
	saveBuild.setNOME(nome);
	saveBuild.setDESCRIP(descrip);
	
	if(IDuser == saveBuild.getID_USUARIO()){
		saveBuild.save();
	}else{
		saida = "{ \"success\": false }";
	}
	
	out.write(saida);
%>