<%@page import="dao.PacienteDao"%>
<jsp:useBean id="p" class="tabelas.TbPaciente"></jsp:useBean>
<jsp:setProperty property="*" name ="p"/>
<%
    int i = PacienteDao.updatePaciente(p);
    response.sendRedirect("ConsultarPaciente.jsp");
    
%>
