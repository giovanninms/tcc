<%-- 
    Document   : EditarHospital2
    Created on : 26 de out. de 2023, 19:43:18
    Author     : adolf
--%>


<%@page import="dao.*"%>
<jsp:useBean id="h" class="tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
    int i = HospitalDao.AtualizarHospital(h);
    response.sendRedirect("ConsultarHospitais.jsp");
    
%>



