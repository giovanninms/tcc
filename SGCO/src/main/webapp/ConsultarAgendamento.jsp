<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./img/junta.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SGCO - Consultar Agendamento</title>
<link rel="stylesheet" href="styles.css" />
<script>
    function confirmarCancelamento(idAgendamento) {
        var confirmacao = confirm("Tem certeza de que deseja cancelar?");
        if (confirmacao) {
            window.location.href = "GatilhoDeletarAgendamento.jsp?id=" + idAgendamento;
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
	
	<%@ page
		import="dao.AgendamentosCirurgiasDao,  java.util.*, tabelas.TbAgendamentosCirurgias"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
		
	}

	List<TbAgendamentosCirurgias> lista = AgendamentosCirurgiasDao.getAllAgendamentos();
	request.setAttribute("lista", lista);
	%>


	
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
		<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>


		<a href="CadastrarAgendamento.jsp"><img src="./img/adicionar.svg"
			alt="adicionar" class="btn-2" title="Cadastrar Agendamento" /></a>
	</header>
	<h2>Consultar Agendamentos</h2>
	<main>
		<table border="1"
			style="border-collapse: collapse; border: 0px solid Silver;">
			<thead>
				<tr style="background-color: #1F7A8C; color: white;">
					<th class="linhatabela colunacentralizar maiusculas">Id</th>
					<th class="linhatabela colunacentralizar maiusculas">Paciente</th>
					<th class="linhatabela colunacentralizar maiusculas">Médico</th>
					<th class="linhatabela colunacentralizar maiusculas">Hospital</th>
					<th class="linhatabela colunacentralizar maiusculas">Local do
						Corpo</th>
					<th class="linhatabela colunacentralizar maiusculas">Tipo de
						Cirurgia</th>
					<th class="linhatabela colunacentralizar maiusculas">Data -
						Hora</th>
					<th class="linhatabela colunacentralizar maiusculas">Status</th>
					<th class="linhatabela colunacentralizar maiusculas"
						style="background-color: #E1E5F2; border: 0;"></th>
					<th class="linhatabela colunacentralizar"
						style="background-color: #E1E5F2; border: 0;"></th>
				</tr>

				<c:forEach items="${lista}" var="agendamento">

					<tr>
						<td class="linhatabela colunacentralizar maiusculas">${agendamento.getIdAgendamento()}</td>
						<td class="linhatabela maiusculas">${agendamento.getStgFkPaciente()}</td>
						<td class="linhatabela maiusculas">${agendamento.getStgFkMedico()}</td>
						<td class="linhatabela maiusculas">${agendamento.getStgFkHospital()}</td>
						<td class="linhatabela maiusculas">${agendamento.getLocalCorpo()}</td>
						<td class="linhatabela maiusculas">${agendamento.getTipoCirurgia()}</td>
						<td class="linhatabela maiusculas">${agendamento.getDataHoraViwerFormatted()}</td>
						<td class="linhatabela maiusculas">${agendamento.getStatusAgendamento()}</td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							href="AlterarAgendamento.jsp?id=${agendamento.getIdAgendamento()}"><img
								src="./img/editar.svg" alt="editar" class="btn-tabela"
								title="Editar" /></a></td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							onclick="confirmarCancelamento(${agendamento.getIdAgendamento()})"><img
								src="./img/deletar.svg" alt="cancelar" class="btn-tabela"
								title="Cancelar" /></a></td>
					</tr>
				</c:forEach>
		</table>


	</main>

</body>
</html>
