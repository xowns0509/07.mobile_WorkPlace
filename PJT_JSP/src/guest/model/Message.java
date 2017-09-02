package guest.model;

/**
 * 자바빈즈클래스
 * 
 * @author TaeJoon
 */
public class Message {

	private int id;// 시퀸스번호를 갖고올 때 사용하는 놈
	private String guestName;// 화면에 뜨는 놈들로 변수명이 모두 맞아야 함.
	private String password;
	private String message;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
