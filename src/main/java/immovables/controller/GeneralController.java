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
import immovables.domain.Menu;
import immovables.domain.SearchList;
import immovables.service.MemberService;
import immovables.service.MenuService;

@Controller
public class GeneralController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired	private AdminController adminController;
	@Autowired	private LoginController loginController;


	@RequestMapping(value="/searchSchedule.do",  method = RequestMethod.GET)
    public ModelAndView searchSchedule(HttpServletRequest request, @RequestParam HashMap<String, Object> map) throws Exception{

		// 로그인 정보로 관리권한 확인
		Member loginMember = new Member();
		loginMember = adminController.hasAdminAuthority(request);
		String year = map.get("year").toString();
		String month = map.get("month").toString();
		String userId = loginMember.getId();
		SearchList	sl = new SearchList();
		
		sl.setYear(year);
		sl.setYear(month);
		sl.setUserId(userId);
		
    	ModelAndView mv = new ModelAndView("/general/schedule");

    	// 메뉴 목록
    	mv.addObject("menuList", loginController.getMenu());

    	// 선택 날짜 Set
    	mv.addObject("today", loginController.getToday(year,month));
    	
    	//session저장
    	request.getSession().setAttribute("id", userId);

		
    	return mv;
    }
	
	
}
