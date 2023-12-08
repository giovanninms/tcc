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
            String status = (String) session.getAttribute("status");
            String usuario = (String) session.getAttribute("loginUsuario");
            if (usuario == null) {
                response.sendRedirect("index.jsp");
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
            <h2 class="itens-header">Usuário sem permissão. Consulte o Administrador do sistema.</h2>


        </main>

    </body>
</html>
