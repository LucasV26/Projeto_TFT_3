<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	int idUser = 0;
	build buildList = new build();
	
	if(session.getAttribute("userLogin") != null){	
		idUser = (int) session.getAttribute("userLogin");
		buildList = new build(idUser);
	}
%>

<br>
<br>
<br>
<br>
<div class="container text-center text-light">
	<div class="row ">
		<div class="col">
			<button type="button" class="btn btn-outline-primary" title="Criar nova Build" id="createBuild" data-mdb-ripple-color="dark">
			  	<i class="fas fa-plus"></i>
			</button>
		</div>
	</div>
</div>
<div class="row row-cols-1 row-cols-md-3 g-4 mt-5 w-100" id="buildList">
	
	<!-- A lista de builds do usuário carrega aqui -->
	
</div>

<script>
	$(document).ready( function() {
		
		$("#buildList").on("click", "button#delete", function(e) {
			
			$.post("../Models/deleteBuild.jsp", {"delete": this.value, "userID": <%=idUser %>}, function(data, status) {
				if(data.success){
					window.alert("Build deletada com sucesso!");
					location.reload();
				}else{
					window.alert("Ocorreu um erro ao deletar a nova build!");
				}
				
			}, "json");
			
		});
		
		$.getJSON("../Models/createBuildList.jsp", {idUser: <%=idUser %>}, function(data, status) {
			
			var saida = "";
			
			var ids = data.id;
			var nomes = data.nome;
			var descrips = data.descrip;
			
			for(var i = 0; i < ids.length; i++){
				saida += "<div class=\"col p-0 m-0\">";
				saida += "	<div class=\"card mt-5 ms-5 text-light\" id=\"buildCard\" style=\"max-width: 540px\">";
				saida += "		<div class=\"row g-0\">";
				saida += "			<div class=\"col-md-3 border border-light\" id=\"buildImage\">";
				saida += "				<img src=\"http://localhost:8080/TFTbuilder/Imagens/Misc/Pingu.png\" alt=\"Builds\" class=\"img-fluid\" />";
				saida += "			</div>";
				saida += "			<div class=\"col-md-9\">";
				saida += "				<div class=\"card-body border border-light bg-primary\">";
				saida += "					<h4 class=\"card-title bg-dark text-danger text-center\">"+nomes[i]+"</h4>";
				saida += "					<p class=\"card-text\">";
				saida += "						"+descrips[i]+"";
				saida += "					</p>";
				saida += "					<h5 class=\"card-text row\">";
				saida += "						<a class=\"btn btn-primary col-2\" title=\"Editar Build\" style=\"background-color: #3b5998\" href=\"../Controlers/builder.jsp?acao=C&id="+ids[i]+"\" role=\"button\">";
				saida += "							<i class=\"far fa-edit\"></i>";
				saida += "						</a>";
				saida += "						<button class=\"btn btn-primary col-2\" title=\"Deletar Build\" id=\"delete\" value=\""+ids[i]+"\" style=\"background-color: #FF8A80\" type=\"button\" >";
				saida += "							<i class=\"fas fa-times\"></i>";
				saida += "						</button>";
				saida += "					</h5>";
				saida += "				</div>";
				saida += "			</div>";
				saida += "		</div>";
				saida += "	</div>";
				saida += "</div>";	
			}
			
			if(ids.length == 0){
				saida += "<div class=\"col text-center text-light mx-auto border border-light p-5\">";
				saida += "	Voce nao possui nenhuma build salva";
				saida += "</div>";
			}
			
			$("#buildList").html(saida);
		});
		
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