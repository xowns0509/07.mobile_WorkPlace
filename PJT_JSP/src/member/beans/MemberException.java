package member.beans;

//예외 이름을 보고 어디가 잘못되었는지 한번에 볼 수 있다.
public class MemberException extends Exception{
	String msg;
	
	public MemberException(String msg){
		this.msg=msg;
	}
	
	public String getMessage(){
		return msg;
	}
}