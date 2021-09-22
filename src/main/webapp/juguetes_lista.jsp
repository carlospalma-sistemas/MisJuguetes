<%-- 
    Document   : juguetes_lista
    Created on : 3/09/2021, 10:34:17 p. m.
    Author     : Cielo Juliana
--%>

<%@page import="logica.Juguete"%>
<%@page import="logica.ColeccionJuguetes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Lista de juguetes</title>
    </head>
    <body>
        <div class="container mt-5"> 
            <h3 class="mb-3">Lista de juguetes</h3>
            <hr>
            <div class="row">
                <form class="col-sm-10">
                    <div class="row mb-3">
                        <label for="txt1" class="col-form-label col-sm-2">Filtrar por nombre</label>
                        <input type="text" class="col-form-control col-sm-9" id="txt1" name="txt1" value="">
                        <button type="button" class="btn btn-light col-sm-1"><i class="bi bi-search"></i></button>                    
                    </div>
                </form>
                <a href="juguetes_form.jsp?accion=nuevo" class="col-sm-2"><button type="submit" class="btn btn-primary" id="btnNuevo">Nuevo juguete</button></a>
            </div>
            <form>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Disponibilidad</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <%
                        ColeccionJuguetes coleccion = new ColeccionJuguetes();
                        boolean hayDatos = coleccion.cargarTodosLosJuguetes();
                    %>
                    <tbody>
                        <% if (hayDatos) { %>
                        <%  for (Juguete j : coleccion.getLista()) {%>
                        <tr>
                            <td scope="row"><%= j.getId()%></td>
                            <td><%= j.getNombre()%></td>
                            <td><%= coleccion.getTipoJuguete(j.getIdTipo()) %></td>
                            <td><%= coleccion.getEstadoJuguete(j.getIdEstado()) %></td>
                            <td><%= j.getDisponibilidad() %></td>
                            <td>
                                <a href="juguetes_form.jsp?accion=editar&id=<%= j.getId() %>"><button type="button" class="btn btn-success"><i class="bi bi-pencil-fill"></i></button></a>
                                <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                        <% } %>
                        <% } else { %>
                        <tr>
                            <td colspan="5">No hay datos</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>
