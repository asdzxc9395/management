package management.domain;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Expense implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int expenseNo;
	private int userNo;
	private String name;
	private Date useDate;
	private String usePrice;
	private String approvePrice;
	private String processStatus;
	private Date registrationDate;
	private Date processDate;
	private String receipt;
	private String remark;
	private int state;
	
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getProcessDate() {
		return processDate;
	}
	public void setProcessDate(Date processDate) {
		this.processDate = processDate;
	}
	public int getExpenseNo() {
		return expenseNo;
	}
	public void setExpenseNo(int expenseNo) {
		this.expenseNo = expenseNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getUseDate() {
		return useDate;
	}
	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}
	public String getUsePrice() {
		return usePrice;
	}
	public void setUsePrice(String usePrice) {
		this.usePrice = usePrice;
	}
	public String getApprovePrice() {
		return approvePrice;
	}
	public void setApprovePrice(String approvePrice) {
		this.approvePrice = approvePrice;
	}
	public String getProcessStatus() {
		return processStatus;
	}
	public void setProcessStatus(String processStatus) {
		this.processStatus = processStatus;
	}
	public Date getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Expense [expenseNo=" + expenseNo + ", userNo=" + userNo + ", name=" + name + ", useDate=" + useDate
				+ ", usePrice=" + usePrice + ", approvePrice=" + approvePrice + ", processStatus=" + processStatus
				+ ", registrationDate=" + registrationDate + ", processDate=" + processDate + ", receipt=" + receipt
				+ ", remark=" + remark + ", state=" + state + "]";
	}
	

	

}