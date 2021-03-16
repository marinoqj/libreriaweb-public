<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<script>

$(document).ready(function(){
    $(".selector").click(function(){       	
    var idCapa = $(this).data('id');          
        $("#" + idCapa).toggle();
        
        return false;
    });
});

</script>

<br>
<br>
<br>
	<div class="row alert alert-danger">
	  <div class="col-12">									
					<span><i class="fas fa-info-circle fa-2x"></i></span>&nbsp;&nbsp;&nbsp;<b><spring:message code="error_aplicacion" />:</b>
					<spring:message code="${mensaje}" />
					<br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Si el error persiste contacte con el administrador. 
					<br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Código de error : ${codigo}</b>					

	  </div>
    </div>	

<br>

<div class="row">
	<div class="col-12"><a href="#" class="selector" data-id="detalleTraza">Ver detalle</a></div>
</div>
<div class="row">
	<div id="detalleTraza" style="display:none;">
	<div class="col-12">
		 ${traza}		
	</div>	
	</div>
</div>	