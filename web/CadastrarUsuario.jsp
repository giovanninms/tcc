<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.UsuarioDao, Tabelas.TbUsuarios"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="./img/junta.png" type="image/png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css"/>
        <title>SGPO - Cadastrar Hospital</title>
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
                            
        
        <a href="ConsultaUsuarios.jsp"><img src="./img/voltar.svg" alt="voltar" class="btn-2"/></a>
        <h2>Cadastrar Hospital</h2>   
        
        <form action="GatilhoCadastrarUsuario.jsp" method="post">
            <table style="background-color: transparent">                                            
                <tr><td>Login: <input class="text_input" type="text" name="loginUsuario" required/></td></tr>                 
                <tr><td>Senha: <input class="text_input" type="password" name="" value="" required/></td></tr>
                <tr><td>Repetir Senha: <input class="text_input" type="password" name="senhaUsuario" value="" required/></td></tr>
                <tr><td>Tipo usuario: 
                    <select name="tipoUsuario" required>
                        <option value="">-</option>
                        <option value="Médico">Médico</option>
                        <option value="Gestor">Gestor</option>                        
                    </select>                    
                </td></tr>
                <tr><td>Nível usuario: 
                        <select name="nivelUsuario" required>
                        <option value="">-</option>
                        <option value="Administrador">Administrador</option>
                        <option value="Usuario">Usuario</option>                        
                    </select>                    
                </td></tr>
                <tr><td>Nome Completo: <input class="text_input" type="text" name="nomeUsuario" value="" required/></td></tr>
                <tr><td>E-mail: <input class="text_input" type="text" name="emailUsuario" value="" required/></td></tr>
                <tr><td>Telefone: <input class="text_input" type="number" name="telefoneUsuario" value="" required/></td></tr>
                <td><input onclick="" class="btn-enviar" type="submit" value="Salvar"></td>
            </table>        
        </form>
    </body>
</html>
