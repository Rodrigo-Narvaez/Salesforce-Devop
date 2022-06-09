public class MiApexClassDevConsole {

    public void miMetodoUno(){
        system.debug('Metodo Instanciado');
    }
    
    public static void miMeotodoDos(){
        system.debug('Metodo no instanciado');
    }
    
    public static void miMetodoTres(String msj){
        system.debug('Metodo con parametro' + msj);	
    }
    
    public string miMetodoCuatro(String nombre){
        return 'Hola '+nombre;
    }
}