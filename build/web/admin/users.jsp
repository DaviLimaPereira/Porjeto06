<%-- 
    Document   : users
    Created on : 01/06/2019, 12:30:08
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escola - Usuário</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
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
            <%if(error!=null){%>
            <h3><%=error%></h3> 
            <%}%>
            <fieldset>
                <legend>NOVO USUÁRIO:</legend>
                <form>
                    NOME: <input type="text" name="name"/>
                    PAPEL: <select name="role">
                        <option value="ADMIN">ADMIN</option>
                        <option value="OPERADOR">OPERADOR</option>
                    </select>
                    LOGIN: <input type="text" name="login"/>
                    SENHA: <input type="password" name="pass"/>
                    <input type="submit" name="formNewUser" value="Adicionar"/>
                </form>
            </fieldset><hr>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ROLE</th>
                                    <th>NAME</th>
                                    <th>LOGIN</th>
                                    <th>COMANDO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for(User u: User.getUsers()){%>
                                    <tr>
                                        <td><%=u.getId()%></td>
                                        <td><%=u.getRole()%></td>
                                        <td><%=u.getName() %></td>
                                        <td><%=u.getLogin() %></td>
                                        <td>
                                            <form>
                                                <input type="hidden" name="id" value="<%=u.getId()%>"/>
                                                <input type="submit" name="formDeleteUser" value="Remover"/>
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
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
