package immovables.dao;

import java.util.List;

import immovables.domain.Menu;

public interface MenuRepository {

	List<Menu> selecMenuList() throws Exception;

}
