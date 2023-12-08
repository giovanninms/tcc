<%-- 
    Document   : ConsultaHospitais
    Created on : 26 de out. de 2023, 12:09:17
    Author     : adolf
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UsuarioDao, Tabelas.TbUsuarios"%>

<jsp:useBean id="h" class="Tabelas.TbUsuarios"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="./img/junta.png" type="image/png">
        <title>SGOP - Consulta Hospitais</title>
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
        <header>
            <a href="index.jsp" ><img src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial"/></a>
        </header>     
        <h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES ORTOPÉDICAS</h1> 
        <%@ page import="DAO.ConexaoDAO, java.util.*, Tabelas.TbHospital"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


        <a href="CadastrarHospital.jsp"><img src="./img/adicionar.svg" alt="adicionar" class="btn-2" title="Cadastrar Hospital"/></a>

        <%            List<TbHospital> lista = ConexaoDAO.getAllHospital();
            request.setAttribute("lista", lista);
        %>
        <h2>Consulta Hospitais</h2>
        <table border="1" style="border-collapse: collapse; border:0px solid Silver;">
            <tr style="background-color:#1F7A8C; color: white;">
                <th class="linhatabela colunacentralizar">Código Hospital</th>
                <th class="linhatabela colunacentralizar">Razão Social</th>
                <th class="linhatabela colunacentralizar">Hospital</th>
                <th class="linhatabela colunacentralizar">CNPJ</th>
                <th class="linhatabela colunacentralizar" style="background-color: #E1E5F2; border: 0;"></th>
            </tr>


            <c:forEach items="${lista}" var="objhospital">
                <tr style="">
                    <td class="linha tabela colunacentralizar">${objhospital.getIdHospital()}</td>
                    <td class="linhatabela"><a href="VizualizarHospital.jsp?id=${objhospital.getIdHospital()}">${objhospital.getRazaoSocial()}</td>
                    <td class="linhatabela">${objhospital.getNomeFantasia()}</td>
                    <td class="linhatabela colunacentralizar">${objhospital.getCnpjHospital()} </td>
                    <td style=" background-color: #E1E5F2; border:0; "><a href="EditarHospital.jsp?id=${objhospital.getIdHospital()}"> <img src="./img/editar.svg" alt="editar" class="btn-tabela" title="Editar"/></a><a href="DeletarHospital.jsp?id=${objhospital.getIdHospital()}"><img src="./img/deletar.svg" alt="deletar" class="btn-tabela" title="Deletar"/></a></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
