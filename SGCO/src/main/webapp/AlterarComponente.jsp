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
				<td>Cirurgia utilizada: <select name="cirurgiaUtilizada"
					required="required">
						<option value="" selected disabled></option>
						<option value="Artroscopia">Artroscopia</option>
						<option value="Substituição de Articulação">Substituição
							de Articulação</option>
						<option value="manguito rotador ">Manguito Rotador</option>
						<option value="tendão de aquiles">Tendão de Aquiles</option>
						<option value="lca">LCA</option>
						<option value="lcl">LCL</option>
						<option value="lcp">LCP</option>
						<option value="menisco">Menisco</option>
				</select></td>
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
