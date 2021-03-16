package es.golemdr.libreriaweb.ext.exceptions.resolver;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import es.golemdr.libreriaweb.ext.Constantes;
import es.golemdr.libreriaweb.ext.exceptions.LoginException;
import es.golemdr.libreriaweb.ext.utils.tools.GeneradorCodigo;


public class CustomExceptionResolver extends SimpleMappingExceptionResolver{
	
	private static final Logger log = LogManager.getLogger(CustomExceptionResolver.class);
	
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    	String mensaje = null;
    	String codigo = null;
    	ModelAndView view = null;
    	
    	if(ex instanceof NullPointerException ){
    		
    		mensaje = "excepcion.valor.nulo";
    	
    	}else if(ex instanceof LoginException){
        		
        	mensaje = "excepcion.error.login";    		
    		
    	}else{
    	
    		mensaje = "excepcion.error.desconocido";
    	}

    	codigo = GeneradorCodigo.generaCodigoExcepcion();
    	
    	
    	log.error("Se produjo una excepción de tipo : " + ex.getMessage());
    	log.error("El código de la excepción es : " + codigo);
    	log.error("La traza de la excepción es : " + recuperarTraza(ex, "LOG"));
    	
    	
    	
    	request.setAttribute(Constantes.ATRIBUTO_MENSAJE, mensaje);
    	request.setAttribute(Constantes.ATRIBUTO_CODIGO, codigo);
    	request.setAttribute(Constantes.ATRIBUTO_TRAZA, recuperarTraza(ex, "HTML"));
    	

        view =  super.resolveException(request, response, handler, ex);
                
        return view;

    }
    
	public static String recuperarTraza(Throwable throwable, String output) {
		
		String saltoLinea = null;
		
		if(output.equalsIgnoreCase("HTML")){
			saltoLinea = "<br>";
		}else if(output.equalsIgnoreCase("LOG")) {
			saltoLinea = "\n";
		}

		StringBuilder msg = new StringBuilder();

		msg.append(saltoLinea);
        msg.append("Tipo de excepción: " + throwable.getMessage());

        
        msg.append(saltoLinea);
        msg.append("---------------------------------------------------------------------");
        msg.append(saltoLinea);
        msg.append(saltoLinea);
        try {
            StringWriter sWriter = new StringWriter();
            PrintWriter pWriter = new PrintWriter(sWriter);
            throwable.printStackTrace(pWriter);
            msg.append(sWriter.toString());
            msg.append(saltoLinea);
            msg.append("---------------------------------------------------------------------");
            msg.append(saltoLinea);
            sWriter.close();
        } catch (Exception e) {
            msg.append(throwable.toString());
        }
        return msg.toString();		
	}

}
