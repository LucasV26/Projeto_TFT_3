<%@page import="java.sql.ResultSet"%>
<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	
	int ID = Integer.parseInt(request.getParameter("sinID"));
	
	sinergia sin = new sinergia(ID);
	
	ResultSet rs = sin.selectJoin("C.ID, C.FOTO, C.NOME, C.CUSTO", " join sincam SC on sinergia.ID = SC.ID_SINERGIA join campeao C on C.ID = SC.ID_CAMPEAO", "sinergia.ID = "+sin.getID()+" order by C.ID");

	String IDarray = "\"id\": [";
	String NOMEarray = "\"nome\": [";
	String FOTOarray = "\"foto\": [";
	String CUSTOarray = "\"custo\": [";
	
	while(rs.next()){
		if(rs.isLast()){
			IDarray += rs.getInt("ID") + " ], ";
			NOMEarray += "\"" + rs.getString("NOME") + "\" ], ";
			FOTOarray += "\"" + rs.getString("FOTO") + "\" ], ";
			CUSTOarray += "\"" + rs.getString("CUSTO") + "\" ] } ";
		}else{
			IDarray += rs.getInt("ID") + ", ";
			NOMEarray += "\"" + rs.getString("NOME") + "\", ";
			FOTOarray += "\"" + rs.getString("FOTO") + "\", ";
			CUSTOarray += "\"" + rs.getString("CUSTO") + "\", ";
		}
	}

	saida += IDarray + NOMEarray + FOTOarray + CUSTOarray;
	
	out.write(saida);
%>