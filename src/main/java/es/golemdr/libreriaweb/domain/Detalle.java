package es.golemdr.libreriaweb.domain;

import org.apache.commons.math3.util.Precision;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;



@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class,property = "idDetalle", scope = Detalle.class)
public class Detalle {
	
	private Long idDetalle;
	private Double precio;
	private Integer cantidad;
	private Double totalDetalle;

	private Producto producto;	

	private Pedido pedido;

	public Long getIdDetalle() {
		return idDetalle;
	}

	public void setIdDetalle(Long idDetalle) {
		this.idDetalle = idDetalle;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	
	public Double getTotalDetalle() {
		return Precision.round(this.precio * this.cantidad, 2);
	}

	public void setTotalDetalle(Double totalDetalle) {
		this.totalDetalle = totalDetalle;
	}	

}
