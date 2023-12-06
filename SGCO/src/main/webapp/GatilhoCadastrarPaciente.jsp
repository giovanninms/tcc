<%@page import="dao.PacienteDao"%>
<jsp:useBean id="c" class="tabelas.TbPaciente" ></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
	int i = PacienteDao.insertPaciente(c, request);
	if(i==1){
		response.sendRedirect("ConsultarPaciente.jsp");

	}else{
		response.sendRedirect("CadastrarPaciente.jsp");

	}
%>