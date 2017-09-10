package immovables.dao;

import java.util.HashMap;
import java.util.List;

import immovables.domain.Customer;
import immovables.domain.SearchList;

public interface CustomerRepository {

	List<Customer> selectCustomerList(HashMap<String, Integer> hashMap) throws Exception;

	List<Customer> selectCustomerListByUserId(SearchList searchList) throws Exception;

	Customer selectCustomerByContactNumber(String contactNumber) throws Exception;
	
	Customer selectCustomer(SearchList searchList) throws Exception;
	
	Integer insertCustomer(Customer customer)throws Exception;
	
	Integer updateCustomer(Customer customer) throws Exception;
	
	Integer deleteCustomer(Customer customer) throws Exception;
}
