<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SGCO - Cadastrar Agendamento</title>
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
	    const tipoCirurgiaSelect = document.getElementById("tipoCirurgia");
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
	<%@page
		import="tabelas.TbAgendamentosCirurgias, dao.AgendamentosCirurgiasDao, java.text.SimpleDateFormat, java.sql.Date"%>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}

	String id = request.getParameter("id");
	TbAgendamentosCirurgias agendamento = AgendamentosCirurgiasDao.getRegistroById(Integer.parseInt(id));
	%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>

		<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
		<a href="ConsultarAgendamento.jsp"><img src="./img/voltar.svg"
			alt="voltar" class="btn-2" /></a>
	</header>
	<h2>Cadastrar Agendamento</h2>
	<form action="GatilhoAlterarAgendamento.jsp" method="post">

		<table style="background-color: transparent">
			<tr>
				<td>ID:</td>
				<td colspan="1"><input type="text" name="idAgendamento"
					required maxlength="45" value="<%=agendamento.getIdAgendamento()%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>Paciente:</td>
				<td colspan="3"><input type="text" name="stgFkPaciente"
					id="stgFkPaciente" value="<%=agendamento.getStgFkPaciente()%>"></td>

			</tr>
			<tr>
				<td>Medico:</td>
				<td colspan="3"><input type="text" name="stgFkMedico"
					id="stgFkMedico" value="<%=agendamento.getStgFkMedico()%>"></td>

			</tr>
			<tr>
				<td>Hospital:</td>
				<td colspan="3"><input type="text" name="stgFkHospital"
					id="stgFkHospital" value="<%=agendamento.getStgFkHospital()%>"></td>
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
				<td><select class="selctNovoAgendamento" id="tipoCirurgia"
					name="tipoCirurgia"></select></td>
			</tr>

			<tr>
				<td>Data e hora:</td>
				<td><input name="dataHoraString" type="datetime-local"
					required="required" value="<%=agendamento.getDataHoraString()%>"></td>
				<td>Status:</td>
				<td><select class="selctNovoAgendamento"
					name="statusAgendamento" required="required">
						<option value="" selected disabled><%=agendamento.getStatusAgendamento()%></option>
						<option value="Pré Agendada">Pré Agendada</option>
						<option value="Agendada">Agendada</option>
				</select></td>
			</tr>
			<tr>
				<td><input class="btn-enviar" type="submit" value="Agendar"></td>
		</table>

	</form>

</body>
</html>