<%@page import="mail.SendMail"%>
<%@page import="models.usuario"%>
<%@page import="models.requisicao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, \"message\": ";
	int idReq = Integer.parseInt(request.getParameter("idReq"));
	String acao = request.getParameter("acao");
	
	requisicao req = new requisicao();
	req.setID(idReq);
	req.searchRequestByID();
	
	usuario user = new usuario(req.getID_USUARIO());
	user.searchUser();
	String mensagem = "";
	String titulo = "";
	
	
	if(acao.equals("aceitar")){
		user.setID_NIVEL(user.getID_NIVEL() + 1);
		user.save();
		titulo = "Requisição aceita!";
		mensagem = "Parabéns! Sua requisição de aumento de nível foi aceita. Agora sua conta é de nível: " + req.getNIVEL_ALMEJADO();
		saida += "\"Requisição aceita com sucesso!\" }";
	}else{
		
		if(acao.equals("recusar")){
			titulo = "Requisição negada!";
			mensagem = "Olá! Este e-mail é para avisar que sua requisição de aumento de nível não foi aceita, sua conta permanecerá no nível: " + req.getNIVEL_ATUAL() + ". Mais sorte na próxima.";
			saida += "\"Requisição recusada com sucesso!\" }";
		}
	}
	
	String smtpHost 	= "smtp.gmail.com"; 
	String smtpPort 	= "587"; 
	String username 	= "";
	String password 	= "";
	String auth     	= "tls";  
	SendMail sendMail 	=  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
	
	String mailFrom 	= "gcmania2606@gmail.com"; 
 	String mailTo 		= user.getEMAIL(); 
 	String mailSubject 	= titulo; 
 	String mailBody 	= mensagem; 
	sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
	
	req.delete();
	
	out.write(saida);
%>
