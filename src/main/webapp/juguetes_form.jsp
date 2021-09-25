<%@page import="logica.LogicaJuguetes"%>
<%@page import="logica.Juguete"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-5"> 
            <h3 class="mb-3">Formulario de juguetes</h3>
            <hr>
            <%
                String accion = request.getParameter("accion");
                int id;
                String nombre = "";
                int idTipo = 0;
                String fechaCompra = "";
                int idEstado = 0;
                String disponibilidad = "";
                
                if (accion.equals("editar")) {
                    id = Integer.parseInt(request.getParameter("id"));
                    LogicaJuguetes logicaJuguetes = new LogicaJuguetes();
                    Juguete j = logicaJuguetes.cargarUnJuguete(id);
                    nombre = j.getNombre();
                    idTipo = j.getIdTipo();
                    fechaCompra = j.getFechaCompra();
                    idEstado = j.getIdEstado();
                    disponibilidad = j.getDisponibilidad();
                }
                else {
                    id = 0;
                }
            %>
            <form method="post" action="juguetes_ctrl.jsp">
                <div class="row mb-3">
                    <label for="txtId" class="col-form-label col-sm-2">Id</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtId" name="txtId" value="<%= id %>" readonly>
                </div>
                <div class="row mb-3">
                    <label for="txtNombre" class="col-form-label col-sm-2">Nombre</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtNombre" name="txtNombre" value="<%= nombre %>">
                </div>
		<div class="row mb-3">
                    <label for="selTipo" class="col-form-label col-sm-2">Tipo</label>
                    <% 
                        LogicaJuguetes logicaJuguetes = new LogicaJuguetes(); 
                        TreeMap<Integer, String> tipos = logicaJuguetes.getTiposJuguetes();
                    %>
                    <select class="col-form-control col-sm-10" id="selTipo" name="selTipo">
		        <option selected value=""></option>
                        <% for (Map.Entry<Integer, String> entrada : tipos.entrySet() ) { %>
                        <option <%= entrada.getKey()== idTipo ? "selected" : "" %> value="<%= entrada.getKey() %>"><%= entrada.getValue() %></option>
		        <% } %>
		    </select>
                </div>
                <div class="row mb-3">
                    <label for="dtpFechaCompra" class="col-form-label col-sm-2">Fecha de compra</label>
                    <input type="date" class="col-form-control col-sm-10" id="dtpFechaCompra" name="dtpFechaCompra" value="<%= fechaCompra %>">
                </div>
		<div class="row mb-3">
                    <label for="selEstado" class="col-form-label col-sm-2">Estado</label>
                    <% 
                        TreeMap<Integer, String> estados = logicaJuguetes.getEstadosJuguetes();
                    %>
                    <select class="col-form-control col-sm-10" id="selEstado" name="selEstado">
		        <option selected value=""></option>
                        <% for (Map.Entry<Integer, String> entrada : estados.entrySet() ) { %>
                        <option <%= entrada.getKey()== idEstado ? "selected" : "" %> value="<%= entrada.getKey() %>"><%= entrada.getValue() %></option>
		        <% } %>
		    </select>
                </div>
		<div class="row mb-3">
                    <label for="txt1" class="col-form-label col-sm-2">Disponibilidad</label>
		        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad1" value="Disponible" <%= disponibilidad.equals("Disponible") ? "checked" : "" %>>
                            <label class="form-check-label" for="radDisponibilidad1">Disponible</label>
		        </div>
                        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad2" value="Alquilado" <%= disponibilidad.equals("Alquilado") ? "checked" : "" %>>
                            <label class="form-check-label" for="radDisponibilidad2">Alquilado</label>
		        </div>
                        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad3" value="No disponible" <%= disponibilidad.equals("No disponible") ? "checked" : "" %>>
                            <label class="form-check-label" for="radDisponibilidad3">No disponible</label>
		        </div>
                        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad4" value="Retirado" <%= disponibilidad.equals("Retirado") ? "checked" : "" %>>
                            <label class="form-check-label" for="radDisponibilidad4">Retirado</label>
		        </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-primary" id="btnSubmit" name="btnSubmit" value="<%= accion %>">Guardar</button>
                <button type="submit" class="btn btn-secondary" id="btnSubmit" name="btnSubmit" value="cancelar">Cancelar</button>
                </div>
            </form>
        </div>
    </body>
</html>
