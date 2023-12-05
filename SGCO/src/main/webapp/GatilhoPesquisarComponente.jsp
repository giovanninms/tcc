<%@page import="org.apache.catalina.startup.ClassLoaderFactory.Repository"%>
<%@ page import="java.util.*" %> 
<%@ page import="tabelas.TbComponentes" %>
<%@ page import="dao.ComponentesDao" %>

<jsp:useBean id="c" class="tabelas.TbComponentes" />
<jsp:setProperty property="*" name="c" />

<%
    // Recuperar parâmetros da requisição
    String tipoPesquisa = request.getParameter("tipoPesquisa");
    String valorPesquisa = request.getParameter("valorPesquisa");

    // Lista para armazenar os resultados da pesquisa
    TbComponentes componentes = null;

    // Verificar se os parâmetros de pesquisa estão presentes
    if (tipoPesquisa != null && valorPesquisa != null) {
        if (tipoPesquisa.equals("Codigo")) {
            // Tratar a pesquisa por Código (supondo que o método seja estático)
            int valorPesquisaInt = Integer.parseInt(valorPesquisa);
             componentes = ComponentesDao.getRegistroByCodigo(valorPesquisaInt);
             response.sendRedirect("ConsultarComponentes.jsp");
        } else if (tipoPesquisa.equals("Descricao")) {
            // Tratar a pesquisa por Descrição (supondo que o método seja estático)
             componentes = ComponentesDao.getRegistroByNome(valorPesquisa);
             response.sendRedirect("ConsultarComponentes.jsp");

        } else if (tipoPesquisa.equals("CirurgiaUtilizada")) {
            // Tratar a pesquisa por Cirurgia Utilizada (supondo que o método seja estático)
             componentes = ComponentesDao.getRegistroByCirurgiaUtilizada(valorPesquisa);
             response.sendRedirect("ConsultarComponentes.jsp");

        }
    }

    // Definir a lista como um atributo de solicitação para uso no JSP
    
%>
