<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SGCO - Cadastrar Componente</title>
<link href="styles.css" rel="stylesheet">
<script>
	
</script>
</head>
<body>
	<%@page import="tabelas.TbComponentes, dao.ComponentesDao"%>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>

		<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
		<a href="ConsultarComponentes.jsp"><img src="./img/voltar.svg"
			alt="voltar" class="btn-2" /></a>
	</header>

	<h2>Cadastar Componente</h2>
	<%
	String erroInsercao = (String) session.getAttribute("erroInsercao");
	%>
	<%
	if (erroInsercao != null) {
	%>
	<label class="erroValidacao"><%=erroInsercao%></label>
	<%
	session.removeAttribute("erroInsercao");
	}
	%>
	<form action="GatilhoCadastrarComponente.jsp" method="post">

		<table style="background-color: transparent">

			<tr>
				<td>Descrição:</td>
				<td colspan="3"><input type="text" name="nomeComponente"></td>
			</tr>
			<tr>
				<td>Código:</td>
				<td><input type="text" name="codigoComponente"></td>
				<td>Quantidade:</td>
				<td><input type="text" name="quantidadeComponentes"></td>
			</tr>
			<tr>
				<td>Cirurgia Utilizada:</td>
				<td><select name="cirurgiaUtilizada" required="required">
						<option value="" selected disabled></option>
						<option value="Artroscopia">Artroscopia</option>
						<option value="Substituição de Articulação">Substituição
							de Articulação</option>
						<option value="manguito rotador">manguito rotador</option>
						<option value="tendão de aquiles">tendão de aquiles</option>
						<option value="lca">LCA</option>
						<option value="lcl">LCL</option>
						<option value="lcp">LCP</option>
						<option value="menisco">Menisco</option>

				</select></td>
			</tr>
			<tr>
				<td><input class="btn-enviar" type="submit" value="Cadastrar"></td>
		</table>

	</form>

</body>
</html>