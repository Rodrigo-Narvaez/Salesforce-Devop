trigger prodReservacion on QuoteLineItem (after insert) {
    QuoteLineItem qli = new QuoteLineItem();	
    QuotationHelper qh = new QuotationHelper();
    Integer Cantidad;
    
    for(QuoteLineItem X: Trigger.New){
        qli = X;
        Cantidad = Integer.valueOf(qli.Quantity);
       qh.updateRecords(qli.Inventario__r.CodigoProd__c, Cantidad);
    } 
    System.debug('Cantidad: '+ qh);
}