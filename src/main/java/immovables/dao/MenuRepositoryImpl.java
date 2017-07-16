package immovables.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import immovables.domain.Menu;

@Repository
public class MenuRepositoryImpl  extends AbstractDAO implements MenuRepository{

	@Autowired
	private	SqlSession session;

	
	@Override
	public List<Menu> selecMenuList() throws Exception {
		return session.selectList("Menu.selectMenuList");
	}

}
