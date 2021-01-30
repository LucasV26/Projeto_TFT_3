<%@page import="models.usuario"%>
<%@page import="models.sinergia"%>
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
	
	String tipo = request.getParameter("tipo") == null ? "C" : request.getParameter("tipo");
%>

<div class="container text-center">   
	<div class="btn-group btn-group-lg mt-5 mx-auto" role="group" aria-label="Basic example">
	  <a type="button" class="btn btn-primary me-5 <%=tipo.equals("C")?"active":"" %>" href="../Controlers/sinergias.jsp?acao=L&tipo=C"> Classes </a>
	  <% 
	  	if(nivelUser.getID_NIVEL() >= 3){
	  		out.write("<button type=\"button\" class=\"btn btn-outline-primary text-light\" title=\"Criar nova Sinergia\" id=\"createSynergy\" data-mdb-ripple-color=\"dark\">" +
		  			  	"<i class=\"fas fa-plus\"></i>" +
		  			   "</button>");
	  	}
	  %>
	  <a type="button" class="btn btn-primary ms-5 <%=tipo.equals("O")?"active":"" %>" href="../Controlers/sinergias.jsp?acao=L&tipo=O"> Origens </a>
	</div>
</div>

<div class="row row-cols-1 row-cols-md-3 g-4 w-100" id="synergyList">
	<!-- A lista de sinergias carrega aqui -->
</div>

<script>
	$(document).ready( function() {
		
		$("#synergyList").on("click", "button#excluirSyn", function(e) {
			$.post("../Models/deleteSyn.jsp", {idSyn: this.value}, function(data, status) {
				if(data.success){
					window.alert("Sinergia apagada com sucesso!");
					window.location.replace("../Controlers/sinergias.jsp?acao=L");
				}
			}, "json");
		});
		
		$("#createSynergy").click(function() {
			$.post("../Models/createSyn.jsp", function(data, status) {
				window.alert("Nova sinergia criada com sucesso! Redirecionando para edição dos dados...");
				window.location.replace("../Controlers/sinergias.jsp?acao=E&id="+data.id+"");
			}, "json");
		});
		
		$.getJSON("../Models/createSynList.jsp", {"tipo":  <%="\"" +tipo+ "\"" %> }, function(data, status){
			var saida = "";
			
			var ids = data.id;
			var nomes = data.nome;
			var fotos = data.foto;
			var descrips = data.descrip;
			
			for(var i = 0; i < ids.length; i++){
				saida += "<div class=\"col p-0 m-0\">";
				saida += "<div class=\"card mt-5 ms-5 text-light\" id=\"sinCard\" style=\"max-width: 540px\">";
				saida += "  <div class=\"row g-0\">";
				saida += "    <div class=\"col-md-3 border border-light\" id=\"sinImage\">";
				saida += "		<img\r\n" + 
						"        src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+fotos[i]+"\"\r\n" + 
						"        alt=\" "+ nomes[i] +" \"\r\n" + 
						"        class=\"img-fluid mt-4 ms-2\"\r\n" + 
						"        width=\"100px\" " +
						"      />";
				saida += "    </div>";
				saida += "	  <div class=\"col-md-9\">";
				saida += "      <div class=\"card-body border border-light bg-primary\">";
                saida += "        <h4 class=\"card-title bg-dark text-danger text-center\">"+ nomes[i] +"</h4>";
				saida += "        <p class=\"card-text\">";
				saida +=            descrips[i];
				saida += "        </p>";
				saida += "        <h5 class=\"card-text row\">";
				<% if(nivelUser.getID_NIVEL() >= 3){ %>
					saida += "          <a class=\"btn btn-primary col-2\" title=\"Editar Sinergia\" style=\"background-color: #FFA900\" href=\"../Controlers/sinergias.jsp?acao=E&id="+ids[i]+"\" role=\"button\"> ";
					saida += "          	<i class=\"far fa-edit\"></i>";
					saida += "          </a>";
					saida += "          <div class=\"col-1\"> </div>";
					saida += "          <button class=\"btn btn-primary col-2\" title=\"Excluir Sinergia\" style=\"background-color: #F93154\" id=\"excluirSyn\" value=\""+ids[i]+"\" role=\"button\"> ";
					saida += "          	<i class=\"fas fa-times\"></i>";
					saida += "          </button>";
				<% } %>
				saida += "          <div class=\"col-1\"> </div>";
				saida += "          <a class=\"btn btn-primary col-2\" title=\"Detalhar Sinergia\" style=\"background-color: #3b5998\" href=\"../Controlers/sinergias.jsp?acao=D&id="+ids[i]+"\" role=\"button\"> ";
				saida += "          	<i class=\"fas fa-info-circle\"></i>";
				saida += "          </a>\r\n" + 
						"        </h5>\r\n" + 
						"      </div>\r\n" + 
						"    </div>\r\n" + 
						"  </div>\r\n" + 
						"</div>";
				saida += "</div>";	
			}
			
			$("#synergyList").html(saida);
		});
		
	});
</script>