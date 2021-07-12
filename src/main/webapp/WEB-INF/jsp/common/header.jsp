<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>

<nav class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar" style="background-color: #e3f2fd;">
	<div class="container">
		<a class="navbar-brand" href="#"> <img src='<spring:url value="/static/imagenes/logo-golemdr.gif"/>' height="70"  class="d-inline-block align-top">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href='<spring:url value="/listadoProductos.do"/>'><c:if test="${empty pedido}">Comprar</c:if><span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="navbar-nav">
		      <li class="nav-item active carro">
		        <a class="nav-link"  href="#">
		          <i class="fas fa-shopping-cart fa-lg align-middle"></i> &nbsp;&nbsp;
		          <button type="button" id="numArticulos" class="btn btn-danger btn-sm">
		          <c:if test="${!empty pedido}">${pedido.numArticulos}</c:if><c:if test="${empty pedido}">0</c:if>
		          </button>
		          <span id="cestaTotal" class="align-middle">&nbsp;
		          <c:if test="${!empty pedido}">${pedido.total}</c:if>
		          <c:if test="${empty pedido}">0</c:if>&nbsp;&euro;</span>
		        </a>
		      </li>
		    </ul>
		</div>
	</div>
</nav>



