<%@page import="models.buildcamp"%>
<%@page import="models.build"%>
<%@page import="models.campeao"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	
	int idBuild = Integer.parseInt(request.getParameter("buildID"));

	build buildAtual = new build();
	buildAtual.setID(idBuild);
	
	buildcamp conexao = new buildcamp(buildAtual.getID());
	
	ResultSet campeoesDaBuild = conexao.selectBy("ID_BUILD", ""+conexao.getID_BUILD());
	
	campeao champs = new campeao();
	ResultSet rs = champs.selectAll();
	
	String IDarray = "\"id\": [";
	String ATIVOarray = "\"ativo\": [";
	String NOMEarray = "\"nome\": [";
	String FOTOarray = "\"foto\": [";
	String CUSTOarray = "\"custo\": [";
	String HABDESCarray = "\"hab\": [";
	
	int valor = 0;
	while(rs.next()){
		valor = 0;
		while(campeoesDaBuild.next()){
			if(rs.getInt("ID") == campeoesDaBuild.getInt("ID_CAMPEAO")){
				valor = 1;
			}
		}
		if(!rs.isLast()){
			ATIVOarray += valor + ", ";
			IDarray += rs.getString("ID") + ", ";
			NOMEarray += "\"" + rs.getString("NOME") + "\"" + ", ";
			FOTOarray += "\"" + rs.getString("FOTO") + "\"" + ", ";
			CUSTOarray += rs.getString("CUSTO") + ", ";
			HABDESCarray += "\"" + rs.getString("HABILIDADE_DESCRIP") + "\"" + ", ";
		}else{
			ATIVOarray += valor + "], ";
			IDarray += rs.getString("ID") + "], ";
			NOMEarray += "\"" + rs.getString("NOME") + "\"" + "], ";
			FOTOarray += "\"" + rs.getString("FOTO") + "\"" + "], ";
			CUSTOarray += rs.getString("CUSTO") + "], ";
			HABDESCarray += "\"" + rs.getString("HABILIDADE_DESCRIP") + "\"" + "] }";
		}
		campeoesDaBuild.beforeFirst();
	}

	saida += IDarray + ATIVOarray + NOMEarray + FOTOarray + CUSTOarray + HABDESCarray;
	
	out.write(saida);
%>