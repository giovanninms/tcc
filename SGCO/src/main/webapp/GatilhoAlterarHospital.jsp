<%@page import="dao.HospitalDao"%>
<jsp:useBean id="h" class="tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
    int i = HospitalDao.AtualizarHospital(h);
    response.sendRedirect("ConsultarHospitais.jsp");
    
%>



	