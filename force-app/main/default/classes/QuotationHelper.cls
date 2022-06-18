public class QuotationHelper implements QuotationSync {
    
    
    public void initialConfig(){
        Account objAcc = new Account();
        objAcc.Name = 'Compuworld';
        INSERT objAcc;
        system.debug('Cuenta agregada: ' + objAcc);
    }
    
    public static List<inventario__c> productsInInventory(){
        List<Inventario__c> objInv = new List<Inventario__c>();
        Return objInv = [SELECT Cantidad_apart__c,Cantidad_dis__c,CodigoProd__c,Name,Name__c FROM inventario__c];
    }
    
    public Boolean confirmProductExistByCode(String codigoProd){
        Boolean res = TRUE;
        List<Product2> pro = new List<Product2>();
        pro = [SELECT ProductCode, ExternalId FROM Product2 WHERE ProductCode=:codigoProd];
        if(pro.size() > 0){
             return res;     
        }else{
            res = FALSE;
            return res;
        } 
    }
    
    public String searchProductByCode(String codigoProd){
        inventario__c objcod = new inventario__c(); 
        objcod = [SELECT Cantidad_dis__c,CodigoProd__c FROM inventario__c WHERE CodigoProd__c=:codigoProd];
        String sCantDis = String.valueOf(objcod.Cantidad_dis__c);
        if(objcod.Cantidad_dis__c == 0){
            sCantDis = '0';
            return sCantDis;
        }else{
        
             return sCantDis;
        } 
    }

    public void updateRecords(String codProd, Integer Quantity){

        inventario__c reservacion = new inventario__c();
        reservacion = [SELECT Cantidad_apart__c FROM inventario__c WHERE CodigoProd__c=: codProd LIMIT 1];
        system.debug('Cantidad reservada: ' + Quantity);
        reservacion.Cantidad_apart__c =+ Quantity;
        system.debug('Total de cantidad reservada:' + reservacion.Cantidad_apart__c);
        UPDATE reservacion;
    }
	@InvocableMethod (label = 'Cantidad de productos')
	public static void StockEmptyAlert(){
        List<Inventario__c> lstInventario = new List<Inventario__c>();
        lstInventario = productsInInventory();
        //system.debug('Lista ---->' + lstInventario);
        Date fecha = System.today();
        for (Inventario__c objInv : lstInventario) {
            if (objInv.Cantidad_dis__c == 0 ) {
                system.debug('ALERTA, existen productos sin cantidad disponible ' + fecha);  
            }
        }
    }    
   
}