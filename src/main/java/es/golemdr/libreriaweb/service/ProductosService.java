package es.golemdr.libreriaweb.service;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Producto;


@Service
public class ProductosService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(ProductosService.class);
	
	
	public List<Producto> getProductos(){
		
		ResponseEntity<Producto[]> response = restTemplate.getForEntity(SERVER + ":" + PORT + "/productos", Producto[].class);
		
		Producto[] productos = response.getBody();
		
		return Arrays.asList(productos);

	}

}
