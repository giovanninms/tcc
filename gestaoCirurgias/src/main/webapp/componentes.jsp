<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<header>
		<a href="index.jsp"><img src="./img/home.svg" alt="home"
			class="btn-home" title="Tela Inicial" /></a>
	</header>

	<h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES
		ORTOPÉDICAS</h1>

	<a>Pesquiar por:</a>
	<select>
		<option value="" selected disabled></option>
		<option value="Codigo">Codigo</option>
		<option value="Descrição">Descrição</option>
		<option value="CirurgiaUtilizada">Cirurgia Utilizada</option>
	</select>
	<input type="text" id="pesquisaComponente" placeholder="">
	<table border="1"
		style="border-collapse: collapse; border: 0px solid Silver;">
		<tr  style="background-color: #1F7A8C; color: white;">
			<th class="linhatabela colunacentralizar">Codigo</th>
			<th class="linhatabela colunacentralizar">Descrição</th>
			<th class="linhatabela colunacentralizar">Cirurgia Utilizada</th>
			<th class="linhatabela colunacentralizar">Qtd</th>
			
		</tr>
	</table>

</body>
</html>