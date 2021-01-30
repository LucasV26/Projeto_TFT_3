<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	
	campeao newChamp = new campeao(0, "Nome", "Foto.png", "Nome da Habilidade", "Habilidade.png", "Descrição da Habilidade", "Melhorias da habilidade por nível do campeão", 1);
	newChamp.save();
	
	int novoID = newChamp.selectLastID();
	
	saida += "\"id\": " + novoID + " } ";
	
	out.write(saida);
%>