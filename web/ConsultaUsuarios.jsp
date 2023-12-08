<%-- 
    Document   : ConsultaHospitais
    Created on : 26 de out. de 2023, 12:09:17
    Author     : adolf
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>


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
            String usuario = (String) session.getAttribute("loginUsuario");
            if (usuario == null) {
                response.sendRedirect("index.jsp");
            }

        %>
        <header>
            <a href="index.jsp" ><img src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial"/></a>
        </header>     
        <h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES ORTOPÉDICAS</h1> 
        <%@ page import="DAO.UsuarioDao, java.util.*, Tabelas.TbUsuarios"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


        <a href="CadastrarUsuario.jsp"><img src="./img/adicionar.svg" alt="adicionar" class="btn-2" title="Cadastrar Usuario"/></a>

        <%            List<TbUsuarios> lista = UsuarioDao.getAllUsuarios();
            request.setAttribute("lista", lista);
        %>
        <h2>Consulta Usuarios</h2>
        <table border="1" style="border-collapse: collapse; border:0px solid Silver;">
            <tr style="background-color:#1F7A8C; color: white;">
                <th class="linhatabela colunacentralizar">Código</th>
                <th class="linhatabela colunacentralizar">Login</th>
                <th class="linhatabela colunacentralizar">Nome</th>
                <th class="linhatabela colunacentralizar">E-mail</th>
                <th class="linhatabela colunacentralizar">Telefone</th>
                <th class="linhatabela colunacentralizar" style="background-color: #E1E5F2; border: 0;"></th>

            </tr>


            <c:forEach items="${lista}" var="objusuarios">
                <tr style="">
                    <td class="linha tabela colunacentralizar">${objusuarios.getIdUsuario()}</td>
                    <td class="linhatabela"><a href="VizualizarUsuario.jsp?id=${objusuarios.getIdUsuario()}">${objusuarios.getLoginUsuario()}</a></td>
                    <td class="linhatabela">${objusuarios.getNomeUsuario()}</td>
                    <td class="linhatabela colunacentralizar">${objusuarios.getEmailUsuario()} </td>
                    <td class="linhatabela colunacentralizar">${objusuarios.getTelefoneUsuario()} </td>
                    <td style=" background-color: #E1E5F2; border:0; "><a href="EditarUsuario.jsp?id=${objusuarios.getIdUsuario()}"> <img src="./img/editar.svg" alt="editar" class="btn-tabela" title="Editar"/></a><a href="DeletarUsuario.jsp?id=${objusuarios.getIdUsuario()}"><img src="./img/deletar.svg" alt="deletar" class="btn-tabela" title="Deletar"/></a></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
