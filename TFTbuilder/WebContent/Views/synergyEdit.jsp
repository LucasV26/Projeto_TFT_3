<%@page import="models.sinergia"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ID = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
	
	sinergia sin = new sinergia(ID);
	sin.searchSynergy();
%>

<form class="container text-center mt-5" id="synEdit">
	<input type="hidden" name="id" value="<%=ID %>">
	<div class="row mt-5 p-3">
		<div class="col-4 form-outline"> 
			<input type="text" name="nome" id="nome" class="form-control text-light" required value="<%=sin.getNOME() %>" />
			<label class="form-label text-warning" for="nome">Nome</label>
		</div>
		<div class="col-1"> </div>
		<div class="col-4 form-outline"> 
			<input type="text" name="foto" id="foto" class="form-control text-light" required value="<%=sin.getFOTO() %>" />
			<label class="form-label text-warning" for="foto">Foto</label>
		</div>
		<div class="col-1"> </div>
		<div class="col-2"> 
			<label class="form-label text-warning" for="tipo">Tipo: </label>
			<select name="tipo" id="tipo" required>
				<%
					String valorOutra = sin.getTIPO().equals("O")?"C":"O";
					String nomeSinAtual = sin.getTIPO().equals("O")?"Origem":"Classe";
					String nomeSinOutra = sin.getTIPO().equals("O")?"Classe":"Origem";
					
					String saida = "<option value=\""+sin.getTIPO()+"\"/ selected=\"selected\" /> "+ nomeSinAtual +"";
					saida += "<option value=\""+valorOutra+"\" /> "+nomeSinOutra+"";
					out.write(saida);
				%>
			</select>
		</div>
	</div>
	<div class="row mt-5 p-3">
		<div class="col-2"> 
			<div class="form-outline">
				<input type="number" name="marca" id="marca" class="form-control text-light" min="1" max="4" required value="<%=sin.getMARCA() %>" />
				<label class="form-label text-warning" for="marca">Quantidade de Marcas</label>
			</div>
		</div>
		<div class="col-3"> 
			<div class="form-outline">
				<input type="number" min="0" name="qtdMK1" id="qtdMK1" class="form-control text-light" required value="<%=sin.getQTD_MK1() %>" />
				<label class="form-label text-warning" for="qtdMK1">Campeões para Marca 1 (Bronze)</label>
			</div>
			<br>
			<div class="form-outline">
				<input type="number" min="0" name="qtdMK2" id="qtdMK2" class="form-control text-light" required value="<%=sin.getQTD_MK2() %>" />
				<label class="form-label text-warning" for="qtdMK2">Campeões para Marca 2 (Prata)</label>
			</div>
			<br>
			<div class="form-outline">
				<input type="number" min="0" name="qtdMK3" id="qtdMK3" class="form-control text-light" required value="<%=sin.getQTD_MK3() %>" />
				<label class="form-label text-warning" for="qtdMK3">Campeões para Marca 3 (Ouro)</label>
			</div>
			<br>
			<div class="form-outline">
				<input type="number" min="0" name="qtdMK4" id="qtdMK4" class="form-control text-light" required value="<%=sin.getQTD_MK4() %>" />
				<label class="form-label text-warning" for="qtdMK4">Campeões para Marca 4 (Platina)</label>
			</div>
		</div>
		<div class="col-1"></div>
		<div class="col-6">
			<p class="text-danger"> * Separe a quantidade para atingir a melhoria com - (hífem) * </p> 
			<p class="text-danger"> * Separe cada melhoria com ; (ponto e vírgula) * </p> 
			<div class="form-outline">
				<textarea name="markDescrip" rows="3" id="markDescrip" class="form-control text-light" required><%=sin.getMARCA_DESCRIP() %></textarea> 
				<label class="form-label text-warning" for="markDescrip">Melhorias por marca</label>
			</div>
		</div>
	</div>
	<div class="row mt-5 p-3">
		<div class="col-3"></div>
		<div class="col-6 form-outline"> 
			<textarea name="descrip" rows="3" id="descrip" class="form-control text-light" required><%=sin.getDESCRIP() %></textarea> 
			<label class="form-label text-warning" for="descrip">Descrição</label>
		</div>
		<div class="col-3"></div>
	</div>
	
	<div class="row mt-5 p-3">
		<button class="btn btn-primary col-1" type="button" title="Salvar Alterações" style="background-color: #00B74A" id="saveSyn" value="<%=ID %>">
			<i class="fas fa-check"></i>
		</button>
		<div class="col-1"></div>
		<button class="btn btn-primary col-1" type="button" title="Excluir Sinergia" style="background-color: #F93154" id="excluirSyn" value="<%=ID %>">
			<i class="fas fa-times"></i>
		</button>
	</div>
</form>

<script>
	$(document).ready( function() {
		
		$("#excluirSyn").click(function() {
			$.post("../Models/deleteSyn.jsp", {idSyn: this.value}, function(data, status) {
				if(data.success){
					window.alert("Sinergia apagada com sucesso!");
					window.location.replace("../Controlers/sinergias.jsp?acao=L");
				}
			}, "json");
		});
		
		$("#saveSyn").click(function() {
			var synData = $("#synEdit").serialize();
			$.post("../Models/changeSynData.jsp", synData, function(data, status) {
				console.log(synData);
				if(data.success){
					window.alert("Dados da sinergia alterados com sucesso!");
					window.location.replace("../Controlers/sinergias.jsp?acao=L");
				}else{
					window.alert("Sua sinergia possui " + $("#marca").val() + " marcas.\nSertifique-se de adicionar uma quantidade de campeões para cada marca.");
					location.reload();
				}
			}, "json");
			
		});
		
	});
</script>