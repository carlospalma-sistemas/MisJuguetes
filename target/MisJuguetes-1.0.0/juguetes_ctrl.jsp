<%-- 
    Document   : juguetes_ctrl
    Created on : 14/09/2021, 7:13:43 a. m.
    Author     : Cielo Juliana
--%>
<%@page import="logica.LogicaJuguetes"%>
<%@page import="logica.Juguete"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("txtId"));
            String nombre = request.getParameter("txtNombre");
            int idTipo = Integer.parseInt(request.getParameter("selTipo"));
            String fechaCompra = request.getParameter("dtpFechaCompra");
            int idEstado = Integer.parseInt(request.getParameter("selEstado"));
            String disponibilidad = request.getParameter("radDisponibilidad");
            String accion = request.getParameter("btnSubmit");
            Juguete j = null;
            if (accion.equals("nuevo")) {
                j = new Juguete(nombre, idTipo, fechaCompra, idEstado, disponibilidad);
            }
            else if (accion.equals("editar")){
                j = new Juguete(id, nombre, idTipo, fechaCompra, idEstado, disponibilidad);
            }
            LogicaJuguetes logicaJuguetes = new LogicaJuguetes();
            boolean guardado = logicaJuguetes.guardarJuguete(j);
            if (guardado == true) {
                out.println("Juguete guardado exitosamente");
            } else {
                out.println("Información de juguete no se guardó.");
            }
        %>
        <a href="juguetes_lista.jsp"><button type="submit" class="btn btn-primary" id="btnSubmit">Volver a la lista</button></a>
    </body>
</html>

