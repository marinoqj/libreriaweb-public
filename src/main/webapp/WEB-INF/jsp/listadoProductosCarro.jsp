<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>


<script>

var total = <c:if  test="${not empty pedido.total}">${pedido.total}</c:if> <c:if  test="${empty pedido.total}">0</c:if>;
var numArticulos = <c:if  test="${not empty pedido.numArticulos}">${pedido.numArticulos}</c:if> <c:if  test="${empty pedido.numArticulos}">0</c:if>;
var itemsCarro = <c:if  test="${not empty itemsCarro}">${itemsCarro}</c:if> <c:if  test="${empty itemsCarro}">[]</c:if>;


// function anyadirProducto(id, name, price){

// 	total+= price;
// 	numArticulos+= 1;
// 	var cantidadItem = 1;
	
	
// 	var resultado = '{"idProducto":"' + id +'",' + 
// 					'"nombre":"' + name +'",' +
// 					'"precio":' + price +',' +
// 					'"cantidad":1}';
	
// 	var obj = JSON.parse(resultado);
	
// 	itemsCarro.push(obj);

// 	$("#cestaTotal").html("&nbsp;&nbsp;&nbsp;&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
// 	$("#totalLista").html("" + total.toFixed(2));
// 	$("#numArticulos").html(numArticulos);
// 	$("#cantidad_" + id).html(cantidadItem);
	
// 	ocultarCapa("button_" + id);
// 	mostrarCapa("input_" + id)

// }


