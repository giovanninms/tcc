<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SGCO - Alterar Componente</title>
<link rel="stylesheet" href="styles.css" />
<script>
	function converterParaMaiusculas() {
		var elementosTexto = document.querySelectorAll('.maiusculas');
		elementosTexto.forEach(function(elemento) {
			elemento.textContent = elemento.textContent.toUpperCase();
		});
	}
	window.onload = converterParaMaiusculas;
	const tipoCirurgiaPorLocaldoCorpo ={
			joelho:["Artroscopia","Substituição de Articulação","lca","lcl","lcp","Menisco"],
			quadril:["Artroscopia","Substituição de Articulação"],
			ombro:["Artroscopia", "Substituição de Articulação", "manguito rotador"],
			tornozelo:["Artroscopia", "Substituição de Articulação", "tendão de aquiles"]
	};

	function mostrarTipoCirurgia() {
	    const localCorpoSelect = document.getElementById("localCorpo").value;
	    const tipoCirurgiaSelect = document.getElementById("cirurgiaUtilizada");
	    tipoCirurgiaSelect.innerHTML = ""; 

	    const tipoCirurgias = tipoCirurgiaPorLocaldoCorpo[localCorpoSelect];
	    if (tipoCirurgias) {
	        tipoCirurgias.forEach(tipoCirurgia => {
	            const option = document.createElement("option");
	            option.value = tipoCirurgia;
	            option.text = tipoCirurgia;
	            option.name = tipoCirurgia;	
	            tipoCirurgiaSelect.appendChild(option);
	        });
	    }
	}
</script>
</head>
<body>
	<%@page import="tabelas.TbComponentes, dao.ComponentesDao"%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
	</header>
	<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
		ORTOPÉDICAS</h1>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	String id = request.getParameter("id");
	TbComponentes componente = ComponentesDao.getRegistroById(Integer.parseInt(id));
	%>
	<a href="ConsultarComponentes.jsp"><img src="./img/voltar.svg"
		alt="voltar" class="btn-2" /></a>
	<h2>Editar Componente</h2>

	<form action="GatilhoAlterarComponente.jsp" method="post">

		<table style="background-color: transparent">
			<tr>
				<td>id <input class="text_input" type="text"
					name="idComponente" value="<%=componente.getIdComponente()%>"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Codigo: <input class="text_input" type="text"
					name="codigoComponente"
					value="<%=componente.getCodigoComponente()%>" required /></td>
			</tr>
			<tr>
				<td>Descrição: <input class="text_input" type="text"
					name="nomeComponente" value="<%=componente.getNomeComponente()%>"
					required /></td>
			</tr>
			<tr>
				<td>Local Corpo:
				<select id="localCorpo" onchange="mostrarTipoCirurgia()" name="localCorpo"
					required="required" >
						<option value="" selected disabled></option>
						<option value="joelho">Joelho</option>
						<option value="quadril">Quadril</option>
						<option value="ombro">Ombro</option>
						<option value="tornozelo">Tornozelo</option>
				</select></td>
				</tr>
				
				<tr>
				<td>Tipo Cirurgia:<select id="cirurgiaUtilizada" name="cirurgiaUtilizada"></select></td>
			</tr>
			<tr>
				<td>Quantidade Disponivel: <input class="text_input"
					type="text" name="quantidadeComponentes"
					value="<%=componente.getQuantidadeComponentes()%>" required /></td>
			</tr>
			<tr>
				<td><input class="btn-enviar" type="submit" value="Salvar"></td>
		</table>

	</form>


</body>
</html>
