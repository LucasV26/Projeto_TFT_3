<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saida = "{ \"success\": true }";

	int id = Integer.parseInt(request.getParameter("idUser"));
	String nome = request.getParameter("nome");
	String foto = request.getParameter("foto");
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	
	
	if(id > 0 && !(nome.isEmpty() && foto.isEmpty() && email.isEmpty() && senha.isEmpty()) ){
		
		usuario user = new usuario(id);
		boolean existe = user.changeData(nome, foto, email, senha);
		
		
		if(!existe){
			saida = "{ \"success\": false }";
		}
		
	}else{
		saida = "{ \"success\": false }";
	}
	
	out.write(saida);
%>