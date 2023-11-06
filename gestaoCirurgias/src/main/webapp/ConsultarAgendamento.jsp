<%-- 
    Document   : index
    Created on : 24 de out. de 2023, 21:17:37
    Author     : adolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./img/junta.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SGPO - Inínio</title>
<link rel="stylesheet" href="styles.css" />
<script>
    function confirmarCancelamento(idAgendamento) {
        var confirmacao = confirm("Tem certeza de que deseja cancelar?");
        if (confirmacao) {
            // Redireciona o usuário para a página de cancelamento com o ID do agendamento
            window.location.href = "CancelarAgendamento.jsp?id=" + idAgendamento;
        }
    }
</script>
</head>

<body>
	<%@ page import="dao.*,  java.util.*, tabelas.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	List<TbAgendamentosCirurgias> lista = AgendamentosCirurgiasDao.getAllAgendamentos();
	request.setAttribute("lista", lista);
	%>
	<header>
		<a href="Index.jsp"><img src="./img/home.svg" alt="home"
			class="btn-home" title="Tela Inicial" /></a>
	</header>
	<main>
		<h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES
			ORTOPÉDICAS</h1>
		<a href="ConsultarHospitais.jsp"><button class="btn-principal">
				<img src="./img/hospital.svg" alt="hospital"
					title="Consultar Hospital" />Consulta Hospitais
			</button></a> 
			<a href="CadastrarAgendamento.jsp"> Novo Agendamento</a> 
			<a href="ConsultarComponentes.jsp"> Consultar Componentes</a>
			
		<div class="agendamentos">
		
		<table border="1"
			style="border-collapse: collapse; border: 0px solid Silver;">
			<thead><tr style="background-color: #1F7A8C; color: white;">
				<th class="linhatabela colunacentralizar">Id</th>
				<th class="linhatabela colunacentralizar">Local do Corpo</th>
				<th class="linhatabela colunacentralizar">Tipo de Cirurgia</th>
				<th class="linhatabela colunacentralizar">Data - Hora</th>
				<th class="linhatabela colunacentralizar">Status</th>
				<th class="linhatabela colunacentralizar"
					style="background-color: #E1E5F2; border: 0;"></th>
				<th class="linhatabela colunacentralizar"
					style="background-color: #E1E5F2; border: 0;"></th>
					</tr>
			</thead>
				<c:forEach items="${lista}" var="agendamento">

					<tr style="">
						<td class="linhatabela colunacentralizar">${agendamento.getIdAgendamento()}</td>
						<td class="linhatabela">${agendamento.getLocalCorpo()}</td>
						<td class="linhatabela">${agendamento.getTipoCirurgia()}</td>
						<td class="linhatabela">${agendamento.getDataHoraViwerFormatted()}</td>
						<td class="linhatabela">${agendamento.getStatusAgendamento()}</td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							href="AlterarAgendamento.jsp?id=${agendamento.getIdAgendamento()}"><img
								src="./img/editar.svg" alt="editar" class="btn-tabela"
								title="Editar" /></a></td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							onclick="GatilhoDeletarAgendamento(${agendamento.getIdAgendamento()})"><img
								src="./img/deletar.svg" alt="cancelar" class="btn-tabela"
								title="Cancelar" /></a></td>
					</tr>
				</c:forEach>
		</table>
</div>

	</main>

</body>
</html>
