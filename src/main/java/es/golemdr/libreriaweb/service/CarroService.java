package es.golemdr.libreriaweb.service;

import java.net.URI;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Pedido;



@Service
public class CarroService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(CarroService.class);
	
	
	public URI insertarPedido(Pedido pedido) {
		
		return restTemplate.postForLocation(SERVER + ":" + PORT +  "/pedidos", pedido);
		
	}

}
