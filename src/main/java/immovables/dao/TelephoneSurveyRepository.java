package immovables.dao;

import java.util.List;

import immovables.domain.SearchList;
import immovables.domain.TelephoneSurvey;

public interface TelephoneSurveyRepository {

	List<TelephoneSurvey> selectTelephoneSurveyList(SearchList searchList) throws Exception;

	List<TelephoneSurvey> selectTelephoneSurveyListByUserId(SearchList searchList) throws Exception;

	TelephoneSurvey	selectTelephoneSurvery() throws Exception;
	
	Integer insertTelephoneSurvey(TelephoneSurvey telephoneSurvery)throws Exception;
	
	Integer updateTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception;
	
	Integer deleteTelephoneSurvey(TelephoneSurvey telephoneSurvery) throws Exception;
}
