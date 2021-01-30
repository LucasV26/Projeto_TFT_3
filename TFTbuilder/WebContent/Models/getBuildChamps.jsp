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
			where += " order by campeao.ID";
		}
	}
	
	if(where.isBlank()){
		where = "campeao.ID = 0";
	}
	
	campeao campeoes = new campeao();
	
	ResultSet rs = campeoes.selectJoin("S.NOME as sinNOME, S.FOTO as sinFOTO, campeao.ID, campeao.NOME, campeao.FOTO", " join sincam SC on campeao.ID = SC.ID_CAMPEAO join sinergia S on S.ID = SC.ID_SINERGIA", where);

	String sinNOMEarray = "\"sinNOME\": [ ";
	String sinFOTOarray = "\"sinFOTO\": [ ";
	String campIDarray = "\"campID\": [ ";
	String campNOMEarray = "\"campNOME\": [ ";
	String campFOTOarray = "\"campFOTO\": [ ";
	String campTIPOarray = "\"campTIPO\": [ ";
	
	int idCampPassado = 0;
	int countCampTipo = 1;
	while(rs.next()){
		
		if(rs.getInt("ID") != idCampPassado){
			if(!rs.isFirst()){
				campTIPOarray += countCampTipo + ", ";	
				campIDarray += ", ";
				campNOMEarray += ", ";
				campFOTOarray += ", ";
			}
			campIDarray += rs.getInt("ID");
			campNOMEarray += "\"" + rs.getString("NOME") + "\"";
			campFOTOarray += "\"" + rs.getString("FOTO") + "\"";
			countCampTipo = 1;
		}else{
			countCampTipo++;
		}
		
		sinNOMEarray += "\"" + rs.getString("sinNOME") + "\"";
		sinFOTOarray += "\"" + rs.getString("sinFOTO") + "\"";
		
		if(!rs.isLast()){
			sinNOMEarray += ", ";
			sinFOTOarray += ", ";
		}
		
		idCampPassado = rs.getInt("ID");
	}
	
	campTIPOarray += countCampTipo + " ] }";	
	campIDarray += " ], ";
	campNOMEarray += " ], ";
	campFOTOarray += " ], ";
	sinNOMEarray += " ], ";
	sinFOTOarray += " ], ";
	
	saida += sinNOMEarray + sinFOTOarray + campIDarray + campNOMEarray + campFOTOarray + campTIPOarray;
	
	out.write(saida);
	
%>