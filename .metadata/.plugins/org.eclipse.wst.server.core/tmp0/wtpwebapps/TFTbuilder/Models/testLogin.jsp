<%@page import="models.usuario"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String saida = "";
	
	String NomeOuEmail = request.getParameter("NomeOuEmail");
	String senha = request.getParameter("senha");
	
	usuario user = new usuario(NomeOuEmail, senha);
	
	if(user.checkLogin()){
		session.setAttribute("userLogin", user.getID());
		
		saida = "{ \"login\": true}";
	}else{
		
		session.setAttribute("userLogin", 0);
		
		saida = "{ \"login\": false}";
	}
	
	out.write(saida);
%>