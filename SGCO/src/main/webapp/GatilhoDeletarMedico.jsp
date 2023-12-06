<%@page import="dao.MedicoDao, tabelas.TbMedico"%>
<jsp:useBean id="m" class="tabelas.TbMedico"></jsp:useBean>
<jsp:setProperty property="*" name="m"/>



<%
String id = request.getParameter("id");
if (id != null) {
    int idMedico = Integer.parseInt(id);
    TbMedico medico = MedicoDao.getRegistroById(idMedico);
    int i = MedicoDao.deletarMedico(medico, request);
    response.sendRedirect("ConsultarMedico.jsp");
    
}
%>


