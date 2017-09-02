package phonelist;

public class PhoneListException extends Exception
{
  public PhoneListException(){
  		super();
  	}
  	
  public PhoneListException(String error){
  		super( error );
  	}
 		
}