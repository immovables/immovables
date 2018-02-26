package immovables.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import immovables.domain.Member;
import immovables.domain.Menu;
import immovables.domain.TelephoneSurvey;
import immovables.service.MemberService;
import immovables.service.MenuService;
import immovables.service.TelephoneSurveyService;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired	private MemberService memberService;
	@Autowired	private MenuService menuService;
	@Autowired	private LoginController loginController;
	@Autowired	private TelephoneSurveyService telephoneSurveyService;

	
	@RequestMapping(value="/registerMember.do",  method = RequestMethod.GET)
    public ModelAndView newMember(HttpServletRequest request) throws Exception{

		Member loginMember = new Member();
		loginMember = hasAdminAuthority(request);
    	ModelAndView mv = new ModelAndView("../../index");
		
    	// 로그인 정보로 관리권한 확인
    	if(loginMember.getIsAdmin()) {
	    	mv = new ModelAndView("/admin/registerMember");	    	
	    	mv.addObject("member", loginMember);

	    	List<Menu> menuList = menuService.selecMenuList();
	    	mv.addObject("menuList", menuList);
		}

    	return mv;
    }

	@RequestMapping(value="/registerMember.do",  method = RequestMethod.POST)
    public ModelAndView registerMember(HttpServletRequest request, HttpServletResponse response,
  		  @ModelAttribute("member") Member member) throws Exception{

		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = hasAdminAuthority(request);
		// TODO 로그인 정보 불일치 시 이동 url
    	ModelAndView mv = new ModelAndView("");

    	// 로그인 정보로 관리권한 확인
    	if(loginMember.getIsAdmin()) {

    		// NEW 직원 정보
    		Member registerMember = new Member();
    		registerMember.setId(request.getParameter("id"));
    		registerMember.setPw(request.getParameter("pw"));
    		registerMember.setName(request.getParameter("name"));
    		String adminCheckValue = request.getParameter("isAdmin");
    		
    		if(adminCheckValue.equals("true")) registerMember.setIsAdmin(true);
    		
    		// NEW 직원등록
    		memberService.insertMember(registerMember);
    		
    		mv = new ModelAndView("/admin/registerMember");
    	}

    	return mv;
    }


	@RequestMapping(value="/updateMember.do",  method = RequestMethod.GET)
    public ModelAndView updateMember(HttpServletRequest request, HttpServletResponse response,
  		  @ModelAttribute("member") Member member) throws Exception{

		Member loginMember = new Member();
		loginMember = hasAdminAuthority(request);
    	ModelAndView mv = new ModelAndView("../../index");
		
    	// 로그인 정보로 관리권한 확인
    	if(loginMember.getIsAdmin()) {
	    	mv = new ModelAndView("/admin/registerMember");
	    	mv.addObject("members", loginMember);
		}
		
		return mv;
    }

	
    public ModelAndView memberList() throws Exception{
		List<Member> members = memberService.selectMemberList();
    	ModelAndView mv = new ModelAndView("/admin/memberList");
    	mv.addObject("members", members);
		return mv;
    }
    
    
    public ModelAndView menuList() throws Exception{
		List<Member> members = memberService.selectMemberList();
    	ModelAndView mv = new ModelAndView("/admin/memberList");
    	mv.addObject("members", members);
		return mv;
    }

	public Member hasAdminAuthority(HttpServletRequest request) throws Exception {
    	
		HttpSession session  =  request.getSession();
		String sessionId = (String)session.getAttribute("id");

		Member result = new Member();
		result.setIsAdmin(false);
		result.setIsDelete(true);
		if(sessionId!=null && sessionId !="guest") {
			result = memberService.selectMemberById(sessionId);
		}
    	
    	return result;
    }
	
	/***
	 * 
	 * @param request
	 * @param response
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/registerMenu.do",  method = RequestMethod.GET)
	public ModelAndView registerMenu(HttpServletRequest request, HttpServletResponse response,
	  		  @ModelAttribute("menu") Menu menu) throws Exception{
		
		// 로그인 정보 확인
		Member loginMember = new Member();
		loginMember = hasAdminAuthority(request);
		
    	// 로그인 정보로 관리권한 확인
    	ModelAndView mv = new ModelAndView("../../index");
    	if(loginMember.getIsAdmin()) {
    		// 메뉴 등록화면
    		mv = new ModelAndView("/admin/registerMenu");
    		mv.addObject("loginMember", loginMember);
    		
	    	List<Menu> menuList = menuService.selecMenuList();
	    	mv.addObject("menuList", menuList);
    		
    	}
		return mv;
	}
	
	

}
