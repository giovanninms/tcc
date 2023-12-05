<%-- 
    Document   : CadatrarHospital
    Created on : 26 de out. de 2023, 21:27:24
    Author     : adolf
--%>

<%@page import="dao.UsuarioDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.HospitalDao, tabelas.TbHospital"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./img/junta.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="styles.css" />
<title>SGCO - Cadastrar Hospital</title>
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.6/jquery.inputmask.min.js"></script>
<script>
	function AlertaAlteracao() {
		alert("Hospital cadastrado com sucesso.");

	}
	$(document).ready(function() {
		$('input[name="telefone"]').inputmask('(99) 9999-9999');
		$('input[name="cnpjHospital"]').inputmask('99.999.999/9999-99');
	});
	function converterParaMaiusculas() {
		var elementosTexto = document.querySelectorAll('.maiusculas');
		elementosTexto.forEach(function(elemento) {
			elemento.textContent = elemento.textContent.toUpperCase();
		});
	}

	window.onload = converterParaMaiusculas;
</script>
<body>
	<%
	
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
		
		String msg = (String) HospitalDao.CadastrarHospital(e);
	
	}
	%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
	</header>
	<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
		ORTOPÉDICAS</h1>


	<a href="ConsultarHospitais.jsp"><img src="./img/voltar.svg"
		alt="voltar" class="btn-2" /></a>
	<h2>Cadastrar Hospital</h2>

	<form action="GatilhoCadastrarHospital.jsp" method="post">
		<table style="background-color: transparent">
			<tr>
				<td>Razão Social:</td>
				<td colspan="3"><input class="text_input" type="text"
					name="razaoSocial" required maxlength="50" /></td>
			</tr>
			<tr>
				<td>Nome Fantasia:</td>
				<td colspan="3"><input class="text_input" type="text"
					name="nomeFantasia" required maxlength="50" /></td>
			</tr>
			<tr>
				<td>CNPJ:</td>
				<td><input class="text_input" type="text" name="cnpjHospital"
					required maxlength="50" /></td>
				<td>Telefone:</td>
				<td><input class="text_input" type="text" name="telefone"
					required /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td colspan="3"><input class="text_input" type="text"
					name="email" required /></td>
			</tr>
			<tr>
				<td>Rua:</td>
				<td colspan="3"><input class="text_input" type="text"
					name="rua" required maxlength="50" /></td>
			</tr>
			<tr>
				<td>Bairro:</td>
				<td colspan="3"><input class="text_input" type="text"
					name="bairro" required maxlength="50" /></td>
			</tr>
			<tr>
				<td>Cidade:</td>
				<td colspan="3"><input class="text_input" type="text"
					name="cidade" required maxlength="50" /></td>
			</tr>
			<tr>
				<td>Estado:</td>
				<td><select id="estado" name="estado">
						<option value="" selected disabled></option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amapá</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Ceará</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Espírito Santo</option>
						<option value="GO">Goiás</option>
						<option value="MA">Maranhão</option>
						<option value="MT">Mato Grosso</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Pará</option>
						<option value="PB">Paraíba</option>
						<option value="PR">Paraná</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piauí</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rondônia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">São Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
				</select></td>
			</tr>

			<tr>
				<td><input class="btn-enviar" type="submit" value="Salvar"></td>
			</tr>
		</table>
	</form>
</body>
</html>
