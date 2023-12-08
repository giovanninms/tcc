<%-- 
    Document   : EditarHospital2
    Created on : 26 de out. de 2023, 19:43:18
    Author     : adolf
--%>


<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbUsuarios"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
    int i = UsuarioDao.AtualizarUsuario(h);
    response.sendRedirect("ConsultaUsuarios.jsp");
    
%>



