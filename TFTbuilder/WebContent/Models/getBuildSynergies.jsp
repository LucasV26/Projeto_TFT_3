<%@page import="java.sql.ResultSet"%>
<%@page import="models.campeao"%>
<%@page import="models.buildcamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";

	int idBuild = Integer.parseInt(request.getParameter("buildID"));
	
	buildcamp conexao = new buildcamp(idBuild);
	
	ResultSet campeoesDaBuild = conexao.selectBy("ID_BUILD", ""+conexao.getID_BUILD());
	String where = "";
	
	while(campeoesDaBuild.next()){
		where += "campeao.ID = " + campeoesDaBuild.getString("ID_CAMPEAO");
		
		if(!campeoesDaBuild.isLast()){
			where += " || ";
		}else{
			where += " group by S.ID order by contagem desc";
		}
	}
	
	if(where.isBlank()){
		where = "campeao.ID = 0";
	}
	
	campeao campeoes = new campeao();
	
	ResultSet rs = campeoes.selectJoin("count(S.ID) as contagem, S.NOME, S.FOTO, S.MARCA, S.QTD_MK1, S.QTD_MK2, S.QTD_MK3, S.QTD_MK4", " join sincam SC on campeao.ID = SC.ID_CAMPEAO join sinergia S on S.ID = SC.ID_SINERGIA", where);

	String idCOUNTarray = "\"idCOUNT\": [ ";
	String sinNOMEarray = "\"sinNOME\": [ ";
	String sinFOTOarray = "\"sinFOTO\": [ ";
	String sinMARCAarray = "\"sinMARCA\": [ ";
	String sinQTD1array = "\"sinQTD1\": [ ";
	String sinQTD2array = "\"sinQTD2\": [ ";
	String sinQTD3array = "\"sinQTD3\": [ ";
	String sinQTD4array = "\"sinQTD4\": [ ";
	
	while(rs.next()){
		if(!rs.isLast()){
			idCOUNTarray += rs.getInt("contagem") + ", ";
			sinNOMEarray += "\"" + rs.getString("NOME") + "\", ";
			sinFOTOarray += "\"" + rs.getString("FOTO") + "\", ";
			sinMARCAarray += rs.getInt("MARCA") + ", ";
			sinQTD1array += rs.getInt("QTD_MK1") + ", ";
			sinQTD2array += rs.getInt("QTD_MK2") + ", ";
			sinQTD3array += rs.getInt("QTD_MK3") + ", ";
			sinQTD4array += rs.getInt("QTD_MK4") + ", ";
		}else{
			idCOUNTarray += rs.getInt("contagem") + " ], ";
			sinNOMEarray += "\"" + rs.getString("NOME") + "\" ], ";
			sinFOTOarray += "\"" + rs.getString("FOTO") + "\" ], ";
			sinMARCAarray += rs.getInt("MARCA") + " ], ";
			sinQTD1array += rs.getInt("QTD_MK1") + " ], ";
			sinQTD2array += rs.getInt("QTD_MK2") + " ], ";
			sinQTD3array += rs.getInt("QTD_MK3") + " ], ";
			sinQTD4array += rs.getInt("QTD_MK4") + " ] }";
		}
	}

	saida += idCOUNTarray + sinNOMEarray + sinFOTOarray + sinMARCAarray + sinQTD1array + sinQTD2array + sinQTD3array + sinQTD4array;
	System.out.print("\n\n A \n\n" + saida);
	out.write(saida);
%>