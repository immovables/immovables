package immovables.domain;

import java.util.Date;
import java.util.List;

public class Customer {
	
	public	List<Customer>	customers;
	
	public	Member			member;
	
	public	Integer			seq;
	
	public	String			contactNumber;

	public	Date			callDatetime;

	public	Date			meetingDatetime;
	
	public	String			businessType;

	public	String			officeType;

	public	Integer			minDeposit;

	public	Integer			maxDeposit;
	
	public	Boolean			isUndecidedDeposit;
	
	public	Integer			minRental;

	public	Integer			maxRental;

	public	Boolean			isMaintenanceCost;

	public	Integer			minArea;

	public	Integer			maxArea;

	public	Boolean			isUndecidedArea;

	public	String			zone;

	public	String			content;
	
	public	String			moveMonth;

	public	String			moveDay;

	public	Boolean			isUndecidedMoveDate;
	
	public	Integer			state;

	public	String			stateEtc;

	public	Boolean			isDelete;

	public	String			managerId;

	public	String			createrId;

	public	Date			createdDate;

	public	String			updaterId;

	public	Date			updatedDate;

	
	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Date getCallDatetime() {
		return callDatetime;
	}

	public void setCallDatetime(Date callDatetime) {
		this.callDatetime = callDatetime;
	}

	public Date getMeetingDatetime() {
		return meetingDatetime;
	}

	public void setMeetingDatetime(Date meetingDatetime) {
		this.meetingDatetime = meetingDatetime;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getOfficeType() {
		return officeType;
	}

	public void setOfficeType(String officeType) {
		this.officeType = officeType;
	}

	public Integer getMinDeposit() {
		return minDeposit;
	}

	public void setMinDeposit(Integer minDeposit) {
		this.minDeposit = minDeposit;
	}

	public Integer getMaxDeposit() {
		return maxDeposit;
	}

	public void setMaxDeposit(Integer maxDeposit) {
		this.maxDeposit = maxDeposit;
	}

	public Boolean getIsUndecidedDeposit() {
		return isUndecidedDeposit;
	}

	public void setIsUndecidedDeposit(Boolean isUndecidedDeposit) {
		this.isUndecidedDeposit = isUndecidedDeposit;
	}

	public Integer getMinRental() {
		return minRental;
	}

	public void setMinRental(Integer minRental) {
		this.minRental = minRental;
	}

	public Integer getMaxRental() {
		return maxRental;
	}

	public void setMaxRental(Integer maxRental) {
		this.maxRental = maxRental;
	}

	public Boolean getIsMaintenanceCost() {
		return isMaintenanceCost;
	}

	public void setIsMaintenanceCost(Boolean isMaintenanceCost) {
		this.isMaintenanceCost = isMaintenanceCost;
	}

	public Integer getMinArea() {
		return minArea;
	}

	public void setMinArea(Integer minArea) {
		this.minArea = minArea;
	}

	public Integer getMaxArea() {
		return maxArea;
	}

	public void setMaxArea(Integer maxArea) {
		this.maxArea = maxArea;
	}

	public Boolean getIsUndecidedArea() {
		return isUndecidedArea;
	}

	public void setIsUndecidedArea(Boolean isUndecidedArea) {
		this.isUndecidedArea = isUndecidedArea;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMoveMonth() {
		return moveMonth;
	}

	public void setMoveMonth(String moveMonth) {
		this.moveMonth = moveMonth;
	}

	public String getMoveDay() {
		return moveDay;
	}

	public void setMoveDay(String moveDay) {
		this.moveDay = moveDay;
	}

	public Boolean getIsUndecidedMoveDate() {
		return isUndecidedMoveDate;
	}

	public void setIsUndecidedMoveDate(Boolean isUndecidedMoveDate) {
		this.isUndecidedMoveDate = isUndecidedMoveDate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
	public String getStateEtc() {
		return stateEtc;
	}

	public void setStateEtc(String stateEtc) {
		this.stateEtc = stateEtc;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getCreaterId() {
		return createrId;
	}

	public void setCreaterId(String createrId) {
		this.createrId = createrId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdaterId() {
		return updaterId;
	}

	public void setUpdaterId(String updaterId) {
		this.updaterId = updaterId;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

}
