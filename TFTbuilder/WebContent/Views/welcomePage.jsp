<%@page import="models.usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<br>
<div>
	<h1 class="text-warning text-center"> Aprenda sobre as novidades da temporada DESTINOS de TeamFight Tactics </h1>
</div>  
<br>

<div class="container text-center mt-5 p-5" id="mainMenu">
	<div class="mb-5 p-5 rounded-pill" id="menuVideo">
		<div class="row">
			<br><br><br>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="col">
				<iframe class="border border-warning" width="560" height="315" src="https://www.youtube.com/embed/5cM7YUmvle0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<div class="mt-5 mb-5 p-5 rounded-pill" id="menuChamps">
		<div class="row mt-5">
			<div class="col">
				<img alt="Banner Campeões" src="../Imagens/Misc/Banner_Campeoes.png" width="400px">
			</div>
		</div>
		<br><br>
		<div class="row mt-5">
			<div class="col-7">
				<h3> Descrubra tudo sobre os novos campeões! </h3>
			</div>
			<div class="col">
				<a class="btn btn-warning" title="Visitar Campeões" style="background-color: #FFA900; width: 100px; height: 50px" href="../Controlers/campeoes.jsp?acao=L" role="button">
					<span class="fs-4 text-primary"> IR <i class="fas fa-chevron-right"></i> </span>
				</a>
			</div>
		</div>
		<br><br><br>
	</div>
	<div class="mt-5 mb-5 p-5 rounded-pill" id="menuSyns">
		<br><br>
		<div class="row mt-5">
			<div class="col-7">
				<h3> Aprenda todos os poderes das sinergias! </h3>
			</div>
			<div class="col">
				<a class="btn btn-primary" title="Visitar Sinergias" style="background-color: #1266F1; width: 100px; height: 50px" href="../Controlers/sinergias.jsp?acao=L" role="button">
					<span class="fs-4 text-warning"> IR <i class="fas fa-chevron-right"></i> </span>
				</a>
			</div>
		</div>
		<br><br>
	</div>
	<div class="mt-5 mb-5 p-5 rounded-pill" id="menuBuilder">
		<br><br>
		<div class="row mt-5">
			<div class="col-7">
				<h3> Prepare-se antecipadamente para o campo de batalha, afiando suas estratégias e composições no construtor de equipes! </h3>
			</div>
			<div class="col">
				<a class="btn btn-warning" title="Visitar Builder" style="background-color: #FFA900; width: 100px; height: 50px" href="../Controlers/builder.jsp" role="button">
					<span class="fs-4 text-primary"> IR <i class="fas fa-chevron-right"></i> </span>
				</a>
			</div>
		</div>
		<br><br>
	</div>
</div>

