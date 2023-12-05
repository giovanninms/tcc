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
<title>SGCO - Início</title>
<link rel="stylesheet" href="styles.css" />
<script>
    function confirmarCancelamento(idAgendamento) {
        var confirmacao = confirm("Tem certeza de que deseja cancelar?");
        if (confirmacao) {
            // Redireciona o usuário para a página de cancelamento com o ID do agendamento
            window.location.href = "GatilhoDeletarAgendamento.jsp?id=" + idAgendamento;
        }
    }
</script>
</head>

<body>
	<%@ page import="dao.*,  java.util.*, tabelas.TbAgendamentosCirurgias"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	out.println("Bem Vindo "  +  (String) session.getAttribute("loginUsuario"));

	%>
	<header>
			<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
			<a href="Deslogar.jsp" ><img src="./img/deletar.svg" alt="sair" class="btn-home" title="Sair"/></a>
	</header>
	<main>
		<a href="ConsultarHospitais.jsp"><button class="btn-principal"><img src="./img/hospital.svg" alt="hospital" title="Consultar Hospital" />Hospitais</button></a> 
		<a href="ConsultarComponentes.jsp"><button class="btn-principal"><img src="./img/componente.svg" alt="componente" title="Consultar Componente">Componentes</button></a>
		<a href="ConsultarAgendamento.jsp"><button class="btn-principal"><img alt="agendamento" src="./img/agendamento.svg">Agendamentos</button></a>
		<a href="ConsultarPaciente.jsp"><button class="btn-principal"><img alt="paciente" src="./img/paciente.svg">Pacientes</button></a>
		<a href="ConsultarMedico.jsp"><button class="btn-principal"><img alt="medico" src="./img/medico.svg">Médico</button></a>
		

		

	</main>

</body>
</html>