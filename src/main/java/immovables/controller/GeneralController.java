package immovables.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import immovables.domain.Customer;
import immovables.domain.Member;
import immovables.domain.SearchList;
import immovables.domain.TelephoneSurvey;
import immovables.service.CustomerService;
import immovables.service.TelephoneSurveyService;

@Controller
public class GeneralController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired	private AdminController adminController;
	@Autowired	private LoginController loginController;

	@Autowired	private TelephoneSurveyService telephoneSurveyService;
	@Autowired	private CustomerService customerService;
	


	@RequestMapping(value="/searchSchedule.do",  method = RequestMethod.GET)
    public ModelAndView searchSchedule(HttpServletRequest request, @RequestParam HashMap<String, Object> map) throws Exception{

    	ModelAndView mv = new ModelAndView("/login");

		// 로그인 정보로 관리권한 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);

    	// 로그인 정보 확인
    	if(loginMember != null && loginMember.getId() != null) {
	    	// 날짜 Set
	    	String year = "";
	    	String month = "";
	    	HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
			if(map!=null && map.values() != null && map.size()>0){
				year = map.get("year").toString();
				month = map.get("month").toString();
				hashMap = loginController.getToday(year,month);
			}else {
				hashMap = loginController.getToday();
				year = hashMap.get("year").toString();
				month = hashMap.get("month").toString();

			}
	
	    	mv = new ModelAndView("/general/schedule");
	
			// 선택 날짜 Set
	    	mv.addObject("today", hashMap);
			
	    	// 메뉴 목록
	    	mv.addObject("menuList", loginController.getMenu());
	    	
	    	// 전화개척
	    	SearchList searchList = new SearchList();
	
			String lastDay = hashMap.get("lastDateOfMonth").toString();
			if(month.length()==1) month = "0" + month;
			
			searchList.setStartDate(year+month+"01");
			searchList.setEndDate(year+month+lastDay);
			searchList.setUserId(loginMember.getId());
	    	
			List<TelephoneSurvey> telephoneSurveyList = telephoneSurveyService.selectTelephoneSurveyListByUserId(searchList);
	    	mv.addObject("telephoneSurveyList", telephoneSurveyList);
	
	    	
	    	//session저장
			String userId = loginMember.getId();
	    	request.getSession().setAttribute("id", userId);

    	}

    	return mv;
    }
	
	
	@RequestMapping(value="/detailSchedule.do",  method = RequestMethod.GET)
    public ModelAndView deatilSchedule(HttpServletRequest request,@RequestParam(value="date") String date,@RequestParam(value="userId") String userId) throws Exception{
    	
    	ModelAndView mv = new ModelAndView("/login");

		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);
		
		if(loginMember.getId().equals(userId)){
			mv = new ModelAndView("/general/detailSchedule");
		}
		
		
		return mv;
	}
	
	
	@RequestMapping(value="/customer.do",  method = RequestMethod.GET)
    public ModelAndView customer(HttpServletRequest request, @RequestParam HashMap<String, Object> map) throws Exception{

		ModelAndView mv = new ModelAndView("/login");

		// 로그인 정보로 관리권한 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);

    	// 로그인 정보 확인
    	if(loginMember != null && loginMember.getId() != null) {
	    	mv = new ModelAndView("/general/customer");

    		// 날짜 Set
	    	String year = "";
	    	String month = "";
	    	HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
			if(map.values() != null && map.size()>0){
				year = map.get("year").toString();
				month = map.get("month").toString();
				hashMap = loginController.getToday(year,month);
			}else {
				hashMap = loginController.getToday();
			}
			// 선택 날짜 Set
	    	mv.addObject("selectedDay", hashMap);
					
	    	// 메뉴 목록
	    	mv.addObject("menuList", loginController.getMenu());
	

	    	// 조회목록
	    	SearchList searchList = new SearchList();
	
			String lastDay = hashMap.get("lastDateOfMonth").toString();
			if(month.length()==1) month = "0" + month;
			
			searchList.setStartDate(year+month+"01");
			searchList.setEndDate(year+month+lastDay);
			searchList.setUserId(loginMember.getId());
	    	
			List<Customer> customerList = customerService.selectCustomerListByUserId(searchList);
	    	mv.addObject("customerList", customerList);
	
	    	
	    	//session저장
			String userId = loginMember.getId();
	    	request.getSession().setAttribute("id", userId);

    	}

    	return mv;
    }
	

	@RequestMapping(value="/registerCustomer.do",  method = RequestMethod.GET)
	public ModelAndView registerCustomerForm(HttpServletRequest request, HttpServletResponse response,
	  		  @ModelAttribute("customer") Customer customer) throws Exception{
		
		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);
		
    	// 로그인 정보로 관리권한 확인
    	ModelAndView mv = new ModelAndView("../../index");
    	if(!loginMember.getIsDelete()) {
    		// 메뉴 등록화면
    		mv = new ModelAndView("/general/registerCustomer");
    		mv.addObject("loginMember", loginMember);

	    	// 메뉴 목록
	    	mv.addObject("menuList", loginController.getMenu());
    	}
		return mv;
	}
	
	@RequestMapping(value="/registerCustomer.do",  method = RequestMethod.POST)
	public ModelAndView registerCustomer(HttpServletRequest request, HttpServletResponse response,
	  		  @ModelAttribute("customer") Customer customer) throws Exception{
		
		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);
		
    	// 로그인 정보로 관리권한 확인
    	ModelAndView mv = new ModelAndView("../../index");
    	if(!loginMember.getIsDelete()) {
    		// 메뉴 등록화면
    		mv = new ModelAndView("/general/registerCustomer");
    		mv.addObject("loginMember", loginMember);
    		customer.setCreaterId(loginMember.id);
    		customerService.insertCustomer(customer);

	    	// 메뉴 목록
	    	mv.addObject("menuList", loginController.getMenu());
    	}
		return mv;
	}
	
	
	@RequestMapping(value="/customerDetail/{seq}.do",  method = RequestMethod.GET)
	public ModelAndView customerDetail(@PathVariable("seq") int seq, HttpServletRequest request, HttpServletResponse response,
	  		  @ModelAttribute("customer") Customer customer) throws Exception{
		
		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);
		
    	// 로그인 정보로 관리권한 확인
    	ModelAndView mv = new ModelAndView("../../index");
    	if(!loginMember.getIsDelete()) {
    		// 메뉴 등록화면
    		mv = new ModelAndView("/general/detailCustomer");
    		mv.addObject("loginMember", loginMember);

	    	// 메뉴 목록
	    	mv.addObject("menuList", loginController.getMenu());
	    	
	    	SearchList searchList = new SearchList();
	    	searchList.setSeq(seq);
	    	searchList.setUserId(loginMember.id);
	    	searchList.setIsAdmin(loginMember.isAdmin);

	    	Customer customerDetail = customerService.selectCustomer(searchList);
	    	
	    	mv.addObject("customer",customerDetail);
    	}
    	
		return mv;
	}

		

	@RequestMapping(value="/checkContactNumber.do",  method = RequestMethod.POST, headers="Accept=*/*",produces = "application/json")
	@ResponseBody
	public Map<String,Object> checkContactNumber(HttpServletRequest request, HttpServletResponse response,
	  		  @ModelAttribute("customer") Customer customer) throws Exception{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);
		
    	// 로그인 정보로 관리권한 확인
    	if(!loginMember.getIsDelete()) {
			Customer resultCustomer = customerService.selectCustomerByContactNumber(customer.contactNumber);
			resultMap.put("result", resultCustomer);
    	}else {
    		resultMap.put("result", "-1");
    	}
		
		return resultMap;
	}
		
}
