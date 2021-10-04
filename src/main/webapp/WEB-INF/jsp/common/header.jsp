<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp" %>



<nav class="navbar navbar-expand-lg navbar-dark teal fixed-top scrolling-navbar">
<div class="container">
		<a class="navbar-brand" href="#"> <img src='<spring:url value="/static/imagenes/logo-libros.png"/>' height="40"  class="d-inline-block"><span class="px-2 align-middle" style="font-weight: 400">Librer&iacute;aWeb</span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href='<spring:url value="/home.do"/>'>Inicio</a>
                </li>			
                <li class="nav-item">
                    <a class="nav-link" href='<spring:url value="/listadoProductos.do"/>'>Tienda</a>
                </li>
			</ul>
	    
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                  <a class="nav-link" href='<spring:url value="/contacto.do"/>'><i class="fas fa-envelope"></i> <span class="clearfix d-none d-sm-inline-block">Contacto</span></a>
              </li>              
            
                <li class="nav-item active carro">
                    <a class="nav-link dark-grey-text font-weight-bold" href='#'>
                        <span id="numArticulos" class="badge danger-color"><c:if test="${!empty pedido}">${pedido.numArticulos}</c:if><c:if test="${empty pedido}">0</c:if></span>
                        <i class="fas fa-shopping-cart white-text" aria-hidden="true"></i>
                        <span id="cestaTotal" class="clearfix d-none d-sm-inline-block text-white">
                        	<c:if test="${!empty pedido}">${pedido.total}</c:if>
		          			<c:if test="${empty pedido}">0</c:if>
		          			&nbsp;&euro;
		          		</span>
                    </a>
                </li>
            </ul>
		</div>
</div>	
</nav>



