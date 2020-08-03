package management.domain;

import java.io.Serializable;
import java.sql.Date;

public class Log implements Serializable{

	private static final long serialVersionUID = 1L;

	private int logNo;
	private int userNo;
	private String logIn;
	private String logOut;

	public int getLogNo() {
		return logNo;
	}

	public void setLogNo(int logNo) {
		this.logNo = logNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getLogIn() {
		return logIn;
	}

	public void setLogIn(String logIn) {
		this.logIn = logIn;
	}

	public String getLogOut() {
		return logOut;
	}

	public void setLogOut(String logOut) {
		this.logOut = logOut;
	}

	@Override
	public String toString() {
		return "Log [logNo=" + logNo + ", userNo=" + userNo + ", logIn=" + logIn + ", logOut=" + logOut + "]";
	}
	
	
}
