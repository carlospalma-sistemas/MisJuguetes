<%-- 
    Document   : inicio
    Created on : 5/10/2021, 10:08:26 PM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <title>Mis Juguetes - Página de inicio</title>
    </head>
    <body>
        <div class="container mt-5">
            <center>
                <img src="img/logo.png" alt="MisJuguetes" width="360" height="96">
                <h3 class="mb-4">Menú general</h3>
            </center>
        </div>
        <div class="container" id="hanging-icons">
            <div class="row g-4 py-5 row-cols-1 row-cols-md-2 row-cols-lg-4">
                <div class="col d-flex align-items-start">
                    <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
                        <i class="bi bi-box-seam fs-3 px-2"></i>
                    </div>
                    <div>
                        <h2>Juguetes</h2>
                        <p>Desde aquí se accede al módulo de gestión de juguetes, con el cual se pueden visualizar, filtrar, imgresar y modificar datos.</p>
                        <a href="juguetes_lista.jsp" class="btn btn-primary">Ir al módulo</a>
                    </div>
                </div>
                <div class="col d-flex align-items-start">
                    <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
                        <i class="bi bi-person-lines-fill fs-3 px-2"></i>
                    </div>
                    <div>
                        <h2>Usuarios</h2>
                        <p>Se accede desde aquí al módulo de usuarios, donde se puede visualizar, filtrar, ingresar y modificar datos.</p>
                        <a href="usuarios" class="btn btn-primary">Ir al módulo</a>
                    </div>
                </div>
                <div class="col d-flex align-items-start">
                    <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
                        <svg class="bi" width="1em" height="1em"><use xlink:href="#tools"/></svg>
                    </div>
                    <div>
                        <h2>Featured title</h2>
                        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
                        <a href="#" class="btn btn-primary">
                            Primary button
                        </a>
                    </div>
                </div>
                <div class="col d-flex align-items-start">
                    <div class="icon-square bg-light text-dark flex-shrink-0 me-3">
                        <svg class="bi" width="1em" height="1em"><use xlink:href="#tools"/></svg>
                    </div>
                    <div>
                        <h2>Featured title</h2>
                        <p>Paragraph of text beneath the heading to explain the heading. We'll add onto it with another sentence and probably just keep going until we run out of words.</p>
                        <a href="#" class="btn btn-primary">
                            Primary button
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
