<%-- 
    Document   : users
    Created on : 28/05/2019, 23:24:27
    Author     : davil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    if(request.getParameter("formDeleteUser")!=null){
        try{
            long id = Long.parseLong(request.getParameter("id"));
            User.removeUser(id);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    } 
    if(request.getParameter("formNewUser")!=null){
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String login = request.getParameter("login");
        long passwordHash = request.getParameter("pass").hashCode();
        try{
            User.addUser(name, role, login, passwordHash);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
%>
<html lang="pt-br" class="h-100">
    <head>
        <%@include file="../WEB-INF/jspf/header.jspf" %>
    </head>
    <body class="d-flex flex-column h-100">
        <%-- Incluir menu --%>
        <%@include file="../WEB-INF/jspf/menu.jspf" %>
        
        <!-- Começa o conteúdo da página -->
    <!-- Começa o conteúdo da página -->
    <main role="main" class="flex-shrink-0">
      <div class="container">
        <h1 class="mt-5">USUARIOS</h1>
        <%if(session.getAttribute("user")==null){%>
            <h2>É PRECISO ESTAR AUTENTICADO PARA ACESSAR ESTE RECURSO</h2>
        <%}else{%>
            <% User user = (User) session.getAttribute("user"); %>
            <%if (!user.getRole().equals("ADMIN")){%>
            <h2>VOCÊ NÃO TEM PERMISSÃO PARA ACESSAR ESTE RECURSO</h2>
            <%}else{%>
            <%if(error!=null){%>
            <h3><%=error%></h3>                    
            <%}%>
            <fieldset>
                <legend>NOVO USÚARIO</legend>
                <form>
                    NOME:<input type="text" name="name">
                    PAPEL:<select name="role">
                        <option value="ADMIN">ADMIN</option>
                        <option value="OPERADOR">OPERADOR</option>
                    </select>
                    LOGIN:<input type="text" name="login">
                    SENHA:<input type="password" name="pass">
                    <input type="submit" name="formNewUser" value="Add">
                </form>
            </fieldset>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Papel</th>
                        <th>Nome</th>
                        <th>Login</th>
                        <th>Comando</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(User u: User.getUsers()){%>
                    <tr>
                        <td><%=u.getId()%></td>
                        <td><%=u.getRole()%></td>
                        <td><%=u.getName()%></td>
                        <td><%=u.getLogin()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                                <input type="submit" name="formDeleteUser" value="Remove"/>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%}%>
        <%}%>
      </div>
    </main>
        <!-- incluir footer -->
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
   </body>
</html>
