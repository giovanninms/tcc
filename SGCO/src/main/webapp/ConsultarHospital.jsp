<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.HospitalDao, tabelas.TbHospital"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./img/junta.png" type="image/png">
<title>SGCO - Consultar Hospital</title>
<link rel="stylesheet" href="styles.css" />
</head>
<script>
	function AlertaAlteracao() {
		alert("Hospital alterado com sucesso.");

	}
</script>
<body>
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
	TbHospital objhospital = HospitalDao.getRegistroById(Integer.parseInt(id));
	%>

	<a href="ConsultarHospitais.jsp"><img src="./img/voltar.svg"
		alt="voltar" class="btn-2" /></a>
	<h2>Consultar Hospital</h2>

	<form action="GatilhoAlterarHospital.jsp" method="post">
		<table style="background-color: transparent">
			<tr>
				<td>Código Hospital: <input class="text_input" type="text"
					name="idHospital" value="<%=objhospital.getIdHospital()%>"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Razão Social: <input class="text_input" type="text"
					name="razaoSocial" value="<%=objhospital.getRazaoSocial()%>"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Nome Fantasia: <input class="text_input" type="text"
					name="nomeFantasia" value="<%=objhospital.getNomeFantasia()%>"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>CNPJ: <input class="text_input" type="text"
					name="cnpjHospital" value="<%=objhospital.getCnpjHospital()%>"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td><input onclick="" class="btn-enviar" type="submit"
					value="Salvar"></td>
		</table>
	</form>

</body>




</html>
