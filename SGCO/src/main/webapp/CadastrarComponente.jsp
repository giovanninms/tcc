<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SGCO - Cadastrar Componente</title>
<link href="styles.css" rel="stylesheet">
<script>
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
				<td>Local Corpo:</td>
				<td><select class="selctNovoAgendamento" id="localCorpo"
					onchange="mostrarTipoCirurgia()" name="localCorpo"
					required="required">
						<option value="" selected disabled></option>
						<option value="joelho">Joelho</option>
						<option value="quadril">Quadril</option>
						<option value="ombro">Ombro</option>
						<option value="tornozelo">Tornozelo</option>
				</select></td>
				
				<td>Tipo Cirurgia:</td>
				<td><select id="cirurgiaUtilizada" name="cirurgiaUtilizada"></select></td>
			</tr>
			<tr>
				<td><input class="btn-enviar" type="submit" value="Cadastrar"></td>
		</table>

	</form>

</body>
</html>