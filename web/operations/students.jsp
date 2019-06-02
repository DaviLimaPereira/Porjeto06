<%-- 
    Document   : students
    Created on : 01/06/2019, 12:31:39
    Author     : davil
--%>

<%@page import="br.com.fatecpg.escola.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String error = null;
    String names = null;
    if(request.getParameter("formDeleteUser")!=null){
        try{
           long id = Long.parseLong(request.getParameter("id"));
           Student.removeStudent(id);
           response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        } 
    }
    if(request.getParameter("formNewStudent")!=null){
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        try{
            Student.addStudent(name, address, phone);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }       
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Escola - ESTUDANTES</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
        <!-- Começa o conteúdo da página -->
        <main role="main" class="flex-shrink-0">
            <div class="container">
                <h1 class="mt-5">ESTUDANTES</h1>
                <%if(session.getAttribute("user")==null){%>
                    <p class="lead"><h3>Autenticação necessária para acesso.</h3></p>
                <%}else{%>
                    <%if(error!=null){%>
                        <h3><%=error%></h3> 
                    <%}%>
                    <% User user = (User) session.getAttribute("user");%>
                    <%if(user.getRole().equals("ADMIN")){%>
                    <fieldset>
                        <legend>NOVO ESTUDANTE:</legend>
                            <form>
                                NOME: <input type="text" name="name"/>
                                ENDEREÇO: <input type="text" name="address"/>
                                TELEFONE: <input type="text" name="phone"/>
                                <input type="submit" name="formNewStudent" value="Adicionar"/>
                            </form>
                    </fieldset><hr>
                    <%}%>
                    <fieldset>
                        <legend>BUSCAR ESTUDANTE:</legend>
                            <form>
                                NOME: <input type="text" name="names"/>
                                <input type="submit" name="searchStudent" value="Buscar"/>
                            </form>
                    </fieldset>
                    <%if(request.getParameter("searchStudent")!=null){%>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOME</th>
                                <th>ENDEREÇO</th>
                                <th>TELEFONE</th>
                                <th>COMANDO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(Student s: Student.getStudent(names)){%>
                                <tr>
                                    <td><%=s.getId()%></td>
                                    <td><%=s.getName() %></td>
                                    <td><%=s.getAddress()%></td>
                                    <td><%=s.getPhone()%></td>
                                    <td>
                                        <form>
                                            <input type="hidden" name="id" value="<%=s.getId()%>"/>
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
            <!-- Começa o footer da página -->
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
