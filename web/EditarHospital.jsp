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
        <title>SGOP - Vizualizar Hospital</title>
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
        <h2>Editar Hospital</h2>
             
        <form action="GatilhoEditarHospital.jsp" method="post">   
            <table style="background-color: transparent;">                
                <tr style="background-color: transparent; color:black;"><td>Código Hospital: <input class="text_input" type="text" name="idHospital" value="<%=objhospital.getIdHospital()%>" readonly="readonly"/></td></tr>                
                <tr style="background-color: transparent; color:black;"><td>Razão Social: <input class="text_input" type="text" name="razaoSocial" value="<%=objhospital.getRazaoSocial()%>" required/></td></tr>                 
                <tr style="background-color: transparent; color:black;"><td>Nome Fantasia: <input class="text_input" type="text" name="nomeFantasia" value="<%=objhospital.getNomeFantasia()%>" required/></td></tr>                
                <tr style="background-color: transparent; color:black;"><td>CNPJ: <input class="text_input" type="text" name="cnpjHospital" value="<%=objhospital.getCnpjHospital()%>"/></td></tr>                
                <tr style="background-color: transparent; color:black;"><td><input onclick="" class="btn-enviar" type="submit" value="Salvar"></td></tr>
            </table>           
        </form>
    
    </body>
  

    
    
</html>
