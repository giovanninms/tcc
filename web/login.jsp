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
    <title>SGPO - Sistema de Gestão de Próteses Ortopédicas</title>
    <link rel="stylesheet" href="styles2.css">

<body>
    <main>
        <section class="coluna_login">
            <div class="login">
                <h2>Faça seu acesso</h2>
                
                <form action="GatilhoLogin.jsp" method="post">                
                    <input type="text" name="username" class="input" placeholder="Login">               
                    <input type="text" name="password" class="input" placeholder="Senha">
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
