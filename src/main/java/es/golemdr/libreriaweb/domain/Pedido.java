package es.golemdr.libreriaweb.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;




@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class,property = "idPedido", scope = Pedido.class)
public class Pedido {
	
	private Long idPedido;
	private Integer numArticulos = 0;
	private Double total = 0.0;
	private Date fecha;

	private List<Detalle> detalles = new ArrayList<Detalle>(0);

	private Cliente cliente;

	public Long getIdPedido() {
		return idPedido;
	}

	public void setIdPedido(Long idPedido) {
		this.idPedido = idPedido;
	}

	public Integer getNumArticulos() {
		return numArticulos;
	}

	public void setNumArticulos(Integer numArticulos) {
		this.numArticulos = numArticulos;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public List<Detalle> getDetalles() {
		return detalles;
	}

	public void setDetalles(List<Detalle> detalles) {
		this.detalles = detalles;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
