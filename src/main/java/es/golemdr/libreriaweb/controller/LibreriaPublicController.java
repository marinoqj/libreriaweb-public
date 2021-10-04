package es.golemdr.libreriaweb.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.math3.util.Precision;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import es.golemdr.libreriaweb.controller.constantes.ForwardConstants;
import es.golemdr.libreriaweb.controller.constantes.UrlConstants;
import es.golemdr.libreriaweb.domain.Cliente;
import es.golemdr.libreriaweb.domain.Detalle;
import es.golemdr.libreriaweb.domain.Pedido;
import es.golemdr.libreriaweb.domain.Producto;
import es.golemdr.libreriaweb.ext.Constantes;
import es.golemdr.libreriaweb.service.CarroService;
import es.golemdr.libreriaweb.service.ClientesService;
import es.golemdr.libreriaweb.service.ProductosService;

@Controller
public class LibreriaPublicController {

	private static final Logger log = LogManager.getLogger(LibreriaPublicController.class);

	@Autowired
	ObjectMapper objectMapper;

	@Resource
	private ProductosService productosService;

	@Resource
	private ClientesService clientesService;

	@Resource
	private CarroService carroService;
	
	
	@GetMapping(UrlConstants.URL_HOME)
	public String goHome() {

		return ForwardConstants.FWD_HOME;

	}
	
	@GetMapping(UrlConstants.URL_CONTACTO)
	public String contacto() {
		
		return ForwardConstants.FWD_CONTACTO;
	}


	@GetMapping(UrlConstants.URL_LISTADO_PRODUCTOS)
	public String listadoProductos(Map<String, Object> map, HttpServletRequest request) {

		List<Producto> resultado = null;
		resultado = productosService.getProductos();

		map.put(Constantes.ATRIBUTO_PRODUCTOS, resultado);

		return ForwardConstants.FWD_LISTADO_PRODUCTOS;

	}
	

	@PostMapping(UrlConstants.URL_VER_CARRO)
	public String verCarro(String datosJSON, Model model, HttpServletRequest request) {

		System.out.println(datosJSON);
		
		Pedido pedido = null;
		try {
			pedido = generarPedido(datosJSON);
		} catch (Exception e) {
			log.error(String.format(Constantes.MSG_EXCEPCION , e.getMessage()));
		}

		model.addAttribute("itemsCarro", datosJSON);
		model.addAttribute(Constantes.ATRIBUTO_PEDIDO, pedido);

		return ForwardConstants.FWD_LISTADO_PRODUCTOS_CARRO;
	}
	
	@PostMapping(UrlConstants.URL_CONTINUAR_COMPRANDO)
	public String continuarComprando(String datosJSON, Model model, HttpServletRequest request) {

		Pedido pedido = null;
		try {
			pedido = generarPedido(datosJSON);
		} catch (Exception e) {
			log.error(String.format(Constantes.MSG_EXCEPCION , e.getMessage()));
		}

		List<Producto> resultado = null;
		resultado = productosService.getProductos();
		
		model.addAttribute("itemsCarro", datosJSON);
		model.addAttribute(Constantes.ATRIBUTO_PEDIDO, pedido);
		model.addAttribute("productos", resultado);		

		return ForwardConstants.FWD_LISTADO_PRODUCTOS;
	}	
	

	@PostMapping(UrlConstants.URL_CONFIRMAR_PEDIDO)
	public String confirmarPedido(String datosJSON, Model model, HttpServletRequest request) {

		// Utilizo el cliente para enviar el json del pedido al formulario
		Cliente cliente = new Cliente();
		cliente.setDatosJSON(datosJSON);

		Pedido pedido = null;
		try {
			pedido = generarPedido(datosJSON);
		} catch (Exception e) {
			log.error(String.format(Constantes.MSG_EXCEPCION , e.getMessage()));
		}

		model.addAttribute(Constantes.ATRIBUTO_PEDIDO, pedido);
		model.addAttribute("cliente", cliente);

		return ForwardConstants.FWD_DATOS_CLIENTE_FORM;
	}
	

	@GetMapping(value = UrlConstants.URL_EXISTE_CLIENTE, headers = "Accept=application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String existeCliente(@RequestParam("dni") String dni, HttpServletRequest request)
			throws JsonProcessingException {

		Cliente resultado = clientesService.existeCliente(dni);

		return objectMapper.writeValueAsString(resultado);
	}
	

	@PostMapping(value = UrlConstants.URL_TERMINAR_PEDIDO)
	public String terminarPedido(@Valid Cliente cliente, BindingResult result, Map<String, Object> map,
			HttpServletRequest request) {

		String destino = null;

		if (result.hasErrors()) {

			Pedido pedido = null;
			try {
				pedido = generarPedido(cliente.getDatosJSON());
			} catch (Exception e) {
				log.error(String.format(Constantes.MSG_EXCEPCION , e.getMessage()));
			}

			map.put(Constantes.ATRIBUTO_PEDIDO, pedido);
			destino = ForwardConstants.FWD_DATOS_CLIENTE_FORM;

		} else {

			Pedido pedido = null;
			try {
				pedido = generarPedido(cliente.getDatosJSON());
			} catch (Exception e) {
				log.error(String.format(Constantes.MSG_EXCEPCION , e.getMessage()));
			}

			pedido.setCliente(cliente);

			carroService.insertarPedido(pedido);

			map.put("mensaje", "pedido.ok");

			destino = ForwardConstants.FWD_MENSAJE;

		}

		return destino;
	}

	
	private Pedido generarPedido(String datosJSON) throws JsonParseException, JsonMappingException, IOException {

		List<Producto> productos = Arrays.asList(objectMapper.readValue(datosJSON, Producto[].class));

		Pedido pedido = new Pedido();

		Detalle detalle = null;
		double nuevoTotal = 0;

		for (Producto unProducto : productos) {

			detalle = new Detalle();

			detalle.setProducto(unProducto);
			detalle.setCantidad(unProducto.getCantidad());
			detalle.setPrecio(unProducto.getPrecio());

			nuevoTotal = pedido.getTotal() + new Double(unProducto.getPrecio() * unProducto.getCantidad());
			pedido.setTotal(Precision.round(nuevoTotal, 2));
			pedido.setNumArticulos(pedido.getNumArticulos() + unProducto.getCantidad());

			pedido.getDetalles().add(detalle);
		}

		return pedido;

	}
}
