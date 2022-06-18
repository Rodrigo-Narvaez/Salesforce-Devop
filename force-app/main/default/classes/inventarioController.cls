public class inventarioController {
	
    private final sObject parent;
    public String codigo {get;set;}
    public List<Inventario__c> listInv {get;set;}
    
    public inventarioController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
    
    public void buscar(){
        String query = 'SELECT id,CodigoProd__c, Cantidad_dis__c, Cantidad_apart__c,Name__c FROM Inventario__c WHERE CodigoProd__c=:codigo';
        //String query = 'SELECT id,Product2.Name, UnitPrice, Product2.ExternalId FROM PricebookEntry WHERE Product2.ExternalId=:codigo';
        listInv = Database.query(query);
    }
    
    public void limpiar(){
        listInv.clear();
    }
}