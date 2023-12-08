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

    int i = UsuarioDao.ValidarUsuario(h);
    String usuario = "";
    
    if (i == 1) {
        session.setAttribute("loginUsuario", usuario);
        session.setAttribute("status","1");
        response.sendRedirect("TelaInicialHospital.jsp");
    } else if (i == 2) {
        session.setAttribute("loginUsuario", usuario);
        session.setAttribute("status","2");
        response.sendRedirect("TelaInicialDistribuidora.jsp");

    } else {
        response.sendRedirect("ErroLogin.jsp");
    }

%>
