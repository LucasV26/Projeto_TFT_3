<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
int idUser = 0;

if(session.getAttribute("userLogin") != null){	
	idUser = (int) session.getAttribute("userLogin");
}
%>

<br>
<br>
<br>
<br>
<br>
<br>
<div class="container mt-5">
	<div class="row text-center text-light">
		<div class="col border-end border-start border-warning">
			<button type="button" class="btn btn-outline-primary btn-floating btn-lg" id="createBuild" data-mdb-ripple-color="dark">
			  <i class="fas fa-plus"></i>
			</button>
			<h4>Criar nova Build</h4>
		</div>
		<div class="col border-end border-warning">
			<a type="button" class="btn btn-outline-primary btn-floating btn-lg" id="buildBTN" data-mdb-ripple-color="dark" href="builder.jsp?acao=L" >
			  <i class="fas fa-list"></i>
			</a>
			<h4>Vizualizar minhas Builds</h4>
		</div>
	</div>
</div>

<script>
	$(document).ready( function() {
		
		$("#createBuild").click( function() {
			$.post("../Models/createBuild.jsp", {idUser: <%=idUser %>}, function(data, status) {
				if(data.success && data.id != 0){
					window.location.replace("../Controlers/builder.jsp?acao=C&id=" + data.id);
				}else{
					window.alert("Ocorreu um erro ao criar uma nova build!");
				}
				
			}, "json");
		});
		
	});
</script>