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
            <form method="post" action="juguetes_ctrl.jsp">
                <div class="row mb-3">
                    <label for="txtId" class="col-form-label col-sm-2">Id</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtId" name="txtId" value="">
                </div>
                <div class="row mb-3">
                    <label for="txtNombre" class="col-form-label col-sm-2">Nombre</label>
                    <input type="text" class="col-form-control col-sm-10" id="txtNombre" name="txtNombre" value="">
                </div>
		<div class="row mb-3">
                    <label for="selTipo" class="col-form-label col-sm-2">Tipo</label>
                    <select class="col-form-control col-sm-10" id="selTipo" name="selTipo">
		        <option selected value=""></option>
                        <option value="Videojuego">Videojuego</option>
		        <option value="Electrónico">Electrónico</option>
		        <option value="Peluche">Peluche</option>
                        <option value="Otro">Otro</option>
		    </select>
                </div>
                <div class="row mb-3">
                    <label for="dtpFechaCompra" class="col-form-label col-sm-2">Fecha de compra</label>
                    <input type="date" class="col-form-control col-sm-10" id="dtpFechaCompra" name="dtpFechaCompra">
                </div>
		<div class="row mb-3">
                    <label for="selEstado" class="col-form-label col-sm-2">Estado</label>
                    <select class="col-form-control col-sm-10" id="selEstado" name="selEstado">
		        <option selected value=""></option>
		        <option value="Bueno">Bueno</option>
		        <option value="Modificado">Modificado</option>
		        <option value="Dañado">Dañado</option>
		    </select>
                </div>
		<div class="row mb-3">
                    <label for="txt1" class="col-form-label col-sm-2">Disponibilidad</label>
		        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad1" value="Disponible">
                            <label class="form-check-label" for="radDisponibilidad1">Disponible</label>
		        </div>
                        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad2" value="Alquilado">
                            <label class="form-check-label" for="radDisponibilidad2">Alquilado</label>
		        </div>
                        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad3" value="No disponible">
                            <label class="form-check-label" for="radDisponibilidad3">No disponible</label>
		        </div>
                        <div class="form-check col-sm-2 mt-2">
                            <input class="form-check-input" type="radio" name="radDisponibilidad" id="radDisponibilidad4" value="Retirado">
                            <label class="form-check-label" for="radDisponibilidad4">Retirado</label>
		        </div>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-primary" id="btnSubmit" name="btnSubmit" value="nuevo">Guardar</button>
                <button type="submit" class="btn btn-secondary" id="btnSubmit" name="btnSubmit" value="cancelar">Cancelar</button>
                </div>
            </form>
        </div>
    </body>
</html>
