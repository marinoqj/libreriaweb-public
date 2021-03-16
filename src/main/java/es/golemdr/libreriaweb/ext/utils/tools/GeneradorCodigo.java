package es.golemdr.libreriaweb.ext.utils.tools;

public class GeneradorCodigo {
	
	public static char mayusculaAlAzar(){
		
		int aleatorio = (int)Math.round(Math.random()* 25 + 65);		
		char aux = (char)(aleatorio);
		
			
		return aux;
		
		
	}
	
	public static int numeroAlAzar(){
		
		int aleatorio = (int)(Math.random()* 8)+1;
		
		return aleatorio;
		
	}

	
	public static String generaCodigoExcepcion(){
		
		StringBuffer resultado = new StringBuffer();
		
		// Generamos un ticket con el formato AA99AA99		
		resultado.append(mayusculaAlAzar());
		resultado.append(mayusculaAlAzar());
		resultado.append(numeroAlAzar());
		resultado.append(numeroAlAzar());
		resultado.append(mayusculaAlAzar());
		resultado.append(mayusculaAlAzar());
		resultado.append(numeroAlAzar());
		resultado.append(numeroAlAzar());
		
		return resultado.toString(); 
		
		
		
	}

}
