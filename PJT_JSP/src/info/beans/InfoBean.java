package info.beans;

public class InfoBean {
	// 멤버필드명이 폼 태그의 name과 동일해야 함. 요소들에게 부여되었던 name들
	String name;

	String id;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGender() {
		String gender = "";
		char sung = id.charAt(7);
		if (sung == '1' || sung == '3' || sung == '9')
			gender = "남정네";
		else
			gender = "여인네";

		return gender;
	}

	public InfoBean() {
		// TODO Auto-generated constructor stub
	}

}
