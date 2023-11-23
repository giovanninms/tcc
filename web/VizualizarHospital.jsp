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
    
    <body>
        <header>
            <a href="index.jsp" ><img src="./img/home.svg" alt="home" class="btn-home" title="Tela Inicial"/></a>
        </header>     
        <h1 class="itens-header">SGPO - SISTEMA DE GESTÃO DE PRÓTESES ORTOPÉDICAS</h1> 
        
        
        
        <%
            String id = request.getParameter("id");
            TbHospital objhospital = ConexaoDAO.getRegistroById(Integer.parseInt(id)); 
        %>
        
        <a href="ConsultaHospitais.jsp"><img src="./img/voltar.svg" alt="voltar" class="btn-2"/></a>
        <h2>Vizualizar Hospital</h2>
             
        <form action="" method="post">   
             
            <label>Código Hospital:</label><input class="text_input" type="text" name="idHospital" value="<%=objhospital.getIdHospital()%>" readonly="readonly" style="width: 10em;"/>                
            <label>Razão Social:</label><input class="text_input" type="text" name="razaoSocial" value="<%=objhospital.getRazaoSocial()%>" readonly="readonly" style="width: 58em;"/>                
            <label>Nome Fantasia:</label> <input class="text_input" type="text" name="nomeFantasia" value="<%=objhospital.getNomeFantasia()%>" readonly="readonly" style="width: 40em;"/>               
            <label>CNPJ:</label> <input class="text_input" type="text" name="cnpjHospital" value="<%=objhospital.getCnpjHospital()%>" readonly="readonly" style="width: 30em;"/>
            <label>Logradouro:</label><input class="text_input" type="" name="" value="" readonly="readonly" style="width: 58em;"/>
            <label>Número:</label><input class="text_input" type="" name="" value="" readonly="readonly" style="width: 15em;"/>              
            <label>Bairro:</label> <input class="text_input" type="" name="" value="" readonly="readonly" style="width: 58em;"/>
            <label>CEP:</label> <input class="text_input" type="" name="" value="" readonly="readonly" style="width: 20em;"/>
            <label>Cidade:</label> <input class="text_input" type="" name="" value="" readonly="readonly" style="width: 60em;"/>
                
            <label>Estado:
                <select style="width: 18em; height: 30px;">
                    <option value=""></option>
                    <option value="AC">AC</option>
                </select>
            </label>               
            <label>Nome contato:</label><input class="text_input" type="" name="" value="" readonly="readonly" style="width: 30em;"/>
            <label>DDD:</label> <input class="text_input" type="" name="" value="" readonly="readonly" style="width: 5em;"/>
            <label>Telefone:</label> <input class="text_input" type="" name="" value="" readonly="readonly" style="width: 31em;"/>                
            <label>E-mail:</label> <input class="text_input" type="" name="" value="" readonly="readonly" style="width: 85em;"/>                    
        </form>
    
    </body>
  

    
    
</html>
