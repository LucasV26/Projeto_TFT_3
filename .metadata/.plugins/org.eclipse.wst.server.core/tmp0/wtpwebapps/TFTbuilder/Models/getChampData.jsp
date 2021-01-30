<%@page import="models.sinergia"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException" %>
<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	int champID = Integer.parseInt(request.getParameter("champID"));

	campeao camp = new campeao(champID);
	ResultSet RSsinergias = camp.selectJoin( "S.ID, S.NOME, S.FOTO, S.TIPO", " join sincam SC on campeao.ID = SC.ID_CAMPEAO join sinergia S on S.ID = SC.ID_SINERGIA", "campeao.ID = " + camp.getID() + " order by S.ID" );

	String where = "(";
	
	try {
		while(RSsinergias.next()) {
			where += "sinergia.ID = " + RSsinergias.getString("ID");
			if(!RSsinergias.isLast()) {
				where += " || ";
			}
		}
		RSsinergias.beforeFirst();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	
	where += ") && C.ID != " + camp.getID() + " order by sinergia.ID ";
	
	sinergia campRelacionados = new sinergia();
	
	ResultSet RScampeoes =  campRelacionados.selectJoin( "C.ID as idChamp, C.CUSTO, C.NOME, C.FOTO, sinergia.ID as idSinergy", " join sincam SC on sinergia.ID = SC.ID_SINERGIA join campeao C on C.ID = SC.ID_CAMPEAO", where );
	
	String sinIDarray = "\"SINid\": [";
	String sinTIPOarray = "\"SINtipo\": [";
	String sinNOMEarray = "\"SINnome\": [";
	String sinFOTOarray = "\"SINfoto\": [";
	
	String campIDsinArray = "\"CAMPidSIN\": [";
	String campIDarray = "\"CAMPid\": [";
	String campNOMEarray = "\"CAMPnome\": [";
	String campFOTOarray = "\"CAMPfoto\": [";
	String campCUSTOarray = "\"CAMPcusto\": [";
	
	while(RSsinergias.next()){
		if(RSsinergias.isLast()){
			 sinIDarray += RSsinergias.getInt("ID") + " ], ";
			 sinTIPOarray += "\"" + RSsinergias.getString("TIPO") + "\" ], ";
			 sinNOMEarray += "\"" + RSsinergias.getString("NOME") + "\" ], ";
			 sinFOTOarray += "\"" + RSsinergias.getString("FOTO") + "\" ], ";
		}else{
			sinIDarray += RSsinergias.getInt("ID") + ", ";
			sinTIPOarray += "\"" + RSsinergias.getString("TIPO") + "\", ";
			sinNOMEarray += "\"" + RSsinergias.getString("NOME") + "\", ";
			sinFOTOarray += "\"" + RSsinergias.getString("FOTO") + "\", ";
		}
	}
	
	while(RScampeoes.next()){
		if(RScampeoes.isLast()){
			campIDsinArray += RScampeoes.getInt("idSinergy") + " ], ";
			campIDarray += RScampeoes.getInt("idChamp") + " ], ";
			campNOMEarray += "\"" + RScampeoes.getString("NOME") + "\" ], ";
			campFOTOarray += "\"" + RScampeoes.getString("FOTO") + "\" ], ";
			campCUSTOarray += "\"" + RScampeoes.getString("CUSTO") + "\" ] } ";
		}else{
			campIDsinArray += RScampeoes.getInt("idSinergy") + ", ";
			campIDarray += RScampeoes.getInt("idChamp") + ", ";
			campNOMEarray += "\"" + RScampeoes.getString("NOME") + "\", ";
			campFOTOarray += "\"" + RScampeoes.getString("FOTO") + "\", ";
			campCUSTOarray += "\"" + RScampeoes.getString("CUSTO") + "\", ";
		}
	}

	saida += sinIDarray + sinTIPOarray + sinNOMEarray + sinFOTOarray + campIDsinArray + campIDarray + campNOMEarray + campFOTOarray + campCUSTOarray;

	out.write(saida);
	
%>