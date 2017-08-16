package immovables.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import immovables.domain.Member;
import immovables.domain.SearchList;
import immovables.domain.TelephoneSurvey;
import immovables.service.TelephoneSurveyService;

@Controller
public class GeneralController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired	private AdminController adminController;
	@Autowired	private LoginController loginController;

	@Autowired	private TelephoneSurveyService telephoneSurveyService;


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

}
