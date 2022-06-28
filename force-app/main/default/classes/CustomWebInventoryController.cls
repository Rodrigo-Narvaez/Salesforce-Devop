public class CustomWebInventoryController {
	

    @AuraEnabled(cacheable=true)
    public static String getInventary(String prodCode) {
        try{
            Inventario__c inv = [SELECT Id FROM Inventario__c WHERE (CodigoProd__c = :prodCode)  LIMIT 1];
            String invID = (String)(inv.Id);
            return invID;
        }catch(QueryException err){
            return null;
        }
    }


}