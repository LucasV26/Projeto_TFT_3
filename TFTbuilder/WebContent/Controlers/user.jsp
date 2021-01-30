<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	int userID = 0;
	usuario nivelUser = new usuario();
	String acao = request.getParameter("acao") == null ? "L" : request.getParameter("acao");
	
	if(session.getAttribute("userLogin") != null){	
		userID = (int) session.getAttribute("userLogin");
		nivelUser = new usuario(userID);
		nivelUser.searchUser();
	}
%>

<%@include file='../Views/head.html'%>

<%@include file='../Views/navBar.jsp'%>

<% if(userID == 0){
	String redirectURL = "index.jsp";
	response.sendRedirect(redirectURL);
}else{ 
	if(acao.equals("L")){%>
	
	<%@include file='../Views/userData.jsp'%>
	
<% }else{
		if(nivelUser.getID_NIVEL() > 1){ %>
			<%@include file='../Views/usersControlPanel.jsp'%>
		<%}
   }
} %>
	   
<%@include file='../Views/foot.html' %>