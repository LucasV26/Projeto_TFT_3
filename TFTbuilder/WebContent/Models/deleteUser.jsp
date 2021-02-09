<%@page import="mail.SendMail"%>
<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String saida = "{ \"success\": true }";
	int idUser = Integer.parseInt(request.getParameter("idUser"));
	
	usuario user = new usuario(idUser);
	user.searchUser();
	user.delete();
	
	String smtpHost 	= "smtp.gmail.com"; 
	String smtpPort 	= "587"; 
	String username 	= "";
	String password 	= "";
	String auth     	= "tls";  
	SendMail sendMail 	=  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
	
	String mailFrom 	= "gcmania2606@gmail.com"; 
 	String mailTo 		= user.getEMAIL(); 
 	String mailSubject 	= "Conta excluída por gerente do sistema"; 
 	String mailBody 	= "Olá, parece que sua conta fora excluída por algum gerente do sistema\nSe você acredita que esta exclusão fora injusta, entre em contado com a equipe."; 
	sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
	
	out.write(saida);
%>
