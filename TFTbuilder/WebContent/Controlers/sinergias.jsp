<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	int userID = 0;
	usuario userAdmin = new usuario();	

	if(session.getAttribute("userLogin") != null){	
		userID = (int) session.getAttribute("userLogin");
		userAdmin = new usuario(userID);
		userAdmin.searchUser();
	}

	String acao = request.getParameter("acao") == null ? "L" : request.getParameter("acao");
%>

<%@include file='../Views/head.html'%>

<%@include file='../Views/navBar.jsp'%>

<% 
	if(userID == 0){
		String redirectURL = "index.jsp";
	    response.sendRedirect(redirectURL);
	}else{
%>

	<%if(acao.equals("L")){ %>
		<%@include file='../Views/synergyList.jsp'%>
	<%}else{ 
		if(acao.equals("D")){%>
			<%@include file='../Views/synergyDetail.jsp'%>
	<%	}else{
			if(acao.equals("E") && userAdmin.getID_NIVEL() > 2){%>
				<%@include file='../Views/synergyEdit.jsp'%>
			<%}else{
				String redirectURL = "index.jsp";
			    response.sendRedirect(redirectURL);
			}
		}
	  }
	}%>

<%@include file='../Views/foot.html'%>