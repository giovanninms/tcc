<%-- 
    Document   : EditarHospital
    Created on : 26 de out. de 2023, 12:29:47
    Author     : adolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UsuarioDao, Tabelas.TbUsuarios"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./img/junta.png" type="image/png">
        <title>SGOP - Vizualizar Hospital</title>
        <link rel="stylesheet" href="styles.css"/>
    </head>
  
    <body>
        <%
            String usuario = (String) session.getAttribute("loginUsuario");
            if (usuario == null){
                response.sendRedirect("index.jsp");
            }
            
        %>
        <header>
            <a href="TelaInicial.jsp" ><img src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial"/></a>
        </header>     
        <h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES ORTOPÉDICAS</h1> 
        
        
        
        <%
            String id = request.getParameter("id");
            TbUsuarios objusuarios = UsuarioDao.getRegistroById(Integer.parseInt(id)); 
        %>
        
        <a href="ConsultaUsuarios.jsp"><img src="./img/voltar.svg" alt="voltar" class="btn-2"/></a>
        <h2>Editar Usuario</h2>
             
        <form action="GatilhoEditarUsuario.jsp" method="post">   
            <table style="background-color: transparent;">                
                <tr style="background-color: transparent; color:black;"><td>Código: <input class="text_input" type="text" name="idUsuario" value="<%=objusuarios.getIdUsuario()%>" readonly="readonly"/></td></tr>                
                <tr style="background-color: transparent; color:black;"><td>Login: <input class="text_input" type="text" name="loginUsuario" value="<%=objusuarios.getLoginUsuario()%>" required/></td></tr>                 
                <tr style="background-color: transparent; color:black;"><td>Nome: <input class="text_input" type="text" name="nomeUsuario" value="<%=objusuarios.getNomeUsuario()%>" required/></td></tr>                
                <tr style="background-color: transparent; color:black;"><td>E-mail: <input class="text_input" type="text" name="emailUsuario" value="<%=objusuarios.getEmailUsuario()%>"/></td></tr>
                <tr style="background-color: transparent; color:black;"><td>Telefone: <input class="text_input" type="tel" pattern="[0-9]{4}[0-9]{4}" placeholder="xxxxxxxx" name="telefoneUsuario" value="<%=objusuarios.getTelefoneUsuario()%>"/></td></tr>                
                <tr style="background-color: transparent; color:black;"><td><input onclick="" class="btn-enviar" type="submit" value="Salvar"></td></tr>
            </table>           
        </form>
    
    </body>
  

    
    
</html>
