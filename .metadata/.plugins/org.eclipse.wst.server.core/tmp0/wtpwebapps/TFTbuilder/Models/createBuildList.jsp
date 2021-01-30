<%@page import="java.sql.ResultSet"%>
<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	int IDuser = Integer.parseInt(request.getParameter("idUser"));
	
	build builds = new build(IDuser);
	
	ResultSet rs = builds.select(" ID_USUARIO = " + builds.getID_USUARIO());
	
	String IDarray = "\"id\": [";
	String NOMEarray = "\"nome\": [";
	String DESCRIParray = "\"descrip\": [";
	
	while(rs.next()){
		if(rs.isLast()){
			IDarray += rs.getInt("ID");
			NOMEarray += "\"" + rs.getString("NOME") + "\"";
			DESCRIParray += "\"" + rs.getString("DESCRIP") + "\"";
		}else{
			IDarray += rs.getInt("ID") + ", ";
			NOMEarray += "\"" + rs.getString("NOME") + "\", ";
			DESCRIParray += "\"" + rs.getString("DESCRIP") + "\", ";
		}
	}
	
	IDarray += " ], ";
	NOMEarray += " ], ";
	DESCRIParray += " ] } ";
	
	saida += IDarray + NOMEarray + DESCRIParray;
	
	
	System.out.print("\n\n SS \n\n " + saida);
	
	out.write(saida);
%>