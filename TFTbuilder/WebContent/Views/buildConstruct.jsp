<%@page import="models.build"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
	int idUser = 0;
	
	build construct = new build();
	construct.setID(ID);
	construct.searchBuild();
	
	if(session.getAttribute("userLogin") != null){	
		idUser = (int) session.getAttribute("userLogin");
	}
%>
<br>
<br>
<br>
<div class="container mt-5 text-light">
	<div class="row text-center">
		<div class="col-1 p-3 border">
			<button class="btn btn-primary" title="Salvar Alterações" id="salvar" style="background-color: #00B74A" type="button" >
				<i class="fas fa-check"></i>
			</button>
		</div>
		<div class="col-1 p-3 border">
			<button class="btn btn-primary" title="Excluir Build" id="excluir" style="background-color: #F93154" type="button" >
				<i class="fas fa-times"></i>
			</button>
		</div>
		<div class="col-9">
		</div>
		<div class="col-1 p-3 border">
			<button class="btn btn-primary" title="Limpar Time" id="limpar" style="background-color: #1266F1" type="button" >
				<i class="fas fa-broom"></i>
			</button>
		</div>
	</div>
	<br>
	<form method="POST" class="row mb-0" id="buildData">
		<input type="hidden" name="id" value="<%=ID %>">
		<input type="hidden" name="idUser" value="<%=idUser %>">
		<div class="col-2 border form-outline">
			<textarea id="nome" name="nome" class="form-control text-light" rows="3"> <%=construct.getNOME() %> </textarea>
			<label class="form-label text-warning" for="nome">Nome</label>
		</div>
		<div class="col-10 border form-outline"> 
			<textarea id="descrip" name="descrip" class="form-control text-light" rows="3"> <%=construct.getDESCRIP() %> </textarea> 
			<label class="form-label text-warning" for="descrip">Descrição</label>
		</div>
	</form>
	<div class="row">
		<div class="col-2 p-2 border">
			<div class="row row-cols-1 row-cols-md-2 g-2" id="sinergiasDaBuild">
				
				<!-- As sinergias dos campeões da build carregam aqui -->	
					
			</div>
		</div>
		<div class="col-10 border">
			<div id="campeoesDaBuild">
			
				<!-- Os campeões da Build carregam aqui -->
			
			</div>
			<div class="row"><div class="col-md-5 p-0"> <h2 class="border border-bottom-0 border-start-0 m-0 ps-3"> Escolha seus campeões </h2> </div></div>
			<div class="row row-cols-1 row-cols-md-6 border" id="listaDeSelecao">
				
				<!-- Lista de campeões para escolher carrega aqui -->
				
			</div>
		</div>
	</div>
</div>


