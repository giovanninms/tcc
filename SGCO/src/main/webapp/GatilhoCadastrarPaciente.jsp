<%@page import="dao.PacienteDao"%>
<jsp:useBean id="c" class="tabelas.TbPaciente" ></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
	int i = PacienteDao.insertPaciente(c);
	response.sendRedirect("ConsultarPaciente.jsp");
%>