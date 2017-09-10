package immovables.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import immovables.dao.CustomerRepository;
import immovables.dao.MemberRepository;
import immovables.domain.Customer;
import immovables.domain.SearchList;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerRepository dao;
	
	@Override
	public List<Customer> selectCustomerList(HashMap<String, Integer> hashMap) throws Exception {
		return null;
	}

	@Override
	public List<Customer> selectCustomerListByUserId(SearchList searchList) throws Exception {
		return dao.selectCustomerListByUserId(searchList);
	}

	@Override
	public Customer selectCustomer(SearchList searchList) throws Exception {
		return dao.selectCustomer(searchList);
	}

	@Override
	public Integer insertCustomer(Customer customer) throws Exception {
		// 연락처 중복 check

		// 입주시기 날짜형식으로 변경(미정 혹은 미 입력시 null 셋팅)
		String month = customer.getMoveMonth();
		if(month.length()>0){
			month = month + "-01";
			customer.setMoveMonth(month);
		}else {
			customer.setMoveMonth(null);
		}
		// 
		return dao.insertCustomer(customer);
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
		return dao.selectCustomerByContactNumber(contactNumber);
	}

}
