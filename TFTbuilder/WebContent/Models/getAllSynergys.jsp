<%@page import="models.campeao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saida = "{ \"success\": true, ";
	int champID = Integer.parseInt(request.getParameter("champID"));
	
	
	sinergia sinergias = new sinergia();
	ResultSet rsAll = sinergias.selectAll();
	
	campeao camp = new campeao(champID);
	ResultSet rsChampSyns = camp.selectJoin( "S.ID, S.NOME", " join sincam SC on campeao.ID = SC.ID_CAMPEAO join sinergia S on S.ID = SC.ID_SINERGIA", "campeao.ID = " + camp.getID() + " order by S.ID" );

	String ALLIDarray = "\"allID\": [ ";
	String ALLNOMEarray = "\"allNOME\": [ ";
	String CHAMPIDarray = "\"champID\": [ ";
	String CHAMPNOMEarray = "\"champNOME\": [ ";
	
	while(rsAll.next()){
		if(rsAll.isLast()){
			ALLIDarray += rsAll.getInt("ID");
			ALLNOMEarray += "\"" + rsAll.getString("NOME") + "\"";
		}else{
			ALLIDarray += rsAll.getInt("ID") + ", ";
			ALLNOMEarray += "\"" + rsAll.getString("NOME") + "\", ";
		}
	}
	
	ALLIDarray += " ], ";
	ALLNOMEarray += " ], ";
	
	while(rsChampSyns.next()){
		if(rsChampSyns.isLast()){
			CHAMPIDarray += rsChampSyns.getInt("ID");
			CHAMPNOMEarray += "\"" + rsChampSyns.getString("NOME") + "\"";
		}else{
			CHAMPIDarray +=  rsChampSyns.getInt("ID") + ", ";
			CHAMPNOMEarray += "\"" + rsChampSyns.getString("NOME") + "\", ";
		}
	}
	
	CHAMPIDarray += " ], ";
	CHAMPNOMEarray += " ] }";
	
	saida += ALLIDarray + ALLNOMEarray + CHAMPIDarray + CHAMPNOMEarray;
	
	out.write(saida);
%>