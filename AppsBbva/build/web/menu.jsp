<%@page import="java.util.List"%>
<%@page import="pe.com.bbva.interfaces.FacturaDaoImpl"%>
<%@page import="pe.com.bbva.modelo.FacturasNoPagadas"%>
<%@page import="pe.com.bbva.modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <base target="_top">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--     <link rel="stylesheet" type="text/css" href="../BBVAH/principalBBVA.css"> -->
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <button class="btn btn-primary" onclick='VolverInicio()'><i>PAGALO YA!</i></button>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <!-- <a class="nav-link" href="#">PAGO DE SERVICIOS <span class="sr-only">(current)</span></a> -->
                        <button class="btn btn-primary" onclick='ModuloA()'>Pago de Servicios</button>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-primary" onclick='ModuloB()'>Historial</button>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="card text-center" id='INICIO'>
            <div class="card-header">
                BIENVENIDOS AL PORTAL DE PAGOS DE SERVICIOS
            </div>
            <div class="card-body">
                <h5 class="card-title"></h5>
                <p class="card-text">En este Portal podrás realizar los pagos de tus servicios y consultar tus pagos anteriores.</p>
                <!-- <a href="#" class="btn btn-primary"><i>Pagalo</i></a> -->
                <button class="btn btn-success" onclick='ModuloA()'>PAGO DE SERVICIOS</button>
                <button class="btn btn-warning" onclick='ModuloB()'>HISTORIAL</button>
            </div>
        </div>

        <div id='PAGO'> 
            <p>Seleccione su servicio</p>
            <select id='servicio' onchange='CargarDoc()'>
                <option value="0"></option>
                <option>LUZ</option>
                <option>AGUA</option>
                <option>TELEFONO</option>
            </select>
            <label id='estado'></label>
            <div id='DOCUMENTO'>
                <%
                    Cliente cliente = null;
                    if (request.getSession().getAttribute("usuarioLogueado") != null) {
                        cliente = (Cliente) request.getSession().getAttribute("usuarioLogueado");
                    }
                        FacturaDaoImpl dao = new FacturaDaoImpl();
                        List<FacturasNoPagadas> nopagadas = dao.listarFacturasNoPagadas(cliente.getId_cliente());
                        for (FacturasNoPagadas f : nopagadas) {
                %>
                <div >
                    <br><label>Cliente : </label><label class='campodoc'><%=f.getNombreCliente()%></label><label ></label>
                    <br><label>Servicio : </label><label class='campodoc'><%=f.getServicio()%></label><label ></label>
                    <br><label>Monto a Pagar : </label><label class='campodoc'><%=f.getMontoPago()%></label><label ></label>
                    <br><label>Fecha de Emisión : </label><label class='campodoc'><%=f.getFechaEmision()%></label><label ></label>
                    <br><label>Fecha de Vencimiento : </label><label class='campodoc'><%=f.getFechaVencimiento()%></label><label ></label>
                    <br><label>Estado del recibo : </label><label class='campodoc'><%=f.getEstadoFactura()%></label><label ></label>
                    <br><label>Proveedor : </label><label class='campodoc'><%=f.getProveedor()%></label><label ></label>
                    <br><label>Identificador : </label><label class='campodoc'><%=f.getIdentificador()%></label><label ></label>
                </div>
                <%
                }%>
            </div>
            <br>  
            <button onclick='Continuar()'>CONTINUAR</button>
        </div>
        <div id='CUENTA'>
            <label>NÚMERO DE CUENTA</label>
            <select id='cuenta' onchange='CambiarTarjeta()'>            
            </select>
            <br>
            <button onclick='Regresar()'>REGRESAR</button>
            <button onclick='Pagar()'>PAGAR</button>
        </div>
        <div id='HISTORIAL'>
            <p>Seleccione su servicio</p>
            <select id='Dservicio' onchange='CargarDoc2()'>
                <option value="0"></option>
                <option>LUZ</option>
                <option>AGUA</option>
                <option>TELEFONO</option>
            </select>
            <div id='DOCUMENTO2'>
                <br><label class='campodoc'>CLIENTE</label><label id='Dcliente'></label>
                <br><label class='campodoc'>SERVICIO</label><label id='Dservicio2'></label>
                <br><label class='campodoc'>MONTO</label><label id='Dmonto'></label>
                <br><label class='campodoc'>FECHA DE EMISION</label><label id='Dfechaemi'></label>
                <br><label class='campodoc'>FECHA DE VENCIMIENTO</label><label id='Dfechavenc'></label>
                <br><label class='campodoc'>ESTADO</label><label id='Destado2'></label>
                <br><label class='campodoc'>PROVEEDOR</label><label id='Dproveedor'></label>
                <br><label class='campodoc'>IDENTIFICADOR</label><label id='Didentificador'></label>
            </div>
            <button onclick="Descargar()">Descargar</button>
        </div>
    </body>
    <!--   <script src="../BBVAH/indexBBVA.js" type="text/javascript" ></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="crossorigin="anonymous" type="text/javascript"></script>
    <script>
                $('#PAGO').hide;
                $('#CUENTA').hide();
                $('#HISTORIAL').hide();
                
                function CargarDoc() {
                    $('#DOCUMENTO').css("visibility", "visible");
                    var servicio = $("#servicio").val();
                    $("#servicio option[value='0']").remove();
                    var A = new Array();
                    A.push(["MARCOS", "LUZ", 20, "19/07/2019", "25/07/2019", "PAGADO", "P001", "XA1"]);
                    A.push(["MARCOS", "AGUA", 25, "19/07/2019", "30/07/2019", "DEBE", "P002", "XB1"]);
                    A.push(["MARCOS", "TELEFONO", 30, "19/07/2019", "31/07/2019", "DEBE", "P003", "XC1"]);
                    for (var i = 0; i < A.length; i++) {
                        if (A[i][1] == servicio) {
                            $("#cliente").html(A[i][0]);
                            $("#servicio2").html(A[i][1]);
                            $("#monto").html(A[i][2]);
                            $("#fechaemi").html(A[i][3]);
                            $("#fechavenc").html(A[i][4]);
                            $("#estado2").html(A[i][5]);
                            $("#proveedor").html(A[i][6]);
                            $("#identificador").html(A[i][7]);
                            break;
                        }
                    }
                    var estado = $("#estado2").html();
                    if (estado == "PAGADO") {
                        $("#estado").html("PAGO REALIZADO");
                    } else if (estado == "DEBE") {
                        $("#estado").html("DEBE PAGO");
                    }
                }

                function CargarTarjetas() {
                    var tarjetas = new Array();
                    tarjetas.push(001101990202837465);
                    tarjetas.push(001101990203218475);
                    var txt = "<option value='0'></option>";
                    for (var i = 0; i < tarjetas.length; i++) {
                        txt = txt + '<option>' + tarjetas[i] + '</option>';
                    }
                    $("#cuenta").html(txt)
                }
                function Continuar() {
                    $('#PAGO').hide();
                    $('#CUENTA').show();
                    CargarTarjetas();
                }

                function CambiarTarjeta() {
                    $("#cuenta option[value='0']").remove();
                }

                function Pagar() {
                    alert("SERVICIO PAGADO");
                    $('#DOCUMENTO').css("visibility", "hidden");
                    $('#CUENTA').hide();
                    $('#INICIO').show();
                    $("#servicio").val("");
                    $("#estado").html("")
                    $("#cuenta").val("");
                }
                function Regresar() {
                    $('#PAGO').show();
                    $('#CUENTA').hide();
                }
                function VolverInicio() {
                    $('#INICIO').show();
                    $('#PAGO').hide();
                    $('#CUENTA').hide();
                    $('#HISTORIAL').hide();
                }
                function ModuloA() {
                    $('#PAGO').show();
                    $('#INICIO').hide();
                }
                function ModuloB() {
                    $('#HISTORIAL').show();
                    $('#DOCUMENTO2').css("visibility", "hidden");
                    $('#INICIO').hide();
                }

                function CargarDoc2() {
                    $('#DOCUMENTO2').css("visibility", "visible");
                    var servicio = $("#Dservicio").val();
                    $("#Dservicio option[value='0']").remove();
                    var A = new Array();
                    A.push(["MARCOS", "LUZ", 20, "19/07/2019", "25/07/2019", "PAGADO", "P001", "XA1"]);
                    A.push(["MARCOS", "AGUA", 25, "19/07/2019", "30/07/2019", "DEBE", "P002", "XB1"]);
                    A.push(["MARCOS", "TELEFONO", 30, "19/07/2019", "31/07/2019", "DEBE", "P003", "XC1"]);
                    for (var i = 0; i < A.length; i++) {
                        if (A[i][1] == servicio) {
                            DATOS = A[i];
                            $("#Dcliente").html(A[i][0]);
                            $("#Dservicio2").html(A[i][1]);
                            $("#Dmonto").html(A[i][2]);
                            $("#Dfechaemi").html(A[i][3]);
                            $("#Dfechavenc").html(A[i][4]);
                            $("#Destado2").html(A[i][5]);
                            $("#Dproveedor").html(A[i][6]);
                            $("#Didentificador").html(A[i][7]);
                            break;
                        }
                    }
                }

                var DATOS;

                function Descargar() {
                    var datos = DATOS;
                    var pdf = new jsPDF();
                    pdf.setFontSize(14.5);
                    pdf.text(57, 33, 'Comprobante de Pago N° 1');
                    pdf.setFontSize(10.5);
                    pdf.text(47, 50, 'Nombre');
                    pdf.text(92, 50, String(datos[0]));
                    pdf.text(47, 56, 'Servicio');
                    pdf.text(92, 56, String(datos[1]));
                    pdf.text(47, 62, 'Monto');
                    pdf.text(92, 62, String(datos[2]));
                    pdf.text(47, 68, 'Fecha Emisión');
                    pdf.text(92, 68, String(datos[3]));
                    pdf.text(47, 74, 'Fecha Vencimiento');
                    pdf.text(92, 74, String(datos[4]));
                    pdf.text(47, 80, 'Estado');
                    pdf.text(92, 80, String(datos[5]));
                    pdf.text(47, 86, 'Proveedor');
                    pdf.text(92, 86, String(datos[6]));
                    pdf.text(47, 92, 'Identicador');
                    pdf.text(92, 92, String(datos[7]));

                    pdf.save('Pago Servicio.pdf');
                }
    </script>
</html>