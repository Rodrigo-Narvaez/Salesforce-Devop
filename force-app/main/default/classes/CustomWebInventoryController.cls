public class CustomWebInventoryController {
	/*
    private final sObject parent;
    public String codigo {get;set;}
    public List<Inventario__c> listInv {get;set;}
    
    public CustomWebInventoryController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
    
    public void buscar(){
        String query = 'SELECT id,CodigoProd__c, Cantidad_dis__c, Cantidad_apart__c,Name__c FROM Inventario__c WHERE CodigoProd__c=:codigo';
        listInv = Database.query(query);
    }
    
    public void limpiar(){
        listInv.clear();
    }*/
    /*
    @AuraEnabled
    public static List<Inventario__c> buscarProd(String codigoProd){
        return [SELECT id,CodigoProd__c, Cantidad_dis__c, Cantidad_apart__c,Name__c FROM Inventario__c WHERE CodigoProd__c=:codigoProd];
    }*/
    
    @AuraEnabled
    public static List<Inventario__c> getInventario(){
        return [SELECT id,CodigoProd__c, Cantidad_dis__c, Cantidad_apart__c,Name__c FROM Inventario__c LIMIT 1];
    }
    
}