<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>


<script>

var total = <c:if  test="${not empty pedido.total}">${pedido.total}</c:if> <c:if  test="${empty pedido.total}">0</c:if>;
var numArticulos = <c:if  test="${not empty pedido.numArticulos}">${pedido.numArticulos}</c:if> <c:if  test="${empty pedido.numArticulos}">0</c:if>;
var itemsCarro = <c:if  test="${not empty itemsCarro}">${itemsCarro}</c:if> <c:if  test="${empty itemsCarro}">[]</c:if>;

function anyadirProducto(id, name, price){

	total+= price;
	numArticulos+= 1;
	var cantidadItem = 1;
	
	
	var resultado = '{"idProducto":"' + id +'",' + 
					'"nombre":"' + name +'",' +
					'"precio":' + price +',' +
					'"cantidad":1}';
	
	var obj = JSON.parse(resultado);
	
	itemsCarro.push(obj);

	$("#cestaTotal").html("&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
	$("#numArticulos").html(numArticulos);
	$("#cantidad_" + id).html(cantidadItem);
	
	ocultarCapa("button_" + id);
	mostrarCapa("input_" + id)

}


function incrementarProducto(id){
	
	var precioItem = 0;
	var cantidadItem = 0;

	for (i = 0; i < itemsCarro.length; i++) { 
		
		if(itemsCarro[i].idProducto == id){
			itemsCarro[i].cantidad += 1;
			cantidadItem = itemsCarro[i].cantidad;
			precioItem = itemsCarro[i].precio;
			break;
		}		
	}

	total+= precioItem;
	numArticulos+= 1;
	
	// No saco esto a una función porque no se podría llamar a toFixed
	$("#cestaTotal").html("&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
	$("#numArticulos").html(numArticulos);
	$("#cantidad_" + id).html(cantidadItem);
}

function decrementarProducto(id){
	
	var precioItem = 0;
	var cantidadItem = 0;
	var itemIndex = 0;

	for (i = 0; i < itemsCarro.length; i++) { 
		
		if(itemsCarro[i].idProducto == id){
			itemsCarro[i].cantidad -= 1;
			cantidadItem = itemsCarro[i].cantidad;
			precioItem = itemsCarro[i].precio;
			itemIndex = i;
			break;
		}		
	}
	
	
	total-= precioItem;
	numArticulos-= 1;
	
	if(cantidadItem == 0){		
		itemsCarro.splice(itemIndex, 1);
		ocultarCapa("input_" + id);
		mostrarCapa("button_" + id)
	}


 	if(total < 0.01){
		total = 0;
	}
	
	// No saco esto a una función porque no se podría llamar a toFixed
	$("#cestaTotal").html("&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
	$("#numArticulos").html(numArticulos);
	$("#cantidad_" + id).html(cantidadItem);
}


function mostrarCapa(idCapa) {
	//alert("Estamos en mostraCapa");
	var capa = document.getElementById(idCapa);
	if (capa.style.display=="none") {
		capa.style.display = "block";
	}
}

function ocultarCapa(idCapa) {
	//alert("Estamos en ocultarCapa");
	var capa = document.getElementById(idCapa);
	if (capa.style.display=="block") {
		capa.style.display = "none";
	}
}

</script>
<br>
<br>
<br>

<!-- Confirm Modal -->
<div id="confirmModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header alert alert-warning">
      	<h5 class="modal-title"><i class="fas fa-exclamation-triangle fa-lg"></i>&nbsp;Atención</h5>  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>		     
      </div>    
      <div class="modal-body">
         <p class="text-center">¿Desea eliminar el producto del carrito?</p>
      </div>
      <div class="modal-footer">         
         <button type="button" class="btn btn-secondary btn-sm" id="modal-btn-cancelar" data-dismiss="modal"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Cancelar</button>
         <button type="button" class="btn btn-primary btn-sm" id="modal-btn-aceptar" onclick="ejecutarConfirm()"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Aceptar</button>         
      </div>
    </div>
  </div>
</div>
<!-- ./ Confirm Modal -->


<div class="container">
	<br>

	<div class="row">
		<div class="col-md-12">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item active">
						<em class="fas fa-book fa-lg mr-2"></em>Librería / Novedades</li>
				</ol>
			</nav>
		</div>
	</div>

<c:if test="${!empty productos}">

	<div class="row">
		<c:forEach items="${productos}" var="producto">
			<div class="col-lg-3 mb-5">
				<!-- Card -->
				<div class="card">

					<!-- Card image -->
					<br>
					<img class="card-img-top"
						src='<spring:url value="/static/imagenes/libros/"/>${producto.nombreFoto}.webp' />

					<!-- Card content -->
					<div class="card-body">

						<!-- Title -->
						<span class="card-title"> ${producto.nombre} </span> <br>
						<!-- Text -->
						<span class="card-text">${producto.precio} &euro;</span><br>
						<br>
						<div id="button_${producto.idProducto}" style="display: block;">
							<button class="btn btn-primary btn-sm btn-comprar"
								onclick="anyadirProducto(${producto.idProducto},'${producto.nombre}' ,${producto.precio})">Comprar</button>
						</div>
						<div id="input_${producto.idProducto}" style="display: none; padding: 6px;">
							<i class="fas fa-minus-circle fa-lg"
								style="color: orange; cursor: pointer"
								onclick="decrementarProducto(${producto.idProducto})"></i> <label
								id="cantidad_${producto.idProducto}"></label> 
								<i class="fas fa-plus-circle fa-lg"
								style="color: green; cursor: pointer"
								onclick="incrementarProducto(${producto.idProducto})"></i>
						</div>
					</div>

				</div>
				<!-- Card -->
			</div>
		</c:forEach>

	</div>
	
</c:if>
</div>


<c:if test="${empty productos}">
<div class="container">
	<div class="row">
		<div class="col-md-3 col-lg-2">&nbsp;</div>
		<div class="col-md-6 col-lg-4 align-middle alert alert-warning">
			<i class="fas fa-info-circle fa-2x"></i> La tienda est&aacute; vac&iacute;a
		</div>
		<div class="col-md-3 col-lg-2">&nbsp;</div>
	</div>
</div>
</c:if>
<br>
<br>

<form name="formulario" method="post">
	<input type="hidden" name="datosJSON" />
</form>

<script>

$(document).on('click', '.carro', function(e){
	
 	document.formulario.datosJSON.value = JSON.stringify(itemsCarro);
 	
 	document.formulario.action="verCarro.do";
 	document.formulario.submit();
	
});
	
$(document).ready(function(){

	for (i = 0; i < itemsCarro.length; i++) { 
		
		ocultarCapa("button_" + itemsCarro[i].idProducto);
		mostrarCapa("input_" + itemsCarro[i].idProducto)
		$("#cantidad_" + itemsCarro[i].idProducto).html(itemsCarro[i].cantidad);
	}
	
});		

</script>	
