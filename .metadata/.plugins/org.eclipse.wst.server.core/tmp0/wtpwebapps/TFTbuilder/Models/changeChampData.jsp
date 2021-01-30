<%@page import="models.sincam"%>
<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String saida = "{ \"success\": true }";
	
	int id = Integer.parseInt(request.getParameter("id"));
	String nome = request.getParameter("nome");
	String foto = request.getParameter("foto");
	int custo = Integer.parseInt(request.getParameter("custo"));
	String hab_nome = request.getParameter("hab");
	String hab_foto = request.getParameter("habFoto");
	String hab_nivel = request.getParameter("habNivel");
	String hab_descrip = request.getParameter("habDescrip");
	String haveSin3 = request.getParameter("3Sin"); // Quando a checkbox não está selecionada ela retorna null, quando está selecionada retorna 'on'. testar com (haveSin3 != null)
	int sinergia1 = request.getParameter("sinergia1") == null ? 0 : Integer.parseInt(request.getParameter("sinergia1"));
	int sinergia2 = request.getParameter("sinergia2") == null ? 0 : Integer.parseInt(request.getParameter("sinergia2"));
	int sinergia3 = request.getParameter("sinergia3") == null ? 0 : Integer.parseInt(request.getParameter("sinergia3"));
	
	campeao camp = new campeao(id, nome, foto, hab_nome, hab_foto, hab_descrip, hab_nivel, custo);
	camp.save();
	
	sincam campSyns = new sincam(id);
	campSyns.delete();
	
	if(sinergia1 != 0){
		campSyns = new sincam(id, sinergia1);
		campSyns.save();
	}
	
	if(sinergia2 != 0){
		campSyns = new sincam(id, sinergia2);
		campSyns.save();
	}
	
	if(haveSin3 != null){
		campSyns = new sincam(id, sinergia3);
		campSyns.save();
	}
	
	System.out.print("\n\n" + saida + "\n\n");
	
	out.write(saida);
%>