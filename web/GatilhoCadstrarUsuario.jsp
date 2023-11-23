<%-- 
    Document   : InserirHospital
    Created on : 26 de out. de 2023, 21:30:53
    Author     : adolf
--%>

<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbHospital"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    int i = ConexaoDAO.CadastrarHospital(h);    
    response.sendRedirect("ConsultaHospitais.jsp");
    
    

%>
