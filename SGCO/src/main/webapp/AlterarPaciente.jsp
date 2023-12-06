<%@page import="dao.PacienteDao"%>
<%@page import="tabelas.TbPaciente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SGCO - Cadastrar Paciente</title>
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
	String id = request.getParameter("id");
	TbPaciente paciente = PacienteDao.getRegistroById(Integer.parseInt(id));
	%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>

		<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
		<a href="ConsultarPaciente.jsp"><img src="./img/voltar.svg"
			alt="voltar" class="btn-2" /></a>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.6/jquery.inputmask.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input[name="celular"]').inputmask('(99) 9 9999-9999');
				$('input[name="cpfPaciente"]').inputmask('999.999.999-99');
				$('input[name="rgPaciente"]').inputmask('99.999.999-9');
			})
		</script>
	</header>

	<h2>Alterar Paciente</h2>
	
	<form action="GatilhoAlterarPaciente.jsp" method="post">

		<table style="background-color: transparent">
			<tr>
				<td>ID:</td>
				<td colspan="1"><input type="text" name="idPaciente" required
					maxlength="45" value="<%=paciente.getIdPaciente()%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>Nome Completo:</td>
				<td colspan="4"><input type="text" name="nomePaciente" required
					maxlength="35" value="<%=paciente.getNomePaciente()%>"></td>
			</tr>
			<tr>
				<td>Celular:</td>
				<td><input type="text" name="celular" required
					value="<%=paciente.getCelular()%>"></td>
				<td>E-mail:</td>
				<td colspan="3"><input type="email" name="email" required
					placeholder="exemplo@email.com" value="<%=paciente.getEmail()%>"></td>
			</tr>
			<tr>
				<td>Data Nascimento:</td>
				<td><input type="date" name="dataNascimentoStg" required
					value="<%=paciente.getDataNascimento()%>"></td>
				<td>RG:</td>
				<td><input type="text" name="rgPaciente" required
					value="<%=paciente.getRgPaciente()%>"></td>
				<td>CPF:</td>
				<td><input type="text" name="cpfPaciente" required
					value="<%=paciente.getCpfPaciente()%>"></td>
			</tr>
			<tr>
				<td>Altura CM:</td>
				<td><input type="number" name="alturaCm" required
					value="<%=paciente.getAlturaCm()%>"></td>
				<td>Peso kG:</td>
				<td><input type="number" name="pesoKg" required
					value="<%=paciente.getPesoKg()%>"></td>
				<td>Sexo:</td>
				<td><select name="sexo" required>
						<option value="" selected disabled><%=paciente.getSexo()%></option>
						<option value="Feminino">Feminino</option>
						<option value="Masculino">Masculino</option>
				</select></td>
			</tr>
			<tr>
				<td><input class="btn-enviar" type="submit"></td>
			</tr>
		</table>

	</form>

</body>
</html>