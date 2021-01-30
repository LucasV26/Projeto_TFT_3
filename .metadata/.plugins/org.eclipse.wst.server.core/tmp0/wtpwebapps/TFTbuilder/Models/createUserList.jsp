<%@page import="java.sql.ResultSet"%>
<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	int idUser = Integer.parseInt(request.getParameter("idUser"));
	
	usuario usuarios = new usuario();
	ResultSet rs = usuarios.select(" ID != " + idUser);
	
	String IDarray = "\"id\": [ ";
	String NOMEarray = "\"nome\": [ ";
	String EMAILarray = "\"email\": [ ";
	
	while(rs.next()){
		if(rs.isLast()){
			IDarray += rs.getInt("ID");
			NOMEarray += "\"" + rs.getString("NOME") + "\"";
			EMAILarray += "\"" + rs.getString("EMAIL") + "\"";	
		}else{
			IDarray += rs.getInt("ID") + ", ";
			NOMEarray += "\"" + rs.getString("NOME") + "\", ";
			EMAILarray += "\"" + rs.getString("EMAIL") + "\", ";
		}
	}
	
	IDarray += " ], ";
	NOMEarray += " ], ";
	EMAILarray += " ] } ";
	
	saida += IDarray + NOMEarray + EMAILarray;
	
	out.write(saida);
%>