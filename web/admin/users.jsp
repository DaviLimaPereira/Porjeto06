<%-- 
    Document   : users
    Created on : 01/06/2019, 12:30:08
    Author     : davil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escola - Usuário</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <!-- Começa o conteúdo da página -->
        <main role="main" class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">USUÁRIOS</h1>
                <%if(session.getAttribute("user")==null){%>
                    <p class="lead"><h3>Autenticação necessária para acesso.</h3></p>
                <%}else{%>
                    <% User user = (User) session.getAttribute("user");%>
                    <%if(!user.getRole().equals("ADMIN")){%>
                        <p class="lead"><h3>Usuário não autorizado.</h3></p>
                    <%}else{%>
                        TODO: Tabela de Usuários
                    <%}%>
                <%}%>
            </div>
        </main>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
