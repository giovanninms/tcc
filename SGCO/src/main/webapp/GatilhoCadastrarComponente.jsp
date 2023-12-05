<%@page import="dao.ComponentesDao"%>
<jsp:useBean id="c" class="tabelas.TbComponentes"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>


<%

int i = ComponentesDao.insertComponente(c);
	response.sendRedirect("CadastrarComponente.jsp");
%>