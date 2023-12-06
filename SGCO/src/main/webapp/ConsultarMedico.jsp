<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./img/junta.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SGCO - Medico</title>
<link rel="stylesheet" href="styles.css" />
<script>
    function confirmarDelete(getIdMedico) {
        var confirmacao = confirm("Tem certeza de que deseja deletar?");
        if (confirmacao) {

        	window.location.href = "GatilhoDeletarMedico.jsp?id=" + getIdMedico;
        }
    }
    function converterParaMaiusculas() {
        var elementosTexto = document.querySelectorAll('.maiusculas');
        elementosTexto.forEach(function(elemento) {
            elemento.textContent = elemento.textContent.toUpperCase();
        });
    }
    window.onload = converterParaMaiusculas;
    
    function mostrarPesquisa() {
		const tipoPesquisa = document.getElementById("tipoPesquisa").value;
		const labelDinamico = document.getElementById("labelDinamico");
		labelDinamico.innerHTML = "";

		if (tipoPesquisa === "Nome" || tipoPesquisa === "RG" || tipoPesquisa === "CPF" || tipoPesquisa === "CRM"){
			const input = document.createElement("input");
			input.type = "text";
			input.name = "valorPesquisa";
			input.id = "inputValue";
			input.required = "required";
			labelDinamico.appendChild(input);
			
		}
	}
</script>
</head>

<body>
	<%@ page import="dao.MedicoDao,  java.util.*, tabelas.TbMedico"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}
	List<TbMedico> lista = MedicoDao.getAllMedico();
	request.setAttribute("lista", lista);

	String tipoPesquisa = request.getParameter("tipoPesquisa");
	String valorPesquisa = request.getParameter("valorPesquisa");

	if (tipoPesquisa != null && valorPesquisa != null) {
		if (tipoPesquisa.equals("Nome")) {
			lista = MedicoDao.getRegistroByNome(valorPesquisa);

		} else if (tipoPesquisa.equals("RG")) {
			lista = MedicoDao.getRegistroByRg(valorPesquisa);

		} else if (tipoPesquisa.equals("CPF")) {
			lista = MedicoDao.getRegistroByCpf(valorPesquisa);
			
		}else if (tipoPesquisa.equals("CRM")) {
			lista = MedicoDao.getRegistroByCrm(valorPesquisa);
			
		}
		request.setAttribute("lista", lista);
	}
	%>
	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
		<h1 class="itens-header">SCCO - SISTEMA PARA GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
	</header>
	<main>
	<a href="CadastrarMedico.jsp"><img src="./img/adicionar.svg"
			alt="cadastrar Medico" class="btn-2" /></a>
	
	<form action="" method="get">
		<a>Pesquisar por:</a> <select name="tipoPesquisa" id="tipoPesquisa"
			onchange="mostrarPesquisa()">
			<option value="" selected disabled></option>
			<option value="Nome">Nome</option>
			<option value="RG">RG</option>
			<option value="CPF">CNPJ</option>
			<option value="CRM">CRM</option>
		</select> <label id="labelDinamico"></label> <input type="submit"
			value="Pesquisar">
	</form>
		
		<h2>Consultar Medico</h2>
		<%
	String erroInsercao = (String) session.getAttribute("erroInsercao");
	%>
	<%
	if (erroInsercao != null) {
	%>
	<label class="erroValidacao"><%=erroInsercao%></label>
	<%
	session.removeAttribute("erroInsercao");
	}
	%>
		<table border="1"
			style="border-collapse: collapse; border: 0px solid Silver;">
			<thead>
				<tr style="background-color: #1F7A8C; color: white;">
					<th class="linhatabela colunacentralizar maiusculas">Id</th>
					<th class="linhatabela colunacentralizar maiusculas">Nome</th>
					<th class="linhatabela colunacentralizar maiusculas">RG</th>
					<th class="linhatabela colunacentralizar maiusculas">CPF</th>
					<th class="linhatabela colunacentralizar maiusculas">CRM</th>
					<th class="linhatabela colunacentralizar maiusculas">UR</th>
					<th class="linhatabela colunacentralizar maiusculas">Sexo</th>
					<th class="linhatabela colunacentralizar maiusculas">Celular</th>
					<th class="linhatabela colunacentralizar maiusculas">Data
						Nascimento</th>
					<th class="linhatabela colunacentralizar maiusculas">E-mail</th>
					<th class="linhatabela colunacentralizar maiusculas"
						style="background-color: #E1E5F2; border: 0;"></th>
					<th class="linhatabela colunacentralizar"
						style="background-color: #E1E5F2; border: 0;"></th>
				</tr>

				<c:forEach items="${lista}" var="medico">

					<tr style="">
						<td class="linhatabela colunacentralizar maiusculas">${medico.getIdMedico()}</td>
						<td class="linhatabela maiusculas">${medico.getNomeMedico()}</td>
						<td class="linhatabela maiusculas">${medico.getRg()}</td>
						<td class="linhatabela maiusculas">${medico.getCpf()}</td>
						<td class="linhatabela maiusculas">${medico.getNumeroCrm()}</td>
						<td class="linhatabela maiusculas">${medico.getUrCrm()}</td>
						<td class="linhatabela maiusculas">${medico.getSexo()}</td>
						<td class="linhatabela maiusculas">${medico.getCelular()}</td>
						<td class="linhatabela maiusculas">${medico.getDataNascimentoViwerFormatted()}</td>
						<td class="linhatabela maiusculas">${medico.getEmail()}</td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							href="AlterarMedico.jsp?id=${medico.getIdMedico()}"><img
								src="./img/editar.svg" alt="editar" class="btn-tabela"
								title="Editar" /></a></td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							onclick="confirmarDelete(${medico.getIdMedico()})"><img
								src="./img/deletar.svg" alt="cancelar" class="btn-tabela"
								title="Cancelar" /></a></td>
					</tr>
				</c:forEach>
		</table>


	</main>

</body>
</html>
