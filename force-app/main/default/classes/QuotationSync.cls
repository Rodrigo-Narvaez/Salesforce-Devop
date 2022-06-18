public interface QuotationSync {
	Boolean confirmProductExistByCode(String codigoProd);
    
    String searchProductByCode(String codigoProd);
}