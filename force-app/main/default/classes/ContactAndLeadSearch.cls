public class ContactAndLeadSearch {
	public static List<List<SObject>> searchContactsAndLeads (String p) {
    List<List<SObject>> result = [FIND :p IN ALL FIELDS 
                        RETURNING Contact(Firstname,LastName), Lead(FirstName,LastName)];
    	return result;
 	} 
}