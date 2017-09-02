package mvc.board.command;

public class BoardCommandException extends Exception{
	  public BoardCommandException(){
	  		super();
	  	}
	  	
	  public BoardCommandException(String error){
	  		super( error );
	  	}

}
