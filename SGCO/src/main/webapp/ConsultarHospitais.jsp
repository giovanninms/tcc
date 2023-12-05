<%-- 
    Document   : ConsultaHospitais
    Created on : 26 de out. de 2023, 12:09:17
    Author     : adolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./img/junta.png" type="image/png">
<title>SGCO - Consulta Hospitais</title>
<link rel="stylesheet" href="styles.css" />
<script>
    function confirmarDeletar(idHospital) {
        var confirmacao = confirm("Tem certeza de que deseja deletar?");
        if (confirmacao) {
           
            window.location.href = "GatilhoDeletarHospital.jsp?id=" + idHospital;
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
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
	</header>
	<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
		ORTOPÉDICAS</h1>
	<%@ page import="dao.*, java.util.*, tabelas.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


	<a href="CadastrarHospital.jsp"><img src="./img/adicionar.svg"
		alt="adicionar" class="btn-2" title="Cadastrar Hospital" /></a>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	List<TbHospital> lista = HospitalDao.getAllHospital();
	request.setAttribute("lista", lista);
	%>

	<h2>Consulta Hospitais</h2>
	<table border="1"
		style="border-collapse: collapse; border: 0px solid Silver;">
		<tr style="background-color: #1F7A8C; color: white;">
			<th class="linhatabela colunacentralizar maiusculas">ID</th>
			<th class="linhatabela colunacentralizar maiusculas">Razão
				Social</th>
			<th class="linhatabela colunacentralizar maiusculas">Hospital</th>
			<th class="linhatabela colunacentralizar maiusculas">CNPJ</th>
			<th class="linhatabela colunacentralizar maiusculas"
				style="background-color: #E1E5F2; border: 0;"></th>
		</tr>


		<c:forEach items="${lista}" var="objhospital">
			<tr style="">
				<td class="linha tabela colunacentralizar">${objhospital.getIdHospital()}</td>
				<td class="linhatabela maiusculas">${objhospital.getRazaoSocial()}</td>
				<td class="linhatabela maiusculas">${objhospital.getNomeFantasia()}</td>
				<td class="linhatabela colunacentralizar maiusculas">${objhospital.getCnpjHospital()}
				</td>
				<td style="background-color: #E1E5F2; border: 0;"><a
					href="AlterarHospital.jsp?id=${objhospital.getIdHospital()}"> <img
						src="./img/editar.svg" alt="editar" class="btn-tabela"
						title="Editar" /></a><a
					onclick="confirmarDeletar(${objhospital.getIdHospital()})"><img
						src="./img/deletar.svg" alt="deletar" class="btn-tabela"
						title="Deletar" /></a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
