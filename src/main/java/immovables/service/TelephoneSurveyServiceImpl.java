package immovables.service;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import immovables.dao.TelephoneSurveyRepository;
import immovables.domain.SearchList;
import immovables.domain.TelephoneSurvey;

@Service
public class TelephoneSurveyServiceImpl implements TelephoneSurveyService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired private TelephoneSurveyRepository dao;
	
	@Override
	public List<TelephoneSurvey> selectTelephoneSurveyList(HashMap<String, Integer> hashMap) throws Exception {
		String year = hashMap.get("year").toString();
		String month = hashMap.get("month").toString();
		String lastDay = hashMap.get("lastDateOfMonth").toString();
		if(month.length()==1) month = "0" + month;
		
		SearchList searchList = new SearchList();
		searchList.setStartDate(year+month+"01");
		searchList.setEndDate(year+month+lastDay);
		
		return dao.selectTelephoneSurveyList(searchList);
	}

	@Override
	public TelephoneSurvey selectTelephoneSurvery() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer insertTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer updateTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TelephoneSurvey> selectTelephoneSurveyListByUserId(SearchList searchList) throws Exception {
		return dao.selectTelephoneSurveyListByUserId(searchList);
	}

}
