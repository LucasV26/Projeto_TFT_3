<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true }";
	
	int id = Integer.parseInt(request.getParameter("id"));
	String nome = request.getParameter("nome");
	String foto = request.getParameter("foto");
	String descrip = request.getParameter("descrip");
	String mark_descrip = request.getParameter("markDescrip");
	int marca = Integer.parseInt(request.getParameter("marca"));
	int qtdMK1 = Integer.parseInt(request.getParameter("qtdMK1"));
	int qtdMK2 = Integer.parseInt(request.getParameter("qtdMK2"));
	int qtdMK3 = Integer.parseInt(request.getParameter("qtdMK3"));
	int qtdMK4 = Integer.parseInt(request.getParameter("qtdMK4"));
	String tipo = request.getParameter("tipo");
	
	switch(marca){
		case 1:
			qtdMK2 = 0;
			qtdMK3 = 0;
			qtdMK4 = 0;
			break;
		case 2:
			qtdMK3 = 0;
			qtdMK4 = 0;
			break;
		case 3:
			qtdMK4 = 0;
			break;
	}
	
	if((marca == 1 && qtdMK1 != 0) || (marca == 2 && qtdMK1 != 0 && qtdMK2 != 0) || (marca == 3 && qtdMK1 != 0 && qtdMK2 != 0 && qtdMK3 != 0) || (marca == 4 && qtdMK1 != 0 && qtdMK2 != 0 && qtdMK3 != 0 && qtdMK4 != 0)){
		sinergia sin = new sinergia(id, nome, foto, descrip, mark_descrip, marca, qtdMK1, qtdMK2, qtdMK3, qtdMK4, tipo);
		sin.save();
	}else{
		saida = "{ \"success\": false }";
	}
	
	out.write(saida);
%>