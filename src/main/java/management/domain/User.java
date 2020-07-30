package management.domain;

import java.io.Serializable;

public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	private int userNo;
	private String id;
	private String password;
	private String name;
	private String image;
	private String alterKey;
	
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", image="
				+ image + ", alterKey=" + alterKey + "]";
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getAlterKey() {
		return alterKey;
	}
	public void setAlterKey(String alterKey) {
		this.alterKey = alterKey;
	}
	
	
}
