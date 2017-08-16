package immovables.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import immovables.domain.SearchList;
import immovables.domain.TelephoneSurvey;

@Repository
public class TelephoneSurveyRepositoryImpl extends AbstractDAO implements TelephoneSurveyRepository{

	@Autowired private	SqlSession session;
	
	@Override
	public List<TelephoneSurvey> selectTelephoneSurveyList(SearchList searchList) throws Exception {
		return session.selectList("TelephoneSurvey.selectTelephoneSurveyList", searchList);
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
		return session.selectList("TelephoneSurvey.selectTelephoneSurveyListByUserId", searchList);
	}

}
