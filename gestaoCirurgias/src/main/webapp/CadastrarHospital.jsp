<%-- 
    Document   : CadatrarHospital
    Created on : 26 de out. de 2023, 21:27:24
    Author     : adolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.HospitalDao, tabelas.TbHospital"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="./img/junta.png" type="image/png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css"/>
        <title>SGPO - Cadastrar Hospital</title>
    </head>
    <script>
        function AlertaAlteracao()
        {
            alert("Hospital cadastrado com sucesso.");
            
        }
    </script>
    <body>
        <header>
            <a href="index.jsp" ><img src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial"/></a>
        </header>     
        <h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES ORTOPÉDICAS</h1>   
                            
        
        <a href="ConsultaHospitais.jsp"><img src="./img/voltar.svg" alt="voltar" class="btn-2"/></a>
        <h2>Cadastrar Hospital</h2>   
        
        <form action="InserirHospital.jsp" method="post">
            <table style="background-color: transparent">                                            
                <tr><td>Razão Social:</td><td><input class="text_input" type="text" name="razaoSocial" required/></td></tr>                 
                <tr><td>Nome Fantasia</td><td><input class="text_input" type="text" name="nomeFantasia" value="" required/></td></tr>                
                <tr><td>CNPJ:</td><td> <input class="text_input" type="text" name="cnpjHospital" value="" required/></td></tr>
                <tr><td><input onclick="" class="btn-enviar" type="submit" value="Salvar"></td>
            </table>        
        </form>
    </body>
</html>
