package immovables.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import immovables.dao.MenuRepository;
import immovables.domain.Menu;

@Service
public class MenuServiceImpl  implements MenuService{

	@Autowired
	private MenuRepository dao;

	
	@Override
	public List<Menu> selecMenuList() throws Exception {
		return dao.selecMenuList();
	}

}
