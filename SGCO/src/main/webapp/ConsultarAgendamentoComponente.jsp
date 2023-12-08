<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>SGCO - Cadastrar Agendamento</title>
<link href="styles.css" rel="stylesheet">
</head>

<body>
	<%@page
		import="tabelas.TbAgendamentosCirurgias, tabelas.TbComponentes, dao.AgendamentosCirurgiasDao, dao.ComponentesDao, java.text.SimpleDateFormat, java.sql.Date, java.util.* "%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:useBean id="c" class="tabelas.TbComponentes"></jsp:useBean>
	<jsp:setProperty property="*" name="c" />
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	String id = request.getParameter("id");
	TbAgendamentosCirurgias agendamento = AgendamentosCirurgiasDao.getRegistroById(Integer.parseInt(id));
	List<TbComponentes> lista = ComponentesDao.getByAgendamento(Integer.parseInt(id));

	request.setAttribute("lista", lista);
	%>
	<header>
		<a href="Index.jsp"><img src="./img/home.svg" alt="home"
			class="btn-home" title="Tela Inicial" /></a>
		 <a href="Deslogar.jsp"><img
			src="./img/deletar.svg" alt="sair" class="btn-home" title="Sair" /></a>

		<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
		<a href="ConsultarAgendamento.jsp"><img src="./img/voltar.svg"
			alt="voltar" class="btn-2" /></a>
	</header>
	<h2>Detalhe Agendamento</h2>

	<div class="container">
		<div class="tabelaAgendamento">
			<h3>Informações Agendamento</h3>
			<table style="background-color: transparent">

				<tr>
					<td>ID:</td>
					<td colspan="1"><input type="text" name="idAgendamento"
						required maxlength="45"
						value="<%=agendamento.getIdAgendamento()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>Paciente:</td>
					<td colspan="3"><input type="text" name="stgFkPaciente"
						id="stgFkPaciente" value="<%=agendamento.getStgFkPaciente()%>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>Medico:</td>
					<td colspan="3"><input type="text" name="stgFkMedico"
						id="stgFkMedico" value="<%=agendamento.getStgFkMedico()%>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>Hospital:</td>
					<td colspan="3"><input type="text" name="stgFkHospital"
						id="stgFkHospital" value="<%=agendamento.getStgFkHospital()%>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>Local Corpo:</td>
					<td><input type="text"
						value="<%=agendamento.getLocalCorpo()%>" readonly="readonly"></td>
					<td>Tipo Cirurgia:</td>
					<td><input type="text"
						value="<%=agendamento.getTipoCirurgia()%>" readonly="readonly"></td>

				</tr>

				<tr>
					<td>Data e hora:</td>
					<td><input name="dataHoraString" type="datetime-local"
						required="required" value="<%=agendamento.getDataHoraString()%>"
						readonly="readonly"></td>
					<td>Status:</td>
					<td><select class="selctNovoAgendamento"
						name="statusAgendamento" required="required"
						style="pointer-events: none;">
							<option value="" selected disabled><%=agendamento.getStatusAgendamento()%>
							</option>
							<option value="Pré Agendada">Pré Agendada</option>
							<option value="Agendada">Agendada</option>
					</select></td>
				</tr>
				<tr>
			</table>
		</div>
		<div class="tabelaComponente">
			<h3>Componentes Solicitados</h3>
			<table class="tableConsultaComponente" border="1"
				style="border-collapse: collapse; border: 0px solid Silver;">
				<thead>
					<tr style="background-color: #1F7A8C; color: white;">
						<th class="linhatabela colunacentralizar maiusculas">Codigo</th>
						<th class="linhatabela colunacentralizar maiusculas">Descrição</th>
						<th class="linhatabela colunacentralizar maiusculas">Cirurgia
							Utilizado</th>
						<th class="linhatabela colunacentralizar maiusculas">Quantidade</th>
					</tr>

					<c:forEach items="${lista}" var="componenteAgendamento">
						<tr style="">
							<td class="linhatabela maiusculas">${componenteAgendamento.getCodigoComponente()}</td>
							<td class="linhatabela maiusculas">${componenteAgendamento.getNomeComponente()}</td>
							<td class="linhatabela maiusculas">${componenteAgendamento.getCirurgiaUtilizada()}</td>
							<td class="linhatabela colunacentralizar maiusculas">${componenteAgendamento.getQuantidadeComponentes()}</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</div>
	</div>
</body>

</html>
