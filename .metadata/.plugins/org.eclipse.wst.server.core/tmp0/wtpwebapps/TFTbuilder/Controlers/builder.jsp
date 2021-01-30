<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	int userID = 0;
	
	if(session.getAttribute("userLogin") != null){	
		userID = (int) session.getAttribute("userLogin");
	}

	String acao = request.getParameter("acao") == null ? "S" : request.getParameter("acao");
%>

<%@include file='../Views/head.html'%>

<%@include file='../Views/navBar.jsp'%>

<% 
	if(userID == 0){
		String redirectURL = "index.jsp";
	    response.sendRedirect(redirectURL);
	}else{
%>

	<%if(acao.equals("S")){ %>
		<%@include file='../Views/buildSelect.jsp'%>
	<%}else{ 
		if(acao.equals("L")){%>
		<%@include file='../Views/buildList.jsp'%>
	<%	}else{ %>
		<%@include file='../Views/buildConstruct.jsp'%>
	<%}
	 }
	}%>

<%@include file='../Views/foot.html'%>