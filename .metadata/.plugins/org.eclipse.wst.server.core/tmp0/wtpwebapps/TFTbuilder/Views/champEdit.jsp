<%@page import="models.campeao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));

	campeao camp = new campeao(ID);
	camp.searchChamp();
%>

<form class="container text-center mt-5" id="champEdit">
	<input type="hidden" name="id" value="<%=ID %>">
	<div class="row mt-5 p-3">
		<div class="col-4 form-outline"> 
			<input type="text" name="nome" id="nome" class="form-control text-light" required value="<%=camp.getNOME() %>" />
			<label class="form-label text-warning" for="nome">Nome</label>
		</div>
		<div class="col-1"> </div>
		<div class="col-4 form-outline"> 
			<input type="text" name="foto" id="foto" class="form-control text-light" required value="<%=camp.getFOTO() %>" />
			<label class="form-label text-warning" for="foto">Foto</label>
		</div>
		<div class="col-1"> </div>
		<div class="col-2"> 
			<label class="form-label text-warning" for="custo">Custo: </label>
			<select name="custo" id="custo" required>
				<% 
					String saida = "";
					for(int i = 1; i < 6; i++){
						if(i == camp.getCUSTO()){
							saida += "<option value=\""+camp.getCUSTO()+"\" selected=\"selected\"/> "+camp.getCUSTO()+" ";
						}else{
							saida += "<option value=\""+i+"\"/> "+i+" ";
						}
					}
					
					out.write(saida);
				%>
			</select>
		</div>
	</div>
	<div class="row mt-5 p-3">
		<div class="col-2"> 
			<div class="form-outline">
				<input type="text" name="hab" id="hab" class="form-control text-light" required value="<%=camp.getHABILIDADE() %>" />
				<label class="form-label text-warning" for="hab">Habilidade</label>
			</div>
		</div>
		<div class="col-3"> 
			<div class="form-outline">
				<input type="text" name="habFoto" id="habFoto" class="form-control text-light" required value="<%=camp.getHABILIDADE_FOTO() %>" />
				<label class="form-label text-warning" for="habFoto">Habilidade-foto</label>
			</div>
		</div>
		<div class="col-1"></div>
		<div class="col-6">
			<p class="text-danger"> * Separe cada melhoria com ; (ponto e vírgula) * </p> 
			<div class="form-outline">
				<textarea name="habNivel" rows="3" id="habNivel" class="form-control text-light" required> <%=camp.getHABILIDADE_NVL() %> </textarea> 
				<label class="form-label text-warning" for="habNivel">Habilidade-níveis</label>
			</div>
		</div>
	</div>
	<div class="row mt-5 p-3">
		<div class="col-3"></div>
		<div class="col-6 form-outline"> 
			<textarea name="habDescrip" rows="3" id="habDescrip" class="form-control text-light" required> <%=camp.getHABILIDADE_DESCRIP() %> </textarea> 
			<label class="form-label text-warning" for="habDescrip">Habilidade-descrição</label>
		</div>
		<div class="col-3"></div>
	</div>
	
	<div class="row mt-5 p-3" id="synergyData">
		 
		<!-- O select com as sinergias do campeão carregam aqui -->	
		
	</div>
	
	<div class="row mt-5 p-3">
		<button class="btn btn-primary col-1" type="button" title="Salvar Alterações" style="background-color: #00B74A" id="saveCamp" value="<%=ID %>">
			<i class="fas fa-check"></i>
		</button>
		<div class="col-1"></div>
		<button class="btn btn-primary col-1" type="button" title="Excluir Campeao" style="background-color: #F93154" id="excluirCamp" value="<%=ID %>">
			<i class="fas fa-times"></i>
		</button>
	</div>
</form>

