<%-- 
    Document   : InserirHospital
    Created on : 26 de out. de 2023, 21:30:53
    Author     : adolf
--%>

<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbUsuarios"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    int i = UsuarioDao.CadastrarUsuario(h);    
    response.sendRedirect("ConsultaUsuarios.jsp");
    
    

%>