<script>
	$(document).ready( function() {
		
		$("#campeoesDaBuild").on("click", "img", function(e){
			$.post("../Models/deleteChampFromBuild.jsp", {"champID": this.id, "buildID": <%=ID %>, "userID": <%=idUser %>}, function(data, status) {
				if(!data.success){
					window.alert("Opa! Parece que você acabou entrando na build de outra pessoa! Desculpe, mas você não pode alterar os dados aqui!");
					window.location.replace("../Controlers/builder.jsp?acao=L");
				}else{
					location.reload();
				}
			}, "json");
		});
		
		$("#listaDeSelecao").on("click", "img", function(e) {
			var IDparts = this.id.split("-");
			if(IDparts[0] == 0){
				$.post("../Models/insertChampToBuild.jsp", {"champID": IDparts[1], "buildID": <%=ID %>, "userID": <%=idUser %>}, function(data, status) {
					if(!data.success){
						window.alert(data.message);
						window.location.replace("../Controlers/builder.jsp?acao=L");
					}else{
						location.reload();
					}
				}, "json");
			}else{
				$.post("../Models/deleteChampFromBuild.jsp", {"champID": IDparts[1], "buildID": <%=ID %>, "userID": <%=idUser %>}, function(data, status) {
					if(!data.success){
						window.alert("Opa! Parece que você acabou entrando na build de outra pessoa! Desculpe, mas você não pode alterar os dados aqui!");
						window.location.replace("../Controlers/builder.jsp?acao=L");
					}else{
						location.reload();
					}
				}, "json");
			}
			e.preventDefault();
		});
		
		$.getJSON("../Models/getBuildSynergies.jsp", {"buildID": <%=ID %>}, function(data, status) {
			if(data.success){
				var count = data.idCOUNT;
				var nomes = data.sinNOME;
				var fotos = data.sinFOTO;
				var marcas = data.sinMARCA;
				var QTD1 = data.sinQTD1;
				var QTD2 = data.sinQTD2;
				var QTD3 = data.sinQTD3;
				var QTD4 = data.sinQTD4;
				
				var saida = "";
				for(var i = 0; i < count.length; i++){
					if(count[i] < QTD1[i]){
						saida += "<div class=\"col text-end w-25\">";
						saida += "  <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+nomes[i]+"\" width=\"50px\" />";
						saida += "</div>";
						saida += "<div class=\"col w-75\">";
						saida += "  <small> Quantidade: "+count[i]+"/"+QTD1[i]+" </small>";
						saida += "  <br>";
						saida += "  <small> marca: 0/"+marcas[i]+" </small>";
					}else{
						if(count[i] >= QTD1[i] && (count[i] < QTD2[i] || QTD2[i] == 0)){
							saida += "<div class=\"col text-end w-25\" id=\"marca0\">";
							saida += "  <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+nomes[i]+"\" width=\"50px\" />";
							saida += "</div>";
							saida += "<div class=\"col w-75\" id=\"marca0\">";
							saida += "  <small> Quantidade: "+count[i]+"/"+QTD2[i]+" </small>";
							saida += "  <br>";
							saida += "  <small> marca: 1/"+marcas[i]+"(Bronze) </small>";
						}else{
							if(count[i] >= QTD2[i] && (count[i] < QTD3[i] || QTD3[i] == 0)){
								saida += "<div class=\"col text-end w-25\" id=\"marca1\">";
								saida += "  <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+nomes[i]+"\" width=\"50px\" />";
								saida += "</div>";
								saida += "<div class=\"col w-75\" id=\"marca1\">";
								saida += "  <small> Quantidade: "+count[i]+"/"+QTD3[i]+" </small>";
								saida += "  <br>";
								saida += "  <small> marca: 2/"+marcas[i]+"(Prata) </small>";
							}else{
								if(count[i] >= QTD3[i] && (count[i] < QTD4[i] || QTD4[i] == 0)){
									saida += "<div class=\"col text-end w-25\" id=\"marca2\">";
									saida += "  <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+nomes[i]+"\" width=\"50px\" />";
									saida += "</div>";
									saida += "<div class=\"col w-75\" id=\"marca2\">";
									saida += "  <small> Quantidade: "+count[i]+"/"+QTD4[i]+" </small>";
									saida += "  <br>";
									saida += "  <small> marca: 3/"+marcas[i]+"(Ouro) </small>";
								}else{
									saida += "<div class=\"col text-end w-25\" id=\"marca3\">";
									saida += "  <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+nomes[i]+"\" width=\"50px\" />";
									saida += "</div>";
									saida += "<div class=\"col w-75\" id=\"marca3\">";
									saida += "  <small> Quantidade: "+count[i]+"/"+QTD4[i]+" </small>";
									saida += "  <br>";
									saida += "  <small> marca: 4/"+marcas[i]+"(Platina) </small>";
								}
							}
						}
					}
					
					
					saida += "</div>";
				}
				
				if(count[0] == 0){
					saida = "<h5>Sinergias...</h5>";
				}
				
				$("#sinergiasDaBuild").html(saida);
				
			}
		});
		
		$.getJSON("../Models/getBuildChamps.jsp", {"buildID": <%=ID %>}, function(data, status){
			if(data.success){
				var sinNOMEs = data.sinNOME;
				var sinFOTOs = data.sinFOTO;
				var campIDs = data.campID;
				var campNOMEs = data.campNOME;
				var campFOTOs = data.campFOTO;
				var campTIPOs = data.campTIPO;
				
				var saida = "";
				saida += "<div class=\"row\"> <div class=\"col\"> <h4> Sua quantidade de campeões: "+campIDs.length+"/9 </h4> </div> </div>";
				if(campIDs.length != 0){
					saida += "<div class=\"row row-cols-1 row-cols-md-5 p-5 g-5\" >";
				}else{
					saida += "<div class=\"row p-5\" >";
					saida += "<h1> Sua Build ainda está vazia, acrescente campeões ao clicar em suas imagens na lista abaixo! </h1>";
				}
				
				var divsClasses = ["text-end", "text-center", "text-start"];
				var IDaux = 0;
				
				for(var i = 0; i < campIDs.length; i++){
					saida += "<div class=\"col text-center p-3\">";
					saida += "  <div class=\"row row-cols-md-3\">";
					
					for(var j = 0; j < 3; j++){
						
						saida += "  <div class=\"col "+divsClasses[j]+"\">";
						
						if(j == 0 || j == 2){
							if(campTIPOs[i] == 3)
								saida += "<br>";
							saida += " <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+sinFOTOs[IDaux]+"\" id=\""+campIDs[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+sinNOMEs[IDaux]+"\" />";
							IDaux++;
						}else{
							if(campTIPOs[i] == 3){
								saida += " <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+sinFOTOs[IDaux]+"\" id=\""+campIDs[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+sinNOMEs[IDaux]+"\" />";
								IDaux++;
							}
						}
						saida += "  </div>";
					}
					
					saida += "  </div>";
					saida += "  <img src=\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/"+campFOTOs[i]+"\" class=\"img-fluid rounded-circle\" id=\""+campIDs[i]+"\" alt=\""+campNOMEs[i]+"\" width=\"70px\" />";
					saida += "</div>";
				}
				saida += "</div>"
				
				$("#campeoesDaBuild").html(saida);
				
			}else{
				window.alert("Erro ao carregar construtor de builds!");
				window.location.replace("../Controlers/index.jsp");
			}
		});
		
		$.getJSON("../Models/createChampList.jsp", {"buildID": <%=ID %>}, function(data, status){
			if(data.success){
				var ids = data.id;
				var ativos = data.ativo;
				var nomes = data.nome;
				var fotos = data.foto;
				
				var saida = "";
				
				for(var i=0; i<ids.length; i++){
					saida += "<div class=\"col text-center p-3 border-end border-bottom\">";
					if(ativos[i] == 1)
						saida += "	<img src=\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/"+fotos[i]+"\" style=\"filter: grayscale(100%);\" class=\"img-fluid rounded-circle\" id=\""+ativos[i]+"-"+ids[i]+"\" alt=\""+nomes[i]+"\" width=\"80px\"  />";
					else
						saida += "	<img src=\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" id=\""+ativos[i]+"-"+ids[i]+"\" alt=\""+nomes[i]+"\" width=\"80px\"  />";
					saida += "<h5> "+nomes[i]+" </h5>"
					saida += "</div>"
				}
				$("#listaDeSelecao").html(saida);
				
			}else{
				window.alert("Erro ao carregar construtor de builds!");
				window.location.replace("../Controlers/index.jsp");
			}
		});
		
		$("#salvar").click( function() {
			var buildData = $("#buildData").serialize();
			$.post("../Models/saveBuildData.jsp", buildData, function(data, status) {
				if(data.success){
					window.alert("Dados da build alterados com sucesso!");
					window.location.replace("../Controlers/builder.jsp?acao=L");
				}else{
					window.alert("Opa! Parece que você acabou entrando na build de outra pessoa! Desculpe, mas você não pode alterar os dados aqui!");
					window.location.replace("../Controlers/builder.jsp?acao=L");
				}
				
			}, "json");
		});
		
		$("#excluir").click( function() {
			$.post("../Models/deleteBuild.jsp", {"delete": <%=ID %>, "userID": <%=idUser %>}, function(data, status) {
				if(data.success){
					window.alert("Build excluida com sucesso!");
					window.location.replace("../Controlers/builder.jsp?acao=L");
				}else{
					window.alert("Opa! Parece que você acabou entrando na build de outra pessoa! Desculpe, mas você não pode alterar os dados aqui!");
					window.location.replace("../Controlers/builder.jsp?acao=L");
				}
			}, "json")	
		});
		
		$("#limpar").click( function() {
			$.post("../Models/cleanBuild.jsp", {"buildID": <%=ID %>, "userID": <%=idUser %>}, function(data, status) {
				if(data.success){
					location.reload();
				}else{
					window.alert("Opa! Parece que você acabou entrando na build de outra pessoa! Desculpe, mas você não pode alterar os dados aqui!");
					window.location.replace("../Controlers/builder.jsp?acao=L");
				}
			}, "json")
		});
		
	});
</script>