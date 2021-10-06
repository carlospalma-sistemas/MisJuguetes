<%-- 
    Document   : usuarios_lista
    Created on : 24/09/2021, 7:27:08 p. m.
    Author     : Cielo Juliana
--%>

<%@page import="logica.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.LogicaUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <title>Lista de usuarios</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #00004d;">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="img/logo.png" alt="MisJuguetes" width="180" height="48">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="juguetes_lista.jsp"><i class="bi bi-box-seam"></i> Juguetes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="true" href="usuarios_lista.jsp"><i class="bi bi-person-lines-fill"></i> Usuarios</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-5"> 
            <h3 class="mb-3">Lista de usuarios</h3>
            <hr>
            <div id="toolbar">
                <a href="usuarios_form.jsp?accion=nuevo" class="col-sm-2"><button type="submit" class="btn btn-primary" id="btnNuevo">Nuevo usuario</button></a>
            </div>
            <table id="tablausuarios" class="table" data-toolbar="#toolbar" data-toggle="table" data-search="true" data-show-columns="true" data-show-export="true" data-pagination="true" data-page-list="[10, 25, 50]" data-locale="es-SP">
                <thead>
                    <tr>
                        <th scope="col" data-sortable="true">Id</th>
                        <th scope="col" data-sortable="true">Nombre</th>
                        <th scope="col" data-sortable="true">Usuario</th>
                        <th scope="col" data-sortable="true" data-visible="false">Fecha nacim</th>
                        <th scope="col" data-sortable="true">Parentesco</th>
                        <th scope="col" data-sortable="true">Rol</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <%
                    LogicaUsuarios logica = new LogicaUsuarios();
                    boolean hayDatos = logica.cargarTodosLosUsuarios();
                %>
                <tbody>
                    <%
                        if (hayDatos) {
                            ArrayList<Usuario> lista = logica.getListaUsuarios();
                            for (Usuario u : lista) {
                    %>
                    <tr>
                        <td scope="row"><%= u.getId()%></td>
                        <td><%= u.getNombrecompleto()%></td>
                        <td><%= u.getUsuario()%></td>
                        <td><%= u.getFechanacimiento()%></td>
                        <td><%= u.getParentesco()%></td>
                        <td><%= u.getRol()%></td>
                        <td>
                            <a href=""><button type="button" class="btn btn-success btn-sm"><i class="bi bi-pencil-fill"></i></button></a>
                            <% if(!u.getRol().equals("Administrador")) { %>
                            <a href=""><button type="button" class="btn btn-danger btn-sm"><i class="bi bi-dash-circle"></i></button></a>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">No hay datos</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
        <script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
        <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
        <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/extensions/export/bootstrap-table-export.min.js"></script>
        <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table-locale-all.min.js"></script>
    </body>
</html>
