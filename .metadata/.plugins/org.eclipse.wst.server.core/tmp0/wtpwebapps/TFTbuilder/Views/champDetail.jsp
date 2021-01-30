<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));

	campeao camp = new campeao(ID);
	camp.searchChamp();
%>

<div class="container text-center mt-5" id="champDetail">
	<div class="row mt-5 border border-warning">
		<div class="col-3 border-end border-warning pt-5">
			<h2> <%=camp.getNOME() %> </h2>
			<img
			  src="../Imagens/Campeoes/<%=camp.getFOTO() %>"
			  class="img-fluid rounded-circle"
			  alt="<%=camp.getNOME() %>"
			  width="200px"
			  id="campeaoCusto<%=camp.getCUSTO() %>"
			/>
			<br>
			<br>
			<h4> Custo: <i class="fas fa-coins text-warning"></i> <%=camp.getCUSTO() %> </h4>
		</div>
		<div class="col-9 mt-5">
			<div class="row">
				<h3 class="text-start"> Habilidade: </h3> 
				<div class="col-4">
					<img
					  src="../Imagens/Habilidades/<%=camp.getHABILIDADE_FOTO() %>"
					  class="img-fluid rounded"
					  alt="<%=camp.getHABILIDADE() %>"
					  width="100px"
					/>
					<h5> <%=camp.getHABILIDADE() %> </h5>
				</div>
				<div class="col-8 text-start">
					<%
						String[] habDescrip_parts = camp.getHABILIDADE_DESCRIP().split(";");
						
						for(String hab : habDescrip_parts){
							out.write("<p>" + hab + "</p>");
						}
					%>
					
					<br>
					<h4> Melhorias por Nivel: </h4>
					<%
						String[] nvlParts = camp.getHABILIDADE_NVL().split(";");
						for(String nvl : nvlParts){
							out.write("<p class=\"ms-5\">" + nvl + "</p>");
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- Os detalhes das sinergias e dos campeões relacionados aparecem aqui -->
</div>

<script>
	$(document).ready( function() {
		
		$.getJSON("../Models/getChampData.jsp", {"champID": <%=ID %>}, function(data, status){
			var SINids = data.SINid;
			var SINtipos = data.SINtipo;
			var SINnomes = data.SINnome;
			var SINfotos = data.SINfoto;
			
			var CAMPidSINs = data.CAMPidSIN;
			var CAMPids = data.CAMPid;
			var CAMPnomes = data.CAMPnome;
			var CAMPfotos = data.CAMPfoto;
			var CAMPcustos = data.CAMPcusto;
			
			var saida = "";
			
			for(var i = 0; i < SINids.length; i++){
				saida += "<div class=\"row border border-warning\">";
				saida += "	<div class=\"col border-end border-warning pt-3\">";
				if(SINtipos[i] == "O")
					saida += "		<h4> Origen </h4>";
				else
					saida += "		<h4> Classe </h4>";
				saida += "	</div>";
				saida += "</div>";
				saida += "<div class=\"row border border-warning\">";
				saida += "	<div class=\"col border-end border-warning pt-1\">";
				saida += "		<div class=\"row p-3\">";
				saida += "			<div class=\"col-8\">";
				saida += "				<h2> "+ SINnomes[i] +" </h2>";
				saida += "              <a href=\"../Controlers/sinergias.jsp?acao=D&id="+SINids[i]+"\" > <img src=\"http://localhost:8080/TFTbuilder/Imagens/Sinergias/"+SINfotos[i]+"\" class=\"img-fluid rounded-circle\" alt=\""+ SINnomes[i] +"\" width=\"100px\" /> </a>";
				saida += "			</div>";
				saida += "			<div class=\"col-4\">";
				if(SINtipos[i] == "O") {
					saida += "				<h4> Outros Campeoes da origem "+ SINnomes[i] +" </h4>";
				}else {
					saida += "				<h4> Outros Campeoes da classe "+ SINnomes[i] +" </h4>";
				}
				saida += "				<div class=\"row row-cols-1 row-cols-md-3 g-4\">";
				
				for(var j = 0; j < CAMPids.length; j++){
					if(CAMPidSINs[j] == SINids[i]) {
						saida += "				<div class=\"col\">";
						saida += "					<a href=\"../Controlers/campeoes.jsp?acao=D&id="+CAMPids[j]+"\" >	<img src=\"http://localhost:8080/TFTbuilder/Imagens/Campeoes/"+CAMPfotos[j]+"\" class=\"img-fluid rounded-circle\" id=\"campeaoCusto"+CAMPcustos[j]+"\" alt=\""+CAMPnomes[j]+"\" width=\"50px\" /> </a>";
						saida += "				</div>";
					}
				}
				
				saida += "				</div>";
				saida += "			</div>";
				saida += "		</div>";
				saida += "	</div>";
				saida += "</div>";
			}
			
			$("#champDetail").append(saida);
		});
		
	});
</script>