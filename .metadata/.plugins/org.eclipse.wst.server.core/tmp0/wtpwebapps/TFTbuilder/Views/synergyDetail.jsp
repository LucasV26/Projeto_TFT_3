<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));

	sinergia sin = new sinergia(ID);
	sin.searchSynergy();
%>

<div class="container text-center mt-5" id="sinDetail">
	<div class="row mt-5 border border-warning">
		<div class="col-3 border-end border-warning pt-5">
			<h2> <%=sin.getNOME() %> </h2>
			<img
			  src="../Imagens/Sinergias/<%=sin.getFOTO() %>"
			  class="img-fluid rounded-circle"
			  alt="<%=sin.getNOME() %>"
			  width="200px"
			/>
			<br>
			<br>
			<h4> Quantidade de marcas: <i class="fas fa-layer-group text-warning"></i> <%=sin.getMARCA() %> </h4>
		</div>
		<div class="col-9 mt-5">
			<div class="row">
				<h3 class="text-start"> Descrição: </h3> 
				<div class="col-8 text-start">
					<p class="ms-5"> <%=sin.getDESCRIP() %> </p>
				</div>
			</div>
			<br>
			<div class="row mt-5">
				<h4 class="text-start"> Melhorias por Marca: </h4>
				<%
					String[] marcaDescrip_parts = sin.getMARCA_DESCRIP().split(";");
					int contador = 0;
					for(String markDescrip : marcaDescrip_parts){
						String[] partes = markDescrip.split("-");
						String[] nomes = {"Marca Bronze", "Marca Prata", "Marca Ouro", "Marca Platina"};
						
						out.write("<div class=\"col\" id=\"marca"+contador+"\" title=\""+nomes[contador]+"\"> " +
										"<h5> Campeões necessários para atingir a "+nomes[contador]+": "+ partes[0] +" </h5>" +
										"<br>" +
										"<p> Melhoria: "+ partes[1] +" </p>" + 
								  "</div>");
						contador++;
					}
				%>
			</div>
		</div>
	</div>
	<div class="row border border-warning">
		<div class="col border-end border-warning pt-3">
			<h4> Campeões <%=sin.getNOME() %> </h4>
		</div>
	</div>
	<div class="row border border-warning">
		<div class="row row-cols-1 row-cols-md-3 g-3 w-50 pb-5 mx-auto" id="campsRelated">
		
			<!-- Os campeões que pertencem à sinergia aparecem aqui -->
			
		</div>
	</div>
</div>

<script>
	$(document).ready( function() {
		
		$.getJSON("../Models/getSynData.jsp", {"sinID":  <%=ID %> }, function(data, status){
			var saida = "";
			var ids = data.id;
			var nomes = data.nome;
			var fotos = data.foto;
			var custos = data.custo;
			
			for(var i = 0; i < ids.length; i++){
				saida += "<div class=\"col\">";
				saida += "	<a href=\"../Controlers/campeoes.jsp?acao=D&id="+ids[i]+"\" >	<img src=\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/"+fotos[i]+"\" class=\"img-fluid rounded-circle\" id=\"campeaoCusto"+custos[i]+"\" alt=\""+nomes[i]+"\" width=\"50px\" /> </a>";
				saida += "</div>";
			}
			
			$("#campsRelated").html(saida);
		});
		
	});
</script>