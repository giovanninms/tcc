<%-- 
    Document   : login
    Created on : 23 de nov. de 2023, 20:03:45
    Author     : adolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/junta.png" type="image/png">
    <title>SGPO - Sistema de Gestão de Próteses Ortopédicas</title>
    <link rel="stylesheet" href="styles2.css">

<body>
    <main>
        <section class="coluna_login">
            <div class="login">
                <h2>Faça seu acesso</h2>
                
                <form action="GatilhoLogin.jsp" method="post">                
                    <input type="text" name="loginUsuario" class="input" placeholder="Login" required>               
                    <input type="password" name="senhaUsuario" class="input" placeholder="Senha" required>
                <div class="botoes">
                    <input type="submit" class="icones_botoes" value="Entrar"></input>
                </div>
            </div>
            </form>
               
            
                
        </section>


        <section class="coluna_wallpaper">

        </section>

    </main>
    <div class="texto_wallpaper">
        <h1>SGPO - Sistema de Gestão de Próteses Ortopédicas</h1>
        <h2>A&G Soluções Tecnológicas</h2>
    </div>
    
</body>
</html>
