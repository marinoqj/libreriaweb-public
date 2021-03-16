package es.golemdr.libreriaweb.controller;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import es.golemdr.libreriaweb.config.AppInitializer;
import es.golemdr.libreriaweb.config.WebMvcConfig;
import es.golemdr.libreriaweb.controller.constantes.ForwardConstants;
import es.golemdr.libreriaweb.controller.constantes.UrlConstants;
import es.golemdr.libreriaweb.ext.Constantes;




@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(classes = { AppInitializer.class, WebMvcConfig.class})
public class LibreriaPublicControllerTests {
	

   @Autowired
   private WebApplicationContext wac;

   
   private MockMvc mockMvc;

   @BeforeEach
   void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
        //this.mockMvc = MockMvcBuilders.standaloneSetup(new LibreriaPublicController()).build();
   }


	
	
	@Test
	public void testListConstantes() throws Exception {
		
		assertNotNull(wac);
		assertNotNull(mockMvc);
		
		mockMvc.perform(get(UrlConstants.URL_LISTADO_PRODUCTOS, "1")).andExpect(status().isOk())
				.andExpect(model().attributeExists(Constantes.ATRIBUTO_PRODUCTOS))
				.andExpect(view().name(ForwardConstants.FWD_LISTADO_PRODUCTOS));
	}

	//@Disabled
	@Test	
	public void testVerCarro() throws Exception {
		
		assertNotNull(mockMvc);
		
		mockMvc.perform(post(UrlConstants.URL_VER_CARRO)
		.param("datosJSON", "[{\"idProducto\":\"17\",\"nombre\":\"El poder del ahora (Eckhart Tolle)\",\"precio\":15.95,\"cantidad\":1},"
				+ "{\"idProducto\":\"18\",\"nombre\":\"El monje que vendió su Ferrari (Robin Sharma)\",\"precio\":21.5,\"cantidad\":1}]"))
		.andExpect(model().attributeExists("itemsCarro"))				
		.andExpect(model().attributeExists(Constantes.ATRIBUTO_PEDIDO))
		.andExpect(view().name(ForwardConstants.FWD_LISTADO_PRODUCTOS_CARRO));
	}

	
	
	
	
}
