public class MiClasePruebaUno {
    
   public void hello(){
        system.debug('Hola');
    }
    
    
    public void consultaSOQL(){
        //String miCuenta = 'Bedu Update prueba';
        //Account acc = [select id, Name FROM aCCOUNT where Name = :miCuenta limit 1];
        Account acc = [SELECT id,Name FROM Account LIMIT 1];
        system.debug('El nombre de la cuenta es:' + acc.Name);
            
    }
    
    public void HelloSOSL(){
        
      List<List<sObject>> result = [FIND 'United'
      IN ALL FIELDS
      RETURNING
              Account(Id, Name, Type
              WHERE Rating = 'Hot'
              ORDER BY CreatedDate DESC),
              Lead(Id, Name, Company
              ORDER BY CreatedDate),
              Contact(Id, Name, Account.Name
              ORDER BY Account.Name, LastName),
              Opportunity(Id, Name, Account.Name
                          ORDER BY CreatedDate)];
        
    }

    @InvocableMethod(label='Prueba Flow')
    public static void pruebaFlow(){
        system.debug('Mensaje de prueba');
    }
    
    /*
    public void DML(){
        
        Inventario__c inv = new Inventario__c();
        inv.Name = 'Test 4';
        inv.Cantidad_apart__c = 3;
        inv.CodigoProd__c = 'PROD004';
        //insert inv;
        
        Inventario__c inv2 = new Inventario__c();
        inv2.Name = 'Test 5';
        inv2.Cantidad_apart__c = 3;
        inv2.CodigoProd__c = 'PROD005';
        //insert inv2;
        
        List<Inventario__c> lst = new List<Inventario__c>();
        lst.add(inv);
        lst.add(inv2);
        
        insert lst;
        
        Inventario__c inv3 = [SELECT id, Name, CodigoProd__c FROM Inventario__c WHERE Id = 'a005f000007kK78AAE' LIMIT 1];
        inv3.Name = 'Otro Valor';
        update inv3;
        
        
        Inventario__c inv4 = [SELECT id, Name, CodigoProd__c FROM Inventario__c WHERE Id = 'a005f000007kK78AAE' LIMIT 1];
        delete inv4;
        
        //Inventario__c invDML = new Inventario__c(Name='Test',Cantidad_apart__c=3);
        //insert inv;
    }
	*/

}