function incrementarProducto(id){
	
	//alert(JSON.stringify(itemsCarro));
	
	var precioItem = 0;
	var cantidadItem = 0;
	var totalItem = 0;

	for (i = 0; i < itemsCarro.length; i++) { 
		
		
		if(itemsCarro[i].idProducto == id){
			itemsCarro[i].cantidad += 1;
			cantidadItem = itemsCarro[i].cantidad;
			precioItem = itemsCarro[i].precio;
			totalItem = precioItem * cantidadItem;
			break;
		}		
	}

	total+= precioItem;
	numArticulos+= 1;
	
	// No saco esto a una función porque no se podría llamar a toFixed
	$("#cestaTotal").html("&nbsp;&nbsp;&nbsp;&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
	$("#totalLista").html("<b>" + total.toFixed(2) + "</b>");
	$("#totalItem_" + id).html("" + totalItem.toFixed(2));
	$("#numArticulos").html(numArticulos);
	$("#cantidad_" + id).html(cantidadItem);
	
	//alert(JSON.stringify(itemsCarro));
}

function decrementarProducto(id){
	
	var precioItem = 0;
	var cantidadItem = 0;
	var totalItem = 0;
	var itemIndex = 0;

	for (i = 0; i < itemsCarro.length; i++) { 
		
		if(itemsCarro[i].idProducto == id){
			itemsCarro[i].cantidad -= 1;
			cantidadItem = itemsCarro[i].cantidad;
			precioItem = itemsCarro[i].precio;
			totalItem = precioItem * cantidadItem;
			itemIndex = i;
			break;
		}		
	}
	
	total-= precioItem;
	if(total < 0.01){
		total = 0;
	}
	
	numArticulos-= 1;
	
	if(cantidadItem == 0){
		
		itemsCarro.splice(itemIndex, 1);
		$('#itemRow_' + id).remove();
		if(itemsCarro.length == 0){
			$('#itemList').remove();
		}
	
	}

	// No saco esto a una función porque no se podría llamar a toFixed
	$("#cestaTotal").html("&nbsp;&nbsp;&nbsp;&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
	$("#totalLista").html("<b>" + total.toFixed(2) + "</b>");
	$("#totalItem_" + id).html("" + totalItem.toFixed(2));
	$("#numArticulos").html(numArticulos);
	$("#cantidad_" + id).html(cantidadItem);
	
	if(numArticulos == 0){
		$('#msgCarroVacio').show();
		$('#botones-pedido').hide();
	}	
	
}

// function eliminarProducto(id){
	
// 	var precioItem = 0;
// 	var cantidadItem = 0;
// 	var totalItem = 0;
// 	var itemIndex = 0;

// 	for (i = 0; i < itemsCarro.length; i++) { 
		
// 		if(itemsCarro[i].idProducto == id){
// 			//itemsCarro[i].cantidad -= 1;
// 			cantidadItem = itemsCarro[i].cantidad;
// 			precioItem = itemsCarro[i].precio;
// 			totalItem = precioItem * cantidadItem;
// 			itemIndex = i;
// 			break;
// 		}		
// 	}
	

// 	total-= totalItem;
// 	if(total < 0.01){
// 		total = 0;
// 	}
	
// 	numArticulos-= cantidadItem;
	
// 	if(confirm("¿Desea eliminar el producto del carrito?")){
// 		itemsCarro.splice(itemIndex, 1);
// 		$('#itemRow_' + id).remove();
// 		if(itemsCarro.length == 0){
// 			$('#itemList').remove();
// 		}
// 	}else{
// 		total+= totalItem;
// 		numArticulos+= cantidadItem;
// 	}
			


// 	// No saco esto a una función porque no se podría llamar a toFixed
// 	$("#cestaTotal").html("&nbsp;&nbsp;&nbsp;&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
// 	$("#totalLista").html("<b>" + total.toFixed(2) + "</b>");
// 	//$("#totalItem_" + id).html("" + totalItem.toFixed(2));
// 	$("#numArticulos").html(numArticulos);
// 	//$("#cantidad_" + id).html(cantidadItem);
	
// 	if(numArticulos == 0){
// 		$("#msgListaVacia").html("<br><br>El carro está vacío<br><br>");
// 	}
// }

function eliminarProductoModal(id){
	
	var precioItem = 0;
	var cantidadItem = 0;
	var totalItem = 0;
	var itemIndex = 0;

	for (i = 0; i < itemsCarro.length; i++) { 
		
		if(itemsCarro[i].idProducto == id){			
			cantidadItem = itemsCarro[i].cantidad;
			precioItem = itemsCarro[i].precio;
			totalItem = precioItem * cantidadItem;
			itemIndex = i;
			break;
		}		
	}
	

	total-= totalItem;
	numArticulos-= cantidadItem;
	
	itemsCarro.splice(itemIndex, 1);
	$('#itemRow_' + id).remove();
	if(itemsCarro.length == 0){
		$('#itemList').remove();
	}
		


	// No saco esto a una función porque no se podría llamar a toFixed
	$("#cestaTotal").html("&nbsp;&nbsp;&nbsp;&nbsp;" + total.toFixed(2) + "&nbsp;&euro;");
	$("#totalLista").html("<b>" + total.toFixed(2) + "</b>");
	$("#numArticulos").html(numArticulos);

	$('#alertModal').modal('hide');
	
	if(numArticulos == 0){
		$('#msgCarroVacio').show();
		$('#botones-pedido').hide();
	}
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

function confirmarPedido(){
		
 	document.formulario.datosJSON.value = JSON.stringify(itemsCarro);
 	
 	//alert(document.formulario.datosJSON.value);
 	
 	document.formulario.action="confirmarPedido.do";
 	document.formulario.submit();
	
}

function continuarComprando(){
	
 	document.formulario.datosJSON.value = JSON.stringify(itemsCarro);
 	
 	document.formulario.action="continuarComprando.do";
 	document.formulario.submit();
 	
}
function mostarConfirmBorrarProducto(idProducto) {
    var message = '¿Desea borrar el producto?';
    
    $("#aceptarBorrar").attr("href", "javascript:eliminarProductoModal(" + idProducto + ");");
    
    mostrarConfirm(message);
}



function mostrarConfirm(message) {
    $('#alertModal').find('.modal-body p').html(message);
    $('#alertModal').modal('show');
} 
</script>


<!-- Confirm Modal -->
<div id="alertModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header alert alert-warning">
      	<h5 class="modal-title"><i class="fas fa-exclamation-triangle fa-lg"></i>&nbsp;Atención</h5>  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>		     
      </div>    
      <div class="modal-body">
         <p class="text-center"></p>
      </div>
      <div class="modal-footer">         
         <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal"><i class="fas fa-times-circle"></i>&nbsp;&nbsp;Cancelar</button>
         <a class="btn btn-primary btn-sm" role="button" href="#" id="aceptarBorrar"><i class="fas fa-check-circle"></i>&nbsp;&nbsp;Aceptar</a>
      </div>
    </div>
  </div>
</div>
<!-- ./ Confirm Modal -->
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
						class="fas fa-list-alt fa-lg mr-1"></i>
						<i class="fas fa-shopping-cart fa-lg mr-2"></i>Listado de productos en el carro</li>
				</ol>
			</nav>
		</div>
	</div>
</div>



<c:if  test="${!empty pedido.detalles}">           
<div class="container">		
	
	<div class="row" style="display:none;" id="msgCarroVacio">
        <div class="col-sm-12 text-center">
        <br><br>
        <img src='<spring:url value="/static/imagenes/cesta.png"/>' width="130" height="130" class="img-fluid mb-4 mr-3">
            <h4><strong>El carro est&aacute; vac&iacute;o</strong></h4>
            <a href="listadoProductos.do" type="button" class="btn btn-secondary btn-sm waves-effect waves-light">Ir a Tienda</a>
        </div>
	</div>
<!-- DataTables Example -->
          <table class="table table-sm table-hover" id="itemList" border="0">
			<thead class="blue lighten-4">
				<tr class="bg-light">
					<td><b>Nombre</b></td>
					<td align="center"><b>Precio producto</b></td>
					<td align="right"><b>Cantidad</b></td>
					<td align="right"><b>Total producto</b></td>
					<td>&nbsp;</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pedido.detalles}" var="detalle">
					<tr id="itemRow_${detalle.producto.idProducto}">

						<td>${detalle.producto.nombre}</td>

						<td align="center">${detalle.producto.precio}</td>

						<td align="right">
						<em class="fas fa-minus-circle fa-lg" style="color: orange; cursor: pointer" onclick="decrementarProducto(${detalle.producto.idProducto})"></em>
							<label id="cantidad_${detalle.producto.idProducto}">${detalle.producto.cantidad}</label>
						<em class="fas fa-plus-circle fa-lg"	style="color: green; cursor: pointer" onclick="incrementarProducto(${detalle.producto.idProducto})"></em>
						</td>

						<td align="right"><label
							id="totalItem_${detalle.producto.idProducto}">${detalle.totalDetalle}</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<i class="fas fa-times-circle fa-lg"
							style="color: red; cursor: pointer"
							onclick="mostarConfirmBorrarProducto(${detalle.producto.idProducto})"></i></td>

						<td>&nbsp;</td>



					</tr>
				</c:forEach>
			
			<tfoot>
				<tr class="bg-light">
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right" style="font-weight: 800; font-size: 1rem">Total: <label id="totalLista">${pedido.total}</label> &euro;</td>
				</tr>
			</tfoot>
			</tbody>
		</table>		
	
			<br>
			
			
			<div class="row">
				<div class="col text-right">
					<div id="botones-pedido" style="display: block">
					<a href="javascript:continuarComprando();" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-alt-circle-left fa-lg mr-2"></i>Continuar comprando</a>
					<a href="javascript:confirmarPedido();" class="btn btn-primary btn-sm">Confirmar pedido</a>
					</div>
				</div>
			</div>
			
		</div>
</c:if>


	
<c:if  test="${empty pedido.detalles}">
		

<br><br>
<div class="container mt-100">
    <div class="row">
        <div class="col-sm-12 text-center"> <img src='<spring:url value="/static/imagenes/cesta.png"/>' width="130" height="130" class="img-fluid mb-4 mr-3">
            <h4><strong>El carro est&aacute; vac&iacute;o</strong></h4>
            <a href="listadoProductos.do" type="button" class="btn btn-secondary btn-sm waves-effect waves-light">Ir a Tienda</a>
        </div>
    </div>
</div>

</c:if>

<form name="formulario" method="post">
	<input type="hidden" name="datosJSON"/>
</form>
	
	