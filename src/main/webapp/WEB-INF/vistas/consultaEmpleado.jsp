<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<!-- ...........................AVANCE SEM 10 INICIO.......................-->
<div class="container">
<h3>Consulta Empleado</h3>

<!-- Agregar Las filas - INICIO ROW1-->
<div class="row" style="margin-top: 2%">
<!-- --Nombre y Ape -->
		<div class="col-sm-6"> <!-- este 6 significa la mitad -->
			<label class="control-label" for="id_nombre">Nombre y Apellidos</label>
			<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
		</div>
		
		<!-- --Estado-->
		<div class="col-sm-6"> 
			<label class="control-label" for="id_esrado">Estado</label>
			<input class="form-control" type="checkbox" id="id_estado" name="estado" checked="checked">
		</div>
		
<!-- Fin del ROW 1 -->	
	</div>
	<!-- ----------------------- -->
		
<!-- Inicio del ROW 2 -->	
<div class="row" style="margin-top: 2%">
		<!-- --Fecha de Nacimiento-->
		<div class="col-sm-6">
			<label class="control-label" for="id_fecha_desde">Fecha Nacimiento (Desde)</label>
			<input class="form-control" type="date" id="id_fecha_desde" name="desde" >
		</div>
		
		<!-- Fecha Nacimiento2 -->
		<div class="col-sm-6">
			<label class="control-label" for="id_fecha_hasta">Fecha Nacimiento (Hasta)</label>
			<input class="form-control" type="date" id="id_fecha_hasta" name="hasta" >
		</div>
	
	</div>
		<!-- Fin del ROW 2 -->	
	<!-- ----------------------- -->
	
	<!-- Inicio del ROW 3 -->	
<div class="row" style="margin-top: 2%">
		<!-- --Pais-->
<div class="col-sm-6">
<div class="cl-lg-3 control-label" for="id_pais">País</label>      
	<select id="id_pais" name="pais" class='form-control'>
	 <option value=" ">[Seleccione]</option>    
	</select>
</div>
</div>
</div>
<!-- Fin del ROW 3 -->	

<!-- ----------------------- -->

<!-- row 4 -->
<div class="row" style="margin-top: 2%" align="center">
    	<button id="id_filtro" type="button" class="btn btn-primary">Filtrar</button>
    </div>
        
        <!-- tabla -->
        <div class="content" >
									<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th style="width: 5%" >ID</th>
												<th style="width: 22%">Nombre</th>
												<th style="width: 23%">Apellidos</th>
												<th style="width: 15%">Fecha Nacimiento</th>
												<th style="width: 15%">País</th>
												<th style="width: 15%">Estado</th>
												
											</tr>
										</thead>
											<tbody>
											</tbody>
										</table>
								</div>
		<!-- TABLA FIN -->   
	</div>		
<!-- fin rows----------------------- -->	


<!--  -->


<!-- SCRIPT -->
<script type="text/javascript">

//---------------------para el cbo pais
$.getJSON("listaPais", {}, function(data){
	$.each(data, function(i,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		
	});
});

//--------------------CLICK A BOTON FILTRO ++ estado
$("#id_filtro").click(function(){
	var var_estado = $('#id_estado').is(":checked") ? '1' : '0';
	
	$.getJSON("consultaEmpleado", {"estado":var_estado}, function(data){
		agregarGrilla(data);
	});
});

//---------------GRILLA
function agregarGrilla(lista){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: lista,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 10,
			lengthChange: false,
			columns:[
				{data: "idEmpleado"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "fechaNacimiento"},
				{data: "pais.nombre"},
				{data: function(row, type, val, meta){
					var salida= (row.estado == 1) ? "Activo" : "Inactivo";
					return salida;
				},className:'text-center'},
			]                                     
	    });
}
</script>
<!-- SCRIPT fin -->

<!-- ...........................AVANCE SEM 10 FIN.......................-->

</body>
</html>