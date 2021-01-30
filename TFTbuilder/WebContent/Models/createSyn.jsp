<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	
	sinergia newSyn = new sinergia(0, "Nome", "Foto.png", "Descrição do poder da sinergia", "marca1 - melhoria; marca2 - melhoria; etc", 1, 0, 0, 0, 0, "C");
	newSyn.save();
	
	int novoID = newSyn.selectLastID();
	
	saida += "\"id\": " + novoID + " } ";
	
	out.write(saida);
%>