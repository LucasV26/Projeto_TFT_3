<%@page import="java.sql.ResultSet"%>
<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	
	String tipo = request.getParameter("tipo");
	
	sinergia sins = new sinergia(tipo);
	ResultSet rs = sins.select(" TIPO = '" + sins.getTIPO() + "'");
	
	String IDarray = "\"id\": [";
	String NOMEarray = "\"nome\": [";
	String FOTOarray = "\"foto\": [";
	String DESCRIParray = "\"descrip\": [";
	
	while(rs.next()){
		if(rs.isLast()){
			IDarray += rs.getInt("ID") + " ], ";
			NOMEarray += "\"" + rs.getString("NOME") + "\" ], ";
			FOTOarray += "\"" + rs.getString("FOTO") + "\" ], ";
			DESCRIParray += "\"" + rs.getString("DESCRIP") + "\" ] } ";
		}else{
			IDarray += rs.getInt("ID") + ", ";
			NOMEarray += "\"" + rs.getString("NOME") + "\", ";
			FOTOarray += "\"" + rs.getString("FOTO") + "\", ";
			DESCRIParray += "\"" + rs.getString("DESCRIP") + "\", ";
		}
	}

	saida += IDarray + NOMEarray + FOTOarray + DESCRIParray;
	
	out.write(saida);
%>