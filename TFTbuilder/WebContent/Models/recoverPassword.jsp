<%@page import="mail.SendMail"%>
<%@page import="multitool.RandomCode"%>
<%@page import="models.usuario"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saida = "{ \"success\": true }";

	String email = request.getParameter("email");
	
	if(email.isEmpty()){
		saida = "{ \"success\": false }";
	}else{
		usuario user = new usuario(email);
		boolean existe = user.newPassword();
		
		if(existe){
			
			String senha = user.getSENHA();
			
			String smtpHost 	= "smtp.gmail.com"; 
			String smtpPort 	= "587"; 
			String username 	= "";
			String password 	= "";
			String auth     	= "tls";  
			SendMail sendMail 	=  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
			
			String mailFrom 	= "gcmania2606@gmail.com"; 
		 	String mailTo 		= email; 
		 	String mailSubject 	= "Senha recuperada com sucesso!"; 
		 	String mailBody 	= "Sua nova senha é: " + senha + " \nFaça login para altera-lá para algo de sua preferência!";  
			sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
			
		}else{
			saida = "{ \"success\": false }";
		}
		
	}
	
	out.write(saida);
%>
