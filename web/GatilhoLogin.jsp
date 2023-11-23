<%-- 
    Document   : InserirHospital
    Created on : 26 de out. de 2023, 21:30:53
    Author     : adolf
--%>

<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbUsuario"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    int i = ConexaoDAO.ValidarUsuario(h);    
    response.sendRedirect("index.jsp");
    
    

%>
