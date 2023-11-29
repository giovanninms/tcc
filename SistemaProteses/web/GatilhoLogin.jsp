<%-- 
    Document   : InserirHospital
    Created on : 26 de out. de 2023, 21:30:53
    Author     : adolf
--%>

<%@page import="DAO.*"%>
<jsp:useBean id="h" class="Tabelas.TbUsuarios"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    h.setLoginUsuario(request.getParameter("loginUsuario"));
    h.setSenhaUsuario(request.getParameter("senhaUsuario"));
    int i = UsuarioDao.ValidarUsuario(h);
    String usuario = "";

    if (i == 1){
    session.setAttribute("loginUsuario", usuario);
    response.sendRedirect("TelaInicial.jsp");
    }
    else {
    response.sendRedirect("ErroLogin.jsp");
    }
    
    
    

%>
