<%@page import="javax.print.attribute.standard.Media"%>
<%@page import="dao.ComponentesDao, tabelas.TbComponentes"%>
<jsp:useBean id="c" class="tabelas.TbComponentes"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>



<%

String id = request.getParameter("id");
if (id != null) {
    int idMedico = Integer.parseInt(id);
    TbComponentes componente = ComponentesDao.getRegistroById(idMedico);
    int i = ComponentesDao.deletarComponente(componente);
    response.sendRedirect("ConsultarComponentes.jsp");
    
}
%>


