package immovables.controller;


import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import immovables.domain.Member;
import immovables.domain.Menu;
import immovables.service.MemberService;
import immovables.service.MenuService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired	private GeneralController generalController;
	@Autowired	private MemberService memberService;
	@Autowired	private MenuService menuService;

	
	@RequestMapping(value="/login.do",  method = RequestMethod.GET)
    public ModelAndView loginView(HttpServletRequest request, HttpServletResponse response,
    		  @ModelAttribute("member") Member member) throws Exception{
		
		Member loginMember = new Member();
		loginMember = searchMember(request);
    	ModelAndView mv = new ModelAndView("/login");
		
    	// 로그인 정보 확인
    	if(loginMember != null && loginMember.getId() != null) {
	    	mv = new ModelAndView("/general/schedule");
	    	mv.addObject("member", loginMember);

	    	// 메뉴 목록
	    	mv.addObject("menuList", getMenu());
	    	
	    	// 오늘 날짜 Set
	    	mv.addObject("today", getToday());
    	}

		return mv;

	}

	
	@RequestMapping(value="/login.do",  method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
    		  @ModelAttribute("member") Member member) throws Exception{

		Member loginMember = new Member();
		loginMember = searchMember(request);

		Member resultMember = new Member();

    	ModelAndView mv = new ModelAndView("/login");
		if(loginMember == null) {
			loginMember = new Member();
			loginMember.setId(request.getParameter("id"));
			loginMember.setPw(request.getParameter("pw"));
			resultMember = memberService.selectMember(loginMember);

	    	if(resultMember != null && (loginMember.getId().toString().equals(resultMember.getId().toString()))){
		    	// 접속자 정보
	    		mv = new ModelAndView("/general/schedule");
		    	mv.addObject("member", resultMember);

		    	// 메뉴 목록
		    	mv.addObject("menuList", getMenu());

		    	// 오늘 날짜 Set
		    	mv.addObject("today", getToday());
		    	
		    	//session저장
		    	request.getSession().setAttribute("id", resultMember.id.toString());
	    	}
	    	
		} else {
	    	mv = new ModelAndView("/general/schedule");
	    	mv.addObject("member", loginMember);

	    	// 메뉴 목록
	    	mv.addObject("menuList", getMenu());
	    	// 오늘 날짜 Set
	    	mv.addObject("today", getToday());

		}
	
		return generalController.searchSchedule(request, null);

    }
	
	public List<Menu> getMenu() throws Exception {
		return menuService.selecMenuList();
	}
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Integer> getToday() throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		Calendar cal = Calendar.getInstance();
		
		map.put("year", cal.get(Calendar.YEAR));
		map.put("month", cal.get(Calendar.MONTH)+1);
		map.put("date", cal.get(Calendar.DATE));
		map.put("dayOfWeek", cal.get(Calendar.DAY_OF_WEEK));
		map.put("dayOfWeekInMonth", cal.get(Calendar.DAY_OF_WEEK_IN_MONTH));

		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.YEAR, cal.get(Calendar.YEAR));
		cal1.set(Calendar.MONTH, cal.get(Calendar.MONTH));
		cal1.set(Calendar.DATE, 1);

		map.put("firstDayOfWeek", cal1.get(Calendar.DAY_OF_WEEK));
		map.put("lastDateOfMonth", cal1.getActualMaximum(Calendar.DATE));
		
		cal1.set(Calendar.DATE, cal1.getActualMaximum(Calendar.DATE));
		map.put("lastDayOfWeek", cal1.get(Calendar.DAY_OF_WEEK));
		
		return map;
	}
	
	public HashMap<String, Integer> getToday(String year, String month) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		Calendar cal = Calendar.getInstance();
		
		map.put("year", Integer.parseInt(year));
		map.put("month", Integer.parseInt(month));
		map.put("date", cal.get(Calendar.DATE));

		Calendar cal1 = Calendar.getInstance();
		cal1.set(Calendar.YEAR, Integer.parseInt(year));
		cal1.set(Calendar.MONTH, Integer.parseInt(month)-1);
		cal1.set(Calendar.DATE, 1);

		map.put("firstDayOfWeek", cal1.get(Calendar.DAY_OF_WEEK));
		map.put("lastDateOfMonth", cal1.getActualMaximum(Calendar.DATE));
		
		cal1.set(Calendar.DATE, cal1.getActualMaximum(Calendar.DATE));
		map.put("lastDayOfWeek", cal1.get(Calendar.DAY_OF_WEEK));

		
		return map;
	}
	
	
	/*
	 * 
	 */
	private Member searchMember(HttpServletRequest request) throws Exception {
    	
		HttpSession session  =  request.getSession();
		String sessionId = (String)session.getAttribute("id"); 

		Member result = new Member();
		result.setIsAdmin(false);
		result = memberService.selectMemberById(sessionId);
    	
    	return result;
    }
}
