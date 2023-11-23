
<!DOCTYPE htmlr>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<title>Home</title>
</head>
<body>
	<%@ page import="DAO.AgendamentosCirurgiasDao, Tabelas.AgendamentosCirurgias, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<h1>Agendamentos Cirurgias</h1>
	<%
	List<AgendamentosCirurgias> lista = AgendamentosCirurgiasDao.getAllAgendamentos();	
	request.setAttribute("lista", lista);
	
	%>
	<table border="1">
	<tr>
	<th>Id</th>
	<th>Local do Corpo</th>
	<th>Tipo de Cirurgia</th>
	<th>Status</th>
	<th>Editar</th>
	<th>Cancelar</th>
		<c:forEach items="${lista}" var="agendamento">
	
	<tr>
		<td>${agendamento.getIdAgendamento()}</td>
		<td>${agendamento.getLocalCorpo()}</td>
		<td>${agendamento.getTipoCirurgia()}</td>
		<td>${agendamento.getStatusAgendamento()}</td>
		<td><a href="EditarAgendamento.jsp?id=${agendamento.getIdAgendamento()}">Editar</a></td>	
		<td><a href="gatilhoCancelarAgendamento.jsp?id=${agendamento.getIdAgendamento()}">Cancelar</a>	
	</tr>
</c:forEach>
	</table>
		<form action="">
		
		</form>
	
	
    
</body>
</html>