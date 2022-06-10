public class QuotationHelper implements QuotationSync {
    
    public void initialConfig(){
        Account objAcc = new Account();
        objAcc.Name = 'Compuworld';
        INSERT objAcc;
        system.debug('Cuenta agregada: ' + objAcc);
    }
    
    public List<inventario__c> productsInInventory(){
        List<Inventario__c> objInv = new List<Inventario__c>();
        Return objInv = [SELECT Cantidad_apart__c,Cantidad_dis__c,CodigoProd__c,Name,Name__c FROM inventario__c];
    }
    
    public String confirmProductExistByCode(String codigoProd){
        Product2 pro = new Product2();
        String retorno = 'TRUE';
        pro = [SELECT ProductCode, ExternalId FROM Product2 WHERE ProductCode=:codigoProd];
        if(pro != NULL){
             return retorno;     
        }else{
            retorno = 'FALSE';
            return retorno;
        } 
    }
    
    public String searchProductByCode(String codigoProd){
        inventario__c objcod = new inventario__c(); 
        objcod = [SELECT Cantidad_dis__c,CodigoProd__c FROM inventario__c WHERE CodigoProd__c=:codigoProd];
        String sCantDis = String.valueOf(objcod.Cantidad_dis__c);
        if(objcod.Cantidad_dis__c == NULL){
            sCantDis = '0';
            return sCantDis;
        }else{
        
             return sCantDis;
        } 
    }
    
   
}