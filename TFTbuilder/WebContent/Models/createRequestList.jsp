<%@page import="models.usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.requisicao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String saida = "{ \"success\": true, ";
	int idUser = Integer.parseInt(request.getParameter("idUser"));

	
	requisicao reqs = new requisicao();
	ResultSet rs = reqs.select(" ID_USUARIO != " + idUser);
	
	usuario user = new usuario();
	
	String RQIDarray = "\"RQid\": [ ";
	String USIDarray = "\"USid\": [ ";
	String NOMEarray = "\"nome\": [ ";
	String NIVELATarray = "\"nivelAt\": [ ";
	String NIVELALarray = "\"nivelAl\": [ ";
	
	while(rs.next()){
		user = new usuario(rs.getInt("ID_USUARIO"));
		ResultSet rsUser = user.select(" ID = " + user.getID());
		if(rsUser.next()){
			if(rs.isLast()){
				RQIDarray += rs.getInt("ID");
				USIDarray += rs.getInt("ID_USUARIO");
				NOMEarray += "\"" + rsUser.getString("NOME") + "\"";
				NIVELATarray += "\"" + rs.getString("NIVEL_ATUAL") + "\"";
				NIVELALarray += "\"" + rs.getString("NIVEL_ALMEJADO") + "\"";
			}else{
				RQIDarray += rs.getInt("ID") + ", ";
				USIDarray += rs.getInt("ID_USUARIO") + ", ";
				NOMEarray += "\"" + rsUser.getString("NOME") + "\", ";
				NIVELATarray += "\"" + rs.getString("NIVEL_ATUAL") + "\", ";
				NIVELALarray += "\"" + rs.getString("NIVEL_ALMEJADO") + "\", ";
			}
		}
	}
	
	RQIDarray += " ], ";
	USIDarray += " ], ";
	NOMEarray += " ], ";
	NIVELATarray += " ], ";
	NIVELALarray += " ] } ";
	
	saida += RQIDarray + USIDarray + NOMEarray + NIVELATarray + NIVELALarray;
	
	out.write(saida);
%>