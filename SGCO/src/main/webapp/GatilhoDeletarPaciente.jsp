<%@page import="dao.PacienteDao, tabelas.TbPaciente"%>
<jsp:useBean id="p" class="tabelas.TbPaciente"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>



<%
String id = request.getParameter("id");
if (id != null) {
    int idPaciente = Integer.parseInt(id);
    TbPaciente paciente = PacienteDao.getRegistroById(idPaciente);
    int i = PacienteDao.deletarPaciente(paciente);
    response.sendRedirect("ConsultarPaciente.jsp");
    
}
%>