<script>
	$(document).ready( function() {
		
		$("#synergyData").on("change", "input#3Sin", function(e) {
			$("#sinergia3").prop("hidden", !this.checked);
		});
		
		$("#excluirCamp").click(function() {
			$.post("../Models/deleteChamp.jsp", {idChamp: this.value}, function(data, status) {
				if(data.success){
					window.alert("Campeão apagado com sucesso!");
					window.location.replace("../Controlers/campeoes.jsp?acao=L");
				}
			}, "json");
		});
		
		$("#saveCamp").click(function() {
			var campData = $("#champEdit").serialize();
			$.post("../Models/changeChampData.jsp", campData, function(data, status) {
				if(data.success){
					window.alert("Dados de campeão alterados com sucesso!");
					window.location.replace("../Controlers/campeoes.jsp?acao=L");
				}
			}, "json");
			
		});
		
		$.getJSON("../Models/getAllSynergys.jsp", {"champID": <%=ID %>}, function(data, status) {
			var saida = "";
			var select1 = "";
			var select2 = "";
			var select3 = "";
			
			var ALLsinIDs = data.allID;
			var ALLsinNOMEs = data.allNOME;
			var CHAMPsinIDs = data.champID;
			var CHAMPsinNOMEs = data.champNOME;
			
			for(var i = 0; i < ALLsinIDs.length; i++){
				if(ALLsinIDs[i] == CHAMPsinIDs[0]) {
					select1 += "<option value=\""+CHAMPsinIDs[0]+"\" selected=\"selected\"/> "+CHAMPsinNOMEs[0]+" ";
					select2 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
					select3 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
				}else{
					if(ALLsinIDs[i] == CHAMPsinIDs[1]){
						select1 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
						select2 += "<option value=\""+CHAMPsinIDs[1]+"\" selected=\"selected\"/> "+CHAMPsinNOMEs[1]+" ";
						select3 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
					}else{
						if(CHAMPsinIDs.length >= 3){
							if(ALLsinIDs[i] == CHAMPsinIDs[2]){
								select1 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
								select2 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
								select3 += "<option value=\""+CHAMPsinIDs[2]+"\" selected=\"selected\"/> "+CHAMPsinNOMEs[2]+" ";
							}else{
								select1 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
								select2 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
								select3 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
							}
						}else{
							select1 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
							select2 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
							select3 += "<option value=\""+ALLsinIDs[i]+"\" /> "+ALLsinNOMEs[i]+" ";
						}
					}
				}
			}
			
			if(CHAMPsinIDs.length == 0){
				select1 += "<option value=\"\" selected=\"selected\" disabled/> Escolha... ";
				select2 += "<option value=\"\" selected=\"selected\" disabled/> Escolha... ";
				select3 += "<option value=\"\" selected=\"selected\" disabled/> Escolha... ";
			}
			
			saida += "<div class=\"col-3\">";
			saida += "	<label class=\"form-label text-warning\" for=\"3Sin\">Campeão com 3 sinergias</label>";
			saida += "	<input type=\"checkbox\" name=\"3Sin\" id=\"3Sin\" ";
			saida += CHAMPsinIDs.length >= 3 ? "checked=\"checked\"" : " "; 
			saida += "/>";
			saida += "</div>";
			saida += "<div class=\"col-1\">";
			saida += "	<h5 class=\"text-warning text-end\">Sinergias: </h5>";
			saida += "</div>";
			saida += "<div class=\"col-1\" id=\"sinergias\">";
			saida += "	<select name=\"sinergia1\" id=\"sinergia1\" required>";
			saida += select1;
			saida += "  </select>";
			saida += "	<br> <br>";
			saida += "	<select name=\"sinergia2\" id=\"sinergia2\" required>";
			saida += select2;
			saida += "	</select>";
			saida += "	<br> <br>";
			saida += "	<select name=\"sinergia3\" id=\"sinergia3\" ";
			saida +=    CHAMPsinIDs.length < 3 ? "hidden=\"true\"" : " ";
			saida += "  >";
			saida += select3;
			saida += "	</select>";
			saida += "</div>";
			
			$("#synergyData").html(saida);
		});
		
	});
</script>