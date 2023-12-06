<%@page import="org.eclipse.jdt.internal.compiler.lookup.TagBits"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./img/junta.png" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SGCO - Componentes</title>
<link rel="stylesheet" href="styles.css" />
<script>
function confirmarDelete(getIdComponente) {
    var confirmacao = confirm("Tem certeza de que deseja Deletar?");
    if (confirmacao) {
        window.location.href = "GatilhoDeletarComponente.jsp?id=" + getIdComponente;
    }
}
	function mostrarPesquisa() {
		const tipoPesquisa = document.getElementById("tipoPesquisa").value;
		const labelDinamico = document.getElementById("labelDinamico");
		labelDinamico.innerHTML = "";

		if(tipoPesquisa === "Codigo"){
			const input = document.createElement("input");
			input.type = "number";
			input.name = "valorPesquisa";
			input.id = "inputValue";
			input.required = "required";
			labelDinamico.appendChild(input);
		}
		else if (tipoPesquisa === "Descricao") {
			const input = document.createElement("input");
			input.type = "text";
			input.name = "valorPesquisa";
			input.id = "inputValue";
			input.required = "required";
			labelDinamico.appendChild(input);
		} else if (tipoPesquisa === "CirurgiaUtilizada") {
			const cirurgiaUtilizada = document.createElement("select");
			cirurgiaUtilizada.id = "CirurgiaUtilizada";
			cirurgiaUtilizada.name = "valorPesquisa";
			cirurgiaUtilizada.required = "required";

			var artroscopia = document.createElement("option");
			artroscopia.value = "Artroscopia";
			artroscopia.text = "Artroscopia";

			var substituicao = document.createElement("option");
			substituicao.value = "Substituição de Articulação";
			substituicao.text = "Substituição de Articulação";

			var manguitoRotador = document.createElement("option");
			manguitoRotador.value = "manguito rotador";
			manguitoRotador.text = "Manguito Rotador";

			var tendaoDeAquiles = document.createElement("option");
			tendaoDeAquiles.value = "tendao de aquiles";
			tendaoDeAquiles.text = "Tendão de Aquiles";
			
			var lca = document.createElement("option");
			lca.value = "lca";
			lca.text = "LCA";
			
			var lcp = document.createElement("option");
			lcp.value = "lcp";
			lcp.text = "LCP";
			
			var lcl = document.createElement("option");
			lcl.value = "lcl";
			lcl.text = "LCL";
			
			var menisco = document.createElement("option");
			menisco.value = "menisco";
			menisco.text = "Menisco";
			
			cirurgiaUtilizada.add(artroscopia);
			cirurgiaUtilizada.add(lca);
			cirurgiaUtilizada.add(lcl);
			cirurgiaUtilizada.add(lcp);
			cirurgiaUtilizada.add(manguitoRotador);
			cirurgiaUtilizada.add(menisco);
			cirurgiaUtilizada.add(tendaoDeAquiles);
			cirurgiaUtilizada.add(substituicao);
			
			

			labelDinamico.appendChild(cirurgiaUtilizada);
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
	<%@ page
		import="dao.ComponentesDao, java.util.*, tabelas.TbComponentes"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:useBean id="c" class="tabelas.TbComponentes"></jsp:useBean>
	<jsp:setProperty property="*" name="c" />
	<%
	String usuario = (String) session.getAttribute("loginUsuario");
	if (usuario == null) {
		response.sendRedirect("Login.jsp");
	}

	String tipoPesquisa = request.getParameter("tipoPesquisa");
	String valorPesquisa = request.getParameter("valorPesquisa");


	List<TbComponentes> lista = ComponentesDao.getAllComponentes();
	request.setAttribute("lista", lista);

	if (tipoPesquisa != null && valorPesquisa != null) {
		if (tipoPesquisa.equals("Codigo")) {
			int valorPesquisaInt = Integer.parseInt(valorPesquisa);
			lista = ComponentesDao.getRegistroByCodigo(valorPesquisaInt);

		} else if (tipoPesquisa.equals("Descricao")) {
			lista = ComponentesDao.getRegistroByNome(valorPesquisa);

		} else if (tipoPesquisa.equals("CirurgiaUtilizada")) {
			lista = ComponentesDao.getRegistroByCirurgiaUtilizada(valorPesquisa);
		}
		request.setAttribute("lista", lista);
	}
	%>

	<header>
		<a href="Deslogar.jsp"><img src="./img/deletar.svg" alt="sair"
			class="btn-home" title="Sair" /></a> <a href="Index.jsp"><img
			src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial" /></a>
		<h1 class="itens-header">SGCO - SISTEMA DE GESTÃO DE CIRURGIAS
			ORTOPÉDICAS</h1>
		<a href="CadastrarComponente.jsp"><img src="./img/adicionar.svg"
			alt="cadastrar componente" class="btn-2" /></a>
	</header>
	<h2>Consultar Componentes</h2>
	<main>

		<form action="" method="get">
			<a>Pesquisar por:</a> <select name="tipoPesquisa" id="tipoPesquisa"
				onchange="mostrarPesquisa()">
				<option value="" selected disabled></option>
				<option value="Codigo">Codigo</option>
				<option value="Descricao">Descrição</option>
				<option value="CirurgiaUtilizada">Cirurgia Utilizada</option>
			</select> 
			<label id="labelDinamico"></label> 
			<input type="submit" value="Pesquisar">
		</form>
		<table border="1"
			style="border-collapse: collapse; border: 0px solid Silver;">
			<thead>
				<tr style="background-color: #1F7A8C; color: white;">
					<th class="linhatabela colunacentralizar maiusculas">Id</th>
					<th class="linhatabela colunacentralizar maiusculas">Codigo</th>
					<th class="linhatabela colunacentralizar maiusculas">Descrição</th>
					<th class="linhatabela colunacentralizar maiusculas">Cirurgia
						Utilizado</th>
					<th class="linhatabela colunacentralizar maiusculas">Quantidade</th>
					<th class="linhatabela colunacentralizar maiusculas"
						style="background-color: #E1E5F2; border: 0;"></th>
					<th class="linhatabela colunacentralizar"
						style="background-color: #E1E5F2; border: 0;"></th>
				</tr>

				<c:forEach items="${lista}" var="componente">
					<tr style="">
						<td class="linhatabela colunacentralizar maiusculas">${componente.getIdComponente()}</td>
						<td class="linhatabela maiusculas">${componente.getCodigoComponente()}</td>
						<td class="linhatabela maiusculas">${componente.getNomeComponente()}</td>
						<td class="linhatabela maiusculas">${componente.getCirurgiaUtilizada()}</td>
						<td class="linhatabela colunacentralizar maiusculas">${componente.getQuantidadeComponentes()}</td>

						<td style="background-color: #E1E5F2; border: 0;"><a
							href="AlterarComponente.jsp?id=${componente.getIdComponente()}">
								<img src="./img/editar.svg" alt="editar" class="btn-tabela"
								title="Editar" />
						</a></td>
						<td style="background-color: #E1E5F2; border: 0;"><a
							onclick="confirmarDelete(${componente.getIdComponente()})"> <img
								src="./img/deletar.svg" alt="Deletar" class="btn-tabela"
								title="Deletar" />
						</a></td>

					</tr>
				</c:forEach>
			</thead>
		</table>
	</main>
</body>
</html>
