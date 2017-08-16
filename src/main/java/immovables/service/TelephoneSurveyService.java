package immovables.service;

import java.util.HashMap;
import java.util.List;

import immovables.domain.SearchList;
import immovables.domain.TelephoneSurvey;

public interface TelephoneSurveyService {

	List<TelephoneSurvey> selectTelephoneSurveyList(HashMap<String, Integer> hashMap) throws Exception;

	List<TelephoneSurvey> selectTelephoneSurveyListByUserId(SearchList searchList) throws Exception;

	TelephoneSurvey	selectTelephoneSurvery() throws Exception;
	
	Integer insertTelephoneSurvey(TelephoneSurvey telephoneSurvery)throws Exception;
	
	Integer updateTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception;
	
	Integer deleteTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception;
}
