package immovables.controller;

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
import immovables.service.MemberService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping(value="/login.do",  method = RequestMethod.GET)
    public ModelAndView loginView(HttpServletRequest request, HttpServletResponse response,
    		  @ModelAttribute("member") Member member) throws Exception{
		
		Member loginMember = new Member();
		loginMember = searchMember(request);
    	ModelAndView mv = new ModelAndView("/login");
		
    	// 로그인 정보 확인
    	if(loginMember != null && loginMember.getId() != null) {
	    	mv = new ModelAndView("/admin/memberList");
	    	mv.addObject("member", loginMember);
		}

		return mv;

	}

	
	@SuppressWarnings("null")
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
		    	mv = new ModelAndView("/admin/memberList");
		    	mv.addObject("member", resultMember);
				
		    	//session저장
		    	request.getSession().setAttribute("id", resultMember.id.toString());
	    	}
	    	
		}else{
	    	mv = new ModelAndView("/admin/memberList");
	    	mv.addObject("member", loginMember);

		}
	
		return mv;

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
