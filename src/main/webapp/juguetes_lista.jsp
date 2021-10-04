<%-- 
    Document   : juguetes_lista
    Created on : 3/09/2021, 10:34:17 p. m.
    Author     : Cielo Juliana
--%>

<%@page import="logica.LogicaJuguetes"%>
<%@page import="logica.Juguete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css" rel="stylesheet">
        <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table-locale-all.min.js"></script>
        <title>Lista de juguetes</title>
    </head>
    <body>
        <div class="container mt-5"> 
            <h3 class="mb-3">Lista de juguetes</h3>
            <hr>
            <%
                String filtro = (request.getParameter("txtFiltro") == null) ? "" : request.getParameter("txtFiltro");
            %>
            <div class="row">
                <form method="GET" class="col-sm-10">
                    <div class="row mb-3">
                        <label for="txt1" class="col-form-label col-sm-2">Filtrar</label>
                        <input type="text" class="col-form-control col-sm-9" id="txtFiltro" name="txtFiltro" value="<%= filtro %>" placeholder="por nombre, tipo, estado o disponibilidad">
                        <button type="submit" class="btn btn-light col-sm-1"><i class="bi bi-search"></i></button>                    
                    </div>
                </form>
                <a href="juguetes_form.jsp?accion=nuevo" class="col-sm-2"><button type="submit" class="btn btn-primary" id="btnNuevo">Nuevo juguete</button></a>
            </div>
            <form>
                <table class="table" data-toggle="table" data-search="true" data-show-columns="true" data-pagination="true" data-locale="es-SP">
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
                        LogicaJuguetes logicaJuguetes = new LogicaJuguetes();
                        boolean hayDatos;
                        if (filtro.equals("") ) {
                            hayDatos = logicaJuguetes.cargarTodosLosJuguetes();
                        }
                        else {
                            hayDatos = logicaJuguetes.cargarJuguetesPorFiltro(filtro);
                        }
                        
                    %>
                    <tbody>
                        <% if (hayDatos) { %>
                        <%  for (Juguete j : logicaJuguetes.getLista()) {%>
                        <tr>
                            <td scope="row"><%= j.getId()%></td>
                            <td><%= j.getNombre()%></td>
                            <td><%= logicaJuguetes.getTipoJuguete(j.getIdTipo()) %></td>
                            <td><%= logicaJuguetes.getEstadoJuguete(j.getIdEstado()) %></td>
                            <td><%= j.getDisponibilidad() %></td>
                            <td>
                                <a href="juguetes_form.jsp?accion=editar&id=<%= j.getId() %>"><button type="button" class="btn btn-success"><i class="bi bi-pencil-fill"></i></button></a>
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
        <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
        
    </body>
</html>
