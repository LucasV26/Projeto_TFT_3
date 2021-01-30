<%@page import="models.usuario"%>
<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int IDusuario = 0;
	usuario nivelUser = new usuario();
	
	if(session.getAttribute("userLogin") != null){	
		IDusuario = (int) session.getAttribute("userLogin");
		nivelUser = new usuario(IDusuario);
		nivelUser.searchUser();
	}
	
	if(nivelUser.getID_NIVEL() >= 3){
		out.write("<div class=\"container text-center mt-5\"> " +
					 "<div class=\"row\">" +
						 "<div class=\"col\">" +
							 "<button type=\"button\" class=\"btn btn-outline-primary\" title=\"Criar novo Campeão\" id=\"createChamp\" data-mdb-ripple-color=\"dark\">" +
							  	 "<i class=\"fas fa-plus\"></i>" +
							 "</button>" +
						 "</div>" +
					 "</div>" +
				 "</div>");
	}
%>

<div class="row row-cols-1 row-cols-md-3 g-4 w-100" id="champList">
	
	<!-- A lista de campeões existentes vem aqui -->
	
</div>

<script>
	$(document).ready( function() {
		
		$("#champList").on("click", "button#excluirCamp", function(e) {
			$.post("../Models/deleteChamp.jsp", {idChamp: this.value}, function(data, status) {
				if(data.success){
					window.alert("Campeão apagado com sucesso!");
					window.location.replace("../Controlers/campeoes.jsp?acao=L");
				}
			}, "json");
		});
		
		$("#createChamp").click(function() {
			$.post("../Models/createChamp.jsp", function(data, status) {
				window.alert("Novo campeão criado com sucesso! Redirecionando para edição dos dados...");
				window.location.replace("../Controlers/campeoes.jsp?acao=E&id="+data.id+"");
			}, "json");
		});
		
		$.getJSON("../Models/createChampList.jsp", {"buildID": 0}, function(data, status){
			var ids = data.id;
			var nomes = data.nome;
			var fotos = data.foto;
			var custos = data.custo;
			var habs = data.hab;
			
			var saida = "";
			
			for(var i=0; i<ids.length; i++){
				saida += "<div class=\"col p-0 m-0\">";
				saida += " <div class=\"card mt-5 ms-5 text-light\" id=\"campCard\" style=\"max-width: 540px\">";
				saida += "  <div class=\"row g-0\">";
				saida += "    <div class=\"col-md-3 border border-light\" id=\"campImage\">";
				saida += "		<img src=\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/"+fotos[i]+"\" alt=\" "+ nomes[i] +" \" class=\"img-fluid mt-4 ms-2\" id=\"campeaoCusto"+custos[i]+"\" />";
				saida += "    </div>";
				saida += "	  <div class=\"col-md-9\">";
				saida += "      <div class=\"card-body border border-light bg-primary\">";
                saida += "        <h4 class=\"card-title bg-dark text-danger text-center\">"+ nomes[i] +"</h4>";
				saida += "        <p class=\"card-text\">";
				var habDescrip_parts = habs[i].split(";");
				saida +=            habDescrip_parts[0];
				saida += "        </p>";
				saida += "        <h5 class=\"card-text row\">";
				saida += "          <small class=\"col-3 text-danger\"> Custo: " +custos[i]+ "</small>";
				<% if(nivelUser.getID_NIVEL() >= 3){ %>
					saida += "          <a class=\"btn btn-primary col-2\" title=\"Editar Campeao\" style=\"background-color: #FFA900\" href=\"../Controlers/campeoes.jsp?acao=E&id="+ids[i]+"\" role=\"button\"> ";
					saida += "          	<i class=\"far fa-edit\"></i>";
					saida += "          </a>";
					saida += "          <div class=\"col-1\"> </div>";
					saida += "          <button class=\"btn btn-primary col-2\" title=\"Excluir Campeao\" style=\"background-color: #F93154\" id=\"excluirCamp\" value=\""+ids[i]+"\" role=\"button\"> ";
					saida += "          	<i class=\"fas fa-times\"></i>";
					saida += "          </button>";
				<% } %>
				saida += "          <div class=\"col-1\"> </div>";
				saida += "          <a class=\"btn btn-primary col-2\" title=\"Detalhar Campeao\" style=\"background-color: #39C0ED\" href=\"../Controlers/campeoes.jsp?acao=D&id="+ids[i]+"\" role=\"button\"> ";
				saida += "          	<i class=\"fas fa-info-circle\"></i>";
				saida += "          </a>\r\n" + 
						"        </h5>\r\n" + 
						"      </div>\r\n" + 
						"    </div>\r\n" + 
						"  </div>\r\n" + 
						"</div>";
				saida += "</div>";
			}
			
			$("#champList").html(saida);
		});
		
	});
</script>
