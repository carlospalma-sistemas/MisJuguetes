<%-- 
    Document   : usuarios_form
    Created on : 1/10/2021, 06:06:18 AM
    Author     : USUARIO
--%>

<%@page import="logica.Usuario"%>
<%@page import="logica.LogicaUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Formulario de usuarios</title>
    </head>
    <body>
        <div class="container mt-5"> 
            <h3 class="mb-3">Formulario de usuarios</h3>
            <hr>
            <%
                String accion = request.getAttribute("accion").toString();
                int id = Integer.parseInt(request.getAttribute("id").toString());
                Usuario u;
                if (accion.equals("editar")) {
                    LogicaUsuarios logicaUsuarios = new LogicaUsuarios();
                    u = logicaUsuarios.cargarUnUsuario(id);
                }
                else {
                    u = new Usuario();
                }
            %>
            <form method="post" action="usuarios?accion=guardar">
                <div class="row mb-3">
                    <input type="hidden" class="col-form-control col-sm-10" id="txtId" name="txtId" value="<%= id %>" readonly>
                </div>
                <div class="row mb-3">
                    <label for="txtNombreCompleto" class="col-form-label col-sm-2">Nombre completo</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtNombreCompleto" name="txtNombreCompleto" value="<%=  u.getNombrecompleto() %>" required>
                </div>
                <div class="row mb-3">
                    <label for="txtUsuario" class="col-form-label col-sm-2">Usuario</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtUsuario" name="txtUsuario" value="<%= u.getUsuario() %>" required>
                </div>
                <div class="row mb-3">
                    <label for="txtPassw" class="col-form-label col-sm-2">Contraseña</label>
                    <input type="password" class="col-form-control col-sm-10" id="txtPassw" name="txtPassw" value="<%= u.getPassw() %>" required>
                </div>
                <div class="row mb-3">
                    <label for="dtpFechaNacimiento" class="col-form-label col-sm-2">Fecha de nacimiento</label>
                    <input type="date" class="col-form-control col-sm-10" id="dtpFechaNacimiento" name="dtpFechaNacimiento" value="<%= u.getFechanacimiento() %>">
                </div>
                <div class="row mb-3">
                    <label for="txtParentesco" class="col-form-label col-sm-2">Parentesco</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtParentesco" name="txtParentesco" value="<%= u.getParentesco() %>" required>
                </div>
		<div class="row mb-3">
                    <label for="selRol" class="col-form-label col-sm-2">Rol</label>
                    <select class="col-form-control col-sm-10" id="selEstado" name="selRol" required>
		        <option selected value=""></option>
                        <option <%= u.getRol().equals("Administrador") ? "selected" : "" %> value="Administrador">Administrador</option>
		        <option <%= u.getRol().equals("Solicitante") ? "selected" : "" %> value="Solicitante">Solicitante</option>
		    </select>
                </div>
		
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-primary" id="btnSubmit" name="btnSubmit">Guardar</button>
                <a href="usuarios"><button type="button" class="btn btn-secondary" id="btnCancelar" name="btnCancelar">Cancelar</button></a>
                </div>
            </form>
        </div>
    </body>
</html>
