<%-- 
    Document   : index
    Created on : 24 de out. de 2023, 21:17:37
    Author     : adolf
--%>

<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbUsuarios"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="./img/junta.png" type="image/png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGPO - Início</title>
        <link rel="stylesheet" href="styles.css"/>
    </head>

    <body>

        <%
            String usuario = (String) session.getAttribute("loginUsuario");
            if (usuario == null) {
                response.sendRedirect("index.jsp");
            }
            String status = (String) session.getAttribute("status");

            if (status == "1") {
                response.sendRedirect("TelaUsuarioSemPermissao.jsp");
            }

        %>
        <%@ page import="DAO.ConexaoDAO, java.util.*, Tabelas.TbHospital"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <header>
            <a href="index.jsp" ><img src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial"/></a>
            <a href="Deslogar.jsp" ><img src="./img/deletar.svg" alt="sair" class="btn-home" title="Sair"/></a>
        </header>  
        <main>
            <h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES ORTOPÉDICAS</h1> 
            <h2 class="itens-header">Módulo Distribuidora</h2>

            <a href="ConsultaHospitais.jsp"><button class="btn-principal"><img src="./img/hospital.svg" alt="hospital" title="Consultar Hospital"/>Consulta Hospitais</button></a>
            <a href="ConsultaHospitais.jsp"><button class="btn-principal"><img src="./img/medico.svg" alt="medico" title="Consultar Médicos"/>Consulta Médicos</button></a>
            <a href="ConsultaHospitais.jsp"><button class="btn-principal"><img src="./img/paciente.svg" alt="paciente" title="Consultar Pacientes"/>Consulta Pacientes</button></a>
            <a href="AgendamentosCirurgias.jsp"><button class="btn-principal"><img src="./img/cirurgia.svg" alt="cirurgia" title="Agendamentos Cirurgias"/>Agendamento Cirurgias</button></a>
            <a href="ConsultaUsuarios.jsp"><button class="btn-principal"><img src="./img/usuario.svg" alt="usuario" title="Consultar Usuários"/>Consulta Usuarios</button></a>
        </main>

    </body>
</html>
