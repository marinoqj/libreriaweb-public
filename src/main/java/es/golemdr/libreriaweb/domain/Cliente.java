package es.golemdr.libreriaweb.domain;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class,property = "idCliente", scope = Cliente.class)
public class Cliente {
	
	
	private Long idCliente;
	@NotEmpty
	private String nombre;
	@NotEmpty
	private String apellidos;
	@NotEmpty
	@Pattern(regexp="[6,9]{1}[0-9]{8}")
	private String telefono;
	@NotEmpty
	private String dni;
	@NotEmpty
	private String direccion;
	
	private String datosJSON;
	
	private List<Pedido> pedidos = new ArrayList<Pedido>(0);

	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getDatosJSON() {
		return datosJSON;
	}

	public void setDatosJSON(String datosJSON) {
		this.datosJSON = datosJSON;
	}
	
	
	

}
