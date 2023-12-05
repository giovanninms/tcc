<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./img/junta.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SGCO - Pacientes</title>
<link rel="stylesheet" href="styles.css" />
<script>
    function confirmarDelete(getIdPaciente) {
        var confirmacao = confirm("Tem certeza de que deseja deletar?");
        if (confirmacao) {

        	window.location.href = "GatilhoDeletarPaciente.jsp?id=" + getIdPaciente;
        }
    }
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
	<%@ page import="dao.PacienteDao,  java.util.*, tabelas.TbPaciente"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	List<TbPaciente> lista = PacienteDao.getAllPacientes();
	request.setAttribute("lista", lista);
	%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
		<h1 class="itens-header">SCCO - SISTEMA PARA GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
	</header>
	<main>
		<a href="CadastrarPaciente.jsp"><img src="./img/adicionar.svg"
			alt="cadastrar paciente" class="btn-2" /></a>

		<h2>Consultar Pacientes</h2>
		<table border="1"
			style="border-collapse: collapse; border: 0px solid Silver;">
			<thead>
				<tr style="background-color: #1F7A8C; color: white;">
					<th class="linhatabela colunacentralizar maiusculas">Id</th>
					<th class="linhatabela colunacentralizar maiusculas">Nome</th>
					<th class="linhatabela colunacentralizar maiusculas">RG</th>
					<th class="linhatabela colunacentralizar maiusculas">CPF</th>
					<th class="linhatabela colunacentralizar maiusculas">Celular</th>
					<th class="linhatabela colunacentralizar maiusculas">E-mail</th>
					<th class="linhatabela colunacentralizar maiusculas">Nascimento</th>
					<th class="linhatabela colunacentralizar maiusculas">Sexo</th>
					<th class="linhatabela colunacentralizar maiusculas">Altura -
						CM</th>
					<th class="linhatabela colunacentralizar maiusculas">Peso - KG</th>
					<th class="linhatabela colunacentralizar maiusculas"
						style="background-color: #E1E5F2; border: 0;"></th>
					<th class="linhatabela colunacentralizar"
						style="background-color: #E1E5F2; border: 0;"></th>
				</tr>

				<c:forEach items="${lista}" var="paciente">

					<tr style="">
						<td class="linhatabela colunacentralizar maiusculas">${paciente.getIdPaciente()}</td>
						<td class="linhatabela maiusculas">${paciente.getNomePaciente()}</td>
						<td class="linhatabela maiusculas">${paciente.getRgPaciente()}</td>
						<td class="linhatabela maiusculas">${paciente.getCpfPaciente()}</td>
						<td class="linhatabela maiusculas">${paciente.getCelular()}</td>
						<td class="linhatabela maiusculas">${paciente.getEmail()}</td>
						<td class="linhatabela maiusculas">${paciente.getDataNascimentoViwerFormatted()}</td>
						<td class="linhatabela maiusculas">${paciente.getSexo()}</td>
						<td class="linhatabela maiusculas">${paciente.getAlturaCm()}</td>
						<td class="linhatabela maiusculas">${paciente.getPesoKg()}</td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							href="AlterarPaciente.jsp?id=${paciente.getIdPaciente()}"><img
								src="./img/editar.svg" alt="editar" class="btn-tabela"
								title="Editar" /></a></td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							onclick="confirmarDelete(${paciente.getIdPaciente()})"><img
								src="./img/deletar.svg" alt="cancelar" class="btn-tabela"
								title="Cancelar" /></a></td>
					</tr>
				</c:forEach>
		</table>


	</main>

</body>
</html>
