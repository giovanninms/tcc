<%@page import="dao.HospitalDao, tabelas.TbHospital"%>
<jsp:useBean id="h" class="tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name="h"/>



<%
String id = request.getParameter("id");
if (id != null) {
    int idHospital = Integer.parseInt(id);
    TbHospital hospital = HospitalDao.getRegistroById(idHospital);
    int i = HospitalDao.DeletarHospital(hospital, request);
    response.sendRedirect("ConsultarHospitais.jsp");
}
%>


