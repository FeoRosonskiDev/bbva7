 $("#PAGO").hide(); 
   function Validar(){
       var clientes = new Array();
       clientes.push([47134091,942916311]);
       clientes.push([35487102,993200565]);
       var usuario = $("#usuario").val();
       var contrasenia = $("#contrasenia").val();
       for(var i=0;i<clientes.length;i++){
           if(usuario==clientes[i][0] && contrasenia==clientes[i][1]){
               alert("USUARIO CORRECTO");
               $('#INGRESO').hide();
               $('#PAGO').show();
               $('#DOCUMENTO').css("visibility","hidden");
               CargarTarjetas();
               return;
               //
           }
       }
       alert("USUARIO INCORRECTO");
       $("#usuario").val("");
       $("#contrasenia").val("");
   }
   function CargarDoc(){
       $('#DOCUMENTO').css("visibility","visible");
       var servicio = $("#servicio").val();
       $("#servicio option[value='0']").remove();        
       var A = new Array();
       A.push(["MARCOS","LUZ",20,"19/07/2019","25/07/2019","PAGADO","P001","XA1"]);
       A.push(["MARCOS","AGUA",25,"19/07/2019","30/07/2019","DEBE","P002","XB1"]);
       A.push(["MARCOS","TELEFONO",30,"19/07/2019","31/07/2019","DEBE","P003","XC1"]);
       for(var i=0;i<A.length;i++){
           if(A[i][1]==servicio){
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
       if(estado=="PAGADO"){
           $("#estado").html("PAGO REALIZADO");
       }
       else if(estado=="DEBE"){
           $("#estado").html("DEBE PAGO");
       }
   }
   
   function CargarTarjetas(){
       var tarjetas = new Array();        
       tarjetas.push(001101990202837465);
       tarjetas.push(001101990203218475);
       var txt = "<option value='0'></option>";
       for(var i=0;i<tarjetas.length;i++){
           txt = txt + '<option>'+tarjetas[i]+'</option>';
       }
       $("#cuenta").html(txt)
   }
   
   function CambiarTarjeta(){
       $("#cuenta option[value='0']").remove();
   }    
   
   function Pagar(){
       alert("SERVICIO PAGADO");
       $("#cuenta").val("");
       $("#servicio").val("");
       $("#montoz").html("");
   }
