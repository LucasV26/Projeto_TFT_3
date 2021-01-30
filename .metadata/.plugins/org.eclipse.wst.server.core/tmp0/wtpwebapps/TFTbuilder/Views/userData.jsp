<%@page import="models.nivelusuario"%>
<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 
	int userId = 0;
	
	usuario userData = new usuario();
	nivelusuario nivel = new nivelusuario();
	
	if(session.getAttribute("userLogin") != null){	
		userId = (int) session.getAttribute("userLogin");
		
		userData = new usuario(userId);
		userData.searchUser();
		
		nivel = new nivelusuario(userData.getID_NIVEL());
		nivel.searchLevel();
	}
%>
   
<div class="mt-5 mx-auto w-50">
	<form class="text-center border border-warning p-5 mt-5" method="POST" id="userForm">
	  <!-- 2 column grid layout with text inputs for the first and last names -->
	  <div class="row mb-4">
	    <div class="col">
	      <div class="form-outline">
	        <input type="text" id="nome" name="nome" class="form-control text-light" value="<%=userData.getNOME() %>" />
	        <label class="form-label text-warning" for="nome">Nome</label>
	      </div>
	    </div>
	    <div class="col">
	      <div class="form-outline">
	        <input type="text" id="foto" name="foto" class="form-control text-light" value="<%=userData.getFOTO() %>" />
	        <label class="form-label text-warning" for="foto">Foto</label>
	      </div>
	    </div>
	  </div>
	
	  <!-- Text input -->
	  <div class="form-outline mb-4">
	    <input type="text" id="email" name="email" class="form-control text-light" value="<%=userData.getEMAIL() %>" />
	    <label class="form-label text-warning" for="email">E-mail</label>
	  </div>
	
	  <!-- Text input -->
	  <div class="row mb-4">
	    <div class="col-11">
	      <div class="form-outline">
	        <input type="password" id="senha" name="senha" class="form-control text-light" value="<%=userData.getSENHA() %>"/>
	    	<label class="form-label text-warning" for="senha">Senha</label>
	      </div>
	    </div>
	    <div class="col-1" title="Mostrar/Esconder senha">
	    	<button type="button" class="btn btn-primary btn-floating" id="showPass">
				<i class="fas fa-eye-slash" id="icon"></i>
			</button>
	    </div>
	  </div>
	  
	  <!-- Text input -->
	  <div class="row mb-4">
	    <div class="col-10">
	      <div class="form-outline">
	        <input type="text" id="nivel" name="nivel" class="form-control" value="<%=nivel.getNOME() %>" disabled />
	    	<label class="form-label text-warning" for="nivel">Seu Nivel</label>
	      </div>
	    </div>
	    <div class="col-2" title="Solicitar aumento de cargo">
	    	<button type="button" class="btn btn-primary" id="requestLevel">
			  <i class="fas fa-angle-double-up"></i>
			</button>
	    </div>
	  </div>
	  
	  <input type="hidden" value="<%=userData.getID() %>" name="idUser"/>
	  <input type="hidden" value="<%=nivel.getID() %>" name="idNivel"/>
	  	
	  <!-- Submit button -->
	  <div class="text-center">
		<button type="button" class="btn btn-info" onclick="window.history.back()"> Voltar </button>
		<button type="button" class="btn btn-info" id="submitForm"> Alterar </button>
      </div>
      <br>
      <div id="retorno" class="text-danger"></div>
	</form>
</div>



<script>
	$(document).ready( function() {
		
		$("#submitForm").click( function() {
			var formData = $("#userForm").serialize();
			$.post("../Models/changeUserData.jsp", formData, function(data, status) {
				if(data.success){
					window.alert("Dados alterados com sucesso!");
					window.location.replace("../Controlers/index.jsp");
				}else{
					$("#retorno").html("Ocorrreu um erro! Verifique os dados inceridos.");
				}
				
			}, "json");
		});
		
		$("#requestLevel").click( function() {
			var formData = $("#userForm").serialize();
			$.post("../Models/createRequest.jsp", formData, function(data, status) {
				if(data.success){
					window.alert("Aumento de nivel requisitado, aguarde por uma resposta via e-mail!");
					window.location.replace("../Controlers/index.jsp");
				}else{
					$("#retorno").html(data.message);
				}
				
			}, "json");
		});
		
		$("#showPass").click(function() {
			var pass = document.getElementById("senha");
			var icon = document.getElementById("icon");
			if(pass.type == "text"){
				pass.type = "password";
				$('.fa-eye').toggleClass('fa-eye fa-eye-slash');
			}else{
				pass.type = "text";
				$('.fa-eye-slash').toggleClass('fa-eye-slash fa-eye');
			}
		});
		
	});
</script>