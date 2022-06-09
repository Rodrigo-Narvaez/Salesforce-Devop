public class ContactSearch {
	public static List<Contact> searchForContacts (string a, string b){  
     
     return [SELECT Id, Name FROM Contact WHERE lastName = :a AND MailingPostalCode = :b];
    }
}