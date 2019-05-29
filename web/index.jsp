<%-- 
    Document   : index
    Created on : 19/05/2019, 10:26:41
    Author     : davil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br" class="h-100">
    <head>
        <title>Projeto Final</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
    </head>
    <body class="d-flex flex-column h-100 bg-warning text-dark">
        <%-- Incluir menu --%>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <!-- Começa o conteúdo da página -->
    <!-- Começa o conteúdo da página -->
    <main role="main" class="flex-shrink-0">
      <div class="container">
        <h1 class="mt-5">Sticky footer com navbar fixa</h1>
        <p class="lead">Fixe um footer na parte inferior da viewport, em navegadores desktop, com estes HTML e CSS customizados. Além do mais, um navbar fixo foi adicionado com <code>padding-top: 60px;</code> e <code>body &gt; .container</code>.</p>
        <p>Volte para o <a href="../sticky-footer">sticky footer padrão</a> sem a navbar.</p>
      </div>
    </main>
        <!-- incluir footer -->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
   </body>
</html>
