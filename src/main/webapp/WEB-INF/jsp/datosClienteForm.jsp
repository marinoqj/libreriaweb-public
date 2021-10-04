<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>


<script>
function mostrarFormularioCompleto(){
	
	mostrarCapa("formularioCompleto");
	ocultarCapa("botonComprobar");
	ocultarCapa("msg1");
	mostrarCapa("dni");
	
	$("#msg2").html("Si es un usuario nuevo por favor rellene todos los campos para terminar el pedido. Gracias");

}

function mostarSoloDNI(){
	
	
	mostrarCapa("dni");
	ocultarCapa("formularioCompleto");
	mostrarCapa("botonComprobar");
	ocultarCapa("msg1");
	
	$("#msg2").html("Introduzca su DNI y confirme sus datos para terminar el pedido. Gracias");

}


function existeCliente(){
	
	var inputDNI = document.getElementById("inputDNI");
	
	$.getJSON('existeCliente.do', {dni : inputDNI.value},function (data) {

		var json = data;

		//alert(JSON.stringify(json));
		
		if(eval(json)){
			$("#idCliente").val(json.idCliente);
			$("#nombre").val(json.nombre);
			$("#apellidos").val(json.apellidos);
			$("#direccion").val(json.direccion);
			$("#telefono").val(json.telefono);
		}else{
			$("#mensaje").html("No se ha encontrado ningún dato con el DNI facilitado. Pruebe otra vez, o complete todos los datos. Gracias")
			$("#idCliente").val("");
			$("#nombre").val("");
			$("#apellidos").val("");
			$("#direccion").val("");
			$("#telefono").val("");
		}
		
		
		
	});

}

function continuarComprando(){
 	
 	document.formulario.action="continuarComprando.do";
 	document.formulario.submit();
 	
}



</script>

<form name="formulario" method="post">
	<input type="hidden" name="dni"/>
	<input type="hidden" name="datosJSON" value='${cliente.datosJSON}'/>	
</form>



	<form:form modelAttribute="cliente" action='terminarPedido.do' method="post">


		<br>
		<br>
		<br>
		<br>
		
<div class="container">		
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><i
							class="fas fa-list-alt fa-lg mr-1"></i><i
							class="fas fa-users fa-lg mr-2"></i>Datos del cliente</li>
					</ol>
				</nav>
			</div>
		</div>

	<div class="row alert alert-warning">
		<div class="col-md-1"><span><i class="fas fa-info-circle fa-2x"></i></span></div>
		<div class="col-md-10">				
				<div id="mensaje">- Si ya es un cliente registrado, por favor introduzca su DNI y pulse el botón para cargar sus datos. Puede modificar cualquier dato que haya cambiado
				<br>- Si no está registrado, rellene sus datos para terminar de tramitar el pedido.
				<br>Gracias. 
				</div>
		</div>
		<div class="col-md-1">&nbsp;</div>
	</div>

	<br>
	
	<form:hidden path="datosJSON"/>
	<form:hidden path="idCliente" id="idCliente"/>

	

	<div class="form-row">
	<div class="form-group col-md-4">
		<label for="dni">DNI</label>
		<div class="input-group">
		    <form:input path="dni" class="form-control" id="inputDNI"/><form:errors path="dni" element="div" id="rojo"/>
		    <span class="input-group-btn">
		        <i class="fas blue-text fa-arrow-alt-circle-down fa-2x pl-3" onclick="javascript:existeCliente();" style="cursor: pointer;"></i>
		    </span>
		</div>
	</div>
	</div>


	<div class="form-row">
		<div class="form-group col-md-6">
			<label for="nombre">Nombre</label> <form:input path="nombre" class="form-control" id="nombre"/><form:errors path="nombre" element="div" id="rojo"/>
		</div>
		<div class="form-group col-md-6">
			<label for="precio">Apellidos</label> <form:input path="apellidos" class="form-control" id="apellidos"/><form:errors path="apellidos" element="div" id="rojo"/>
		</div>
	</div>								
	
	<div class="form-row">
		<div class="form-group col-md-8">
			<label for="precio">Direccion</label> <form:input path="direccion" class="form-control" id="direccion"/><form:errors path="direccion" element="div" id="rojo"/>
		</div>
		<div class="form-group col-md-4">
			<label for="precio">Teléfono</label> <form:input path="telefono" class="form-control" id="telefono"/><form:errors path="telefono" element="div" id="rojo"/>
		</div>
	</div>									
	
	<br>
	
	
	<div class="row">
		<div class="col-md-8">&nbsp;</div>
		<div class="col-md-4">
			<a href="javascript:continuarComprando();" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-alt-circle-left fa-lg mr-2"></i>Continuar comprando</a>
			<button class="btn btn-primary btn-sm">Terminar pedido</button>
		</div>
	</div>															

</div><!-- container -->
</form:form>

<br>
<br>
<br>
<br>
<br>
							
	
<script>

$(document).on('click', '.carro', function(e){
 	
 	document.formulario.action="verCarro.do";
 	document.formulario.submit();
	
});

</script>

