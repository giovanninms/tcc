<%-- 
    Document   : InserirHospital
    Created on : 26 de out. de 2023, 21:30:53
    Author     : adolf
--%>

<%@page import="dao.*"%>
<jsp:useBean id="h" class="tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    int i = HospitalDao.CadastrarHospital(h);    
    response.sendRedirect("ConsultarHospitais.jsp");
    
    

%>
