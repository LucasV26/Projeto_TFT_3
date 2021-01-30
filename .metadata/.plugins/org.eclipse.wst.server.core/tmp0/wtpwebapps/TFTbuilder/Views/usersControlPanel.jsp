<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userId = 0;
	String painel = request.getParameter("painel") == null ? "L" : request.getParameter("painel");
	if(session.getAttribute("userLogin") != null){	
		userId = (int) session.getAttribute("userLogin");
	}
%>
    
<br>
<br>
<br>
<div class="container mt-5">
	<div class="row text-center mb-3">
		<div class="col-2">
			<a type="button" class="btn btn-primary <%=painel.equals("L")?"active":"" %>" href="../Controlers/user.jsp?acao=C&painel=L"> 
				Lista de Usuários 
			</a>
		</div>
		<div class="col-8">
		</div>
		<div class="col-2">
			<a type="button" class="btn btn-primary <%=painel.equals("R")?"active":"" %>" href="../Controlers/user.jsp?acao=C&painel=R"> 
				Lista de Requisições
			</a>
		</div>
	</div>
	<%
		String saida = "";
		if(painel.equals("L")){
			saida += "<div class=\"row\">";
			saida += "<table class=\"table table-bordered border-light text-light text-center\" id=\"userList\">";
			saida += "<tr class=\"bg-dark\">";
			saida += "<th class=\"p-2\"> # </th> <th class=\"p-2\"> ID </th> <th class=\"p-2\"> NOME </th> <th class=\"p-2\"> EMAIL </th> <th class=\"p-2\"> Excluir Usuário </th>";
			saida += "</tr>";
			saida += "<!-- Dados dos usuários existntes carregam aqui -->";
			saida += "</table>";
			saida += "</div>";
			out.write(saida);
		}else{
			if(painel.equals("R")){
				saida += "<div class=\"row\">";
				saida += "<table class=\"table table-bordered border-light text-light text-center\" id=\"requestList\">";
				saida += "<tr class=\"bg-dark\">";
				saida += "<th class=\"p-2\"> # </th> <th class=\"p-2\"> ID </th> <th class=\"p-2\"> NOME </th> <th class=\"p-2\"> NIVEL ATUAL </th> <th class=\"p-2\"> NIVEL ALMEJADO </th> <th class=\"p-2\"> AÇÕES </th>";
				saida += "</tr>";
				saida += "<!-- Dados das requisições existntes carregam aqui -->";
				saida += "</table>";
				saida += "</div>";
				out.write(saida);
			}
		}
	 %>
</div>

<script>
	$(document).ready( function() {
		
		$("#userList").on("click", "button", function(e) {
			
			$.post("../Models/deleteUser.jsp", {idUser: this.value}, function(data, status) {
				window.alert("Usuário excluído com sucesso");
				location.reload();
			}, "json");
			
		});
		
		$("#requestList").on("click", "button", function(e) {
			
			$.post("../Models/deleteRequest.jsp", {idReq: this.value, acao: this.id}, function(data, status) {
				window.alert(data.message);
				location.reload();
			}, "json");
			
		});
		
		$.getJSON("../Models/createUserList.jsp", {idUser: <%=userId %>}, function(data, status) {
			var saida = "";
			
			var ids = data.id;
			var nomes = data.nome;
			var emails = data.email;
			
			for(var i = 0; i < ids.length; i++){
				saida += "<tr>";
				saida += "<td class=\"p-2\">" + (i+1) + 
				"</td> <td class=\"p-2\">" + ids[i] + 
				"</td> <td class=\"p-2\">" + nomes[i] + 
				"</td> <td class=\"p-2\">" + emails[i] + 
				"</td> <td class=\"text-center p-2\">" + 
				"<button class=\"btn btn-primary btn-floating\" title=\"Excluir Usuário\" id=\"excluir\" value=\""+ids[i]+"\" style=\"background-color: #FF8A80\" type=\"button\" > " + 
				"<i class=\"fas fa-times\"></i> " + 
				"</button> </td>";
				saida += "</tr>";
			}
			
			$("#userList").append(saida);
		});
		
		$.getJSON("../Models/createRequestList.jsp", {idUser: <%=userId %>}, function(data, status) {
			var saida = "";
			
			var RQids = data.RQid;
			var USids = data.USid;
			var nomes = data.nome;
			var niveisAt = data.nivelAt;
			var niveisAl = data.nivelAl;
			
			for(var i = 0; i < USids.length; i++){
				saida += "<tr>";
				saida += "<td class=\"p-2\">" + (i+1) + 
				"</td> <td class=\"p-2\">" + USids[i] + 
				"</td> <td class=\"p-2\">" + nomes[i] + 
				"</td> <td class=\"p-2\">" + niveisAt[i] +
				"</td> <td class=\"p-2\">" + niveisAl[i] +
				"</td> <td class=\"text-center p-2\">" +
				"<button class=\"btn btn-primary btn-floating\" title=\"Aceitar\" id=\"aceitar\" value=\""+RQids[i]+"\" style=\"background-color: #00B74A\" type=\"button\" > " + 
				"<i class=\"fas fa-check\"></i> " + 
				"</button>" +
				"<button class=\"btn btn-primary btn-floating\" title=\"Recusar\" id=\"recusar\" value=\""+RQids[i]+"\" style=\"background-color: #FF8A80\" type=\"button\" > " + 
				"<i class=\"fas fa-times\"></i> " + 
				"</button> </td>";
				saida += "</tr>";
			}
			
			$("#requestList").append(saida);
		});
		
	});
</script>