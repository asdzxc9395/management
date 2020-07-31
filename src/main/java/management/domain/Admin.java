package management.domain;

import java.io.Serializable;

public class Admin implements Serializable{

	private static final long serialVersionUID = 1L;

	private int adminNo;
	private String id;
	private String password;
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
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
	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", id=" + id + ", password=" + password + "]";
	}
	
}
