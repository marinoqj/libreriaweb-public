package es.golemdr.libreriaweb.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import es.golemdr.libreriaweb.domain.Cliente;



@Service
public class ClientesService extends BaseService{
	
	private static final Logger log = LogManager.getLogger(ClientesService.class);
	
	
	public Cliente existeCliente(String dni){
		
		Cliente resultado = null;
		
		try {
			
			resultado = restTemplate.getForObject(SERVER + ":" + PORT + "/clientes/buscar/" + dni, Cliente.class);
			
		}catch (Exception e) {
			
			log.error("Se produjo la excepción:" + e.getMessage());
		}
		
		return resultado;

	}

}
