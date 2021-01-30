<%@page import="models.nivelusuario"%>
<%@page import="models.requisicao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String saida = "{ \"success\": true }";
	
	int idUser = Integer.parseInt(request.getParameter("idUser"));
	int idNivel = Integer.parseInt(request.getParameter("idNivel"));
	
	if(idUser > 0 && idNivel > 0){
		nivelusuario nivel = new nivelusuario(idNivel);
		nivel.searchLevel();
		
		String nivelAtual = nivel.getNOME();
		
		nivel = new nivelusuario(idNivel + 1);
		nivel.searchLevel();
		
		String nivelAlmejado = nivel.getNOME();
		
		requisicao req = new requisicao(idUser);
		req.searchRequest();
		
		if(req.getNIVEL_ALMEJADO() != null && req.getNIVEL_ATUAL() != null){
			if(req.getNIVEL_ALMEJADO().equals(nivelAlmejado) || req.getNIVEL_ATUAL().equals(nivelAtual)){
				saida = "{ \"success\": false, \"message\": \"Voce ja possui uma requisicao para subir ao nivel: " + nivelAlmejado + ". Por favor, aguarde uma resposta por e-mail\" }";
			}else{
				if(nivelAtual != null && nivelAlmejado != null){
					requisicao newReq = new requisicao(0, idUser, nivelAtual, nivelAlmejado);
					
					newReq.save();
				}
			}
		}else{
			if(nivelAtual != null && nivelAlmejado != null){
				requisicao newReq = new requisicao(0, idUser, nivelAtual, nivelAlmejado);
				
				newReq.save();
			}
		}
	}else{
		saida = "{ \"success\": false, \"message\": \"Ocorrreu um erro! Talvez voce nao tenha permissao para requisitar aumentos de nivel.\" }";
	}
	
	out.write(saida);
%>