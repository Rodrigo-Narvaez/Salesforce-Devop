@isTest
public class QuotationHelperTest {
    @testSetup static void setup(){
        Product2 pro = new Product2();
        pro.Name='Test';
        pro.ProductCode = 'Test123';
        INSERT pro;
        inventario__c objcod = new inventario__c();
        objcod.Name__c = 'Nokia';
        objcod.Name='Telefonia';
        objcod.Cantidad_apart__c = 1;
        objcod.Cantidad_dis__c = 10;
        objcod.CodigoProd__c = 'Test123';
        INSERT objcod;
        inventario__c objcod2 = new inventario__c();
        objcod2.Name__c = 'Nokia';
        objcod2.Name='Telefonia';
        objcod2.Cantidad_apart__c = 1;
        objcod2.Cantidad_dis__c = 0;
        objcod2.CodigoProd__c = 'Test321';
        INSERT objcod2;
    }
    
    
    @isTest
    static void initialconfig(){
        Test.startTest();
        QuotationHelper qh = new QuotationHelper();
        qh.initialConfig();
        Test.stopTest();
    }
    
    @isTest
    static void productsInInventory(){
        Test.startTest(); 
        QuotationHelper.productsInInventory();
        test.stopTest();
    }
    
    @isTest 
    static void confirmProductExistByCode(){
        Test.startTest();
        QuotationHelper qh = new QuotationHelper();
		qh.confirmProductExistByCode('Test123');
        system.assertEquals(TRUE, qh.confirmProductExistByCode('Test123'));
        qh.confirmProductExistByCode('productnull');
        Test.stopTest();
    }
    
    @isTest
    static void searchProductByCode(){
        Test.startTest();
        QuotationHelper qh = new QuotationHelper();
        qh.searchProductByCode('Test123');
        Test.stopTest();
    }
    
	@isTest
    static void searchProductByCode0(){
        Test.startTest();
        QuotationHelper qh = new QuotationHelper();
        qh.searchProductByCode('Test321');
        Test.stopTest();
    }
    
    @isTest
    static void StockEmptyAlert(){
        List<Inventario__c> lstInventario = new List<Inventario__c>();
        lstInventario = [SELECT Cantidad_apart__c,Cantidad_dis__c,CodigoProd__c,Name,Name__c FROM inventario__c];
        Test.startTest();
        QuotationHelper.StockEmptyAlert();
        Test.stopTest();
    }
    
    @isTest 
    static void updateRecords(){
        Integer cantidad = 2;
        QuotationHelper qh = new QuotationHelper();
        Test.startTest();
        qh.updateRecords('Test123', cantidad);
        Test.stopTest();
    }    
}