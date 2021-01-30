<%@page import="mail.SendMail"%>
<%@page import="multitool.RandomCode"%>
<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saida = "{ \"success\": true }";

	String email = request.getParameter("email");
	String nome = request.getParameter("nome");
	int idNivel = 1;
	String senha = new RandomCode().generate(18);
	
	if(email.isEmpty() || nome.isEmpty()){
		saida = "{ \"success\": false }";
	}else{
	
		String smtpHost 	= "smtp.gmail.com"; 
		String smtpPort 	= "587"; 
		String username 	= "gcmania2606@gmail.com";
		String password 	= "Lucas.Vinicius2606";
		String auth     	= "tls";  
		SendMail sendMail 	=  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
		
		String mailFrom 	= "gcmania2606@gmail.com"; 
	 	String mailTo 		= email; 
	 	String mailSubject 	= "Criação de conta bem sucessedida!"; 
	 	String mailBody 	= "Parabéns, o email: " + email + " foi cadastrado! \nSua senha atual é: " + senha + " \nFaça login caso queira altera-lá para algo de sua preferência!"; 
		sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
		
		usuario user = new usuario(0, idNivel, nome, "icone.png", senha, email);
		
		user.save();
	}
	
	out.write(saida);
%>