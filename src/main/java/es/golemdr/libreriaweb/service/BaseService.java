package es.golemdr.libreriaweb.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

public class BaseService {
	
	@Value("${api.server.name}")
	String SERVER;
	
	@Value("${api.server.port}")
	String PORT;	
	
	final RestTemplate restTemplate;
	
    public BaseService (){
        restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
    }

}
