package immovables.domain;

import java.util.Date;
import java.util.List;

public class TelephoneSurvey {

	public	List<TelephoneSurvey>	TelephoneSurveyList;
	
	public	Integer					seq;
	
	public	Integer					memberId;

	public	String					memberName;
	
	public	Date					surveyDate;

	public	String					range;
	
	public	String					createrId;

	public	Date					createdDate;

	public	String					updaterId;

	public	Integer					state;

	public List<TelephoneSurvey> getTelephoneSurveyList() {
		return TelephoneSurveyList;
	}

	public void setTelephoneSurveyList(List<TelephoneSurvey> telephoneSurveyList) {
		TelephoneSurveyList = telephoneSurveyList;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Date getSurveyDate() {
		return surveyDate;
	}

	public void setSurveyDate(Date surveyDate) {
		this.surveyDate = surveyDate;
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
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

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	

}
