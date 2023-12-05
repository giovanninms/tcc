<%@page import="dao.*"%>
<jsp:useBean id="h" class="tabelas.TbUsuarios"></jsp:useBean>
<jsp:setProperty property="*" name ="h"/>
<%
   
    h.setLoginUsuario(request.getParameter("loginUsuario"));
    h.setSenhaUsuario(request.getParameter("senhaUsuario"));
    int i = UsuarioDao.ValidarUsuario(h);
    String usuario = "";

    if (i == 1){
    session.setAttribute("loginUsuario", usuario);
    response.sendRedirect("Index.jsp");
    usuario = (String) session.getAttribute("loginUsuario");
    }
    else {
    response.sendRedirect("ErroLogin.jsp");
    }
    
    
    

%>
