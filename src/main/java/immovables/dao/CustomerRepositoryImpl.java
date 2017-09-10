package immovables.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import immovables.domain.Customer;
import immovables.domain.SearchList;

@Repository
public class CustomerRepositoryImpl extends AbstractDAO implements CustomerRepository{

	@Autowired private	SqlSession session;
	
	@Override
	public List<Customer> selectCustomerList(HashMap<String, Integer> hashMap) throws Exception {
		return null;
	}

	@Override
	public List<Customer> selectCustomerListByUserId(SearchList searchList) throws Exception {
		return session.selectList("Customer.selectCustomerListByUserId", searchList);
	}

	@Override
	public Customer selectCustomer(SearchList searchList) throws Exception {
		return session.selectOne("Customer.selectCustomer", searchList);
	}

	@Override
	public Integer insertCustomer(Customer customer) throws Exception {
		return session.insert("Customer.insertCustomer", customer);
	}

	@Override
	public Integer updateCustomer(Customer customer) throws Exception {
		return null;
	}

	@Override
	public Integer deleteCustomer(Customer customer) throws Exception {
		return null;
	}

	@Override
	public Customer selectCustomerByContactNumber(String contactNumber) throws Exception {
		return session.selectOne("Customer.selectCustomerByContactNumber", contactNumber);
	}
	
}
