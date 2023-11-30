<%-- 
    Document   : EditarHospital
    Created on : 26 de out. de 2023, 12:29:47
    Author     : adolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ConexaoDAO, Tabelas.TbHospital"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./img/junta.png" type="image/png">
        <title>SGOP - Deletar Hospital</title>
        <link rel="stylesheet" href="styles.css"/>
    </head>
    <script>
       
    </script>
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
            TbHospital objhospital = ConexaoDAO.getRegistroById(Integer.parseInt(id)); 
        %>
        
        <a href="ConsultaHospitais.jsp"><img src="./img/voltar.svg" alt="voltar" class="btn-2"/></a>
        <h2>Deletar Hospital</h2>
             
        <form action="GatilhoDeletarHospital.jsp" method="post">   
            <table style="background-color: transparent">                
                <tr><td>Código Hospital: <input class="text_input" type="text" name="idHospital" value="<%=objhospital.getIdHospital()%>" readonly="readonly"/></td></tr>                
                <tr><td>Razão Social: <input class="text_input" type="text" name="razaoSocial" value="<%=objhospital.getRazaoSocial()%>"/></td></tr>                 
                <tr><td>Nome Fantasia: <input class="text_input" type="text" name="nomeFantasia" value="<%=objhospital.getNomeFantasia()%>"/></td></tr>                
                <tr><td>CNPJ: <input class="text_input" type="text" name="cnpjHospital" value="<%=objhospital.getCnpjHospital()%>"/></td></tr>                
                <td><input style="background-color: #8B0000;" onclick="AlertaDeletar()" class="btn-enviar" type="submit" value="Deletar"></td>
            </table>           
        </form>
    
    </body>
  

    
    
</html>
