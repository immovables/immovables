package immovables.controller;

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
import immovables.service.MemberService;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;

	
	@RequestMapping(value="/index.do",  method = RequestMethod.GET)
    public ModelAndView loginView(HttpServletRequest request, HttpServletResponse response,
    		  @ModelAttribute("member") Member member) throws Exception{

		HttpSession session  =  request.getSession();
		String sessionId = (String)session.getAttribute("id");

		ModelAndView mv = new ModelAndView("../../index");
		if(sessionId != null && sessionId !="geust") {
	    	mv = new ModelAndView("/admin/memberList");
	    	
	    	Member m = new Member();
	    	m.setId(sessionId);
			Member loginMember = new Member();
			loginMember = memberService.selectMemberById(m);
			session.setAttribute("id", sessionId);
			
			if(loginMember != null) {
		    	mv.addObject("member", loginMember);
			}
		
		}else {
			session.setAttribute("id", "guest");
		}

		return mv;

	}

	
	@RequestMapping(value="/login.do",  method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
    		  @ModelAttribute("member") Member member) throws Exception{

		HttpSession session  =  request.getSession();
		String sessionId = (String)session.getAttribute("id");

		Member loginMember = new Member();
		Member resultMember = new Member();

    	ModelAndView mv = new ModelAndView("../../index");
		if(sessionId == null||sessionId=="guest") {
			loginMember.setId(request.getParameter("id"));
			loginMember.setPw(request.getParameter("pw"));
			resultMember = memberService.selectMember(loginMember);

			
	    	if(resultMember != null && loginMember.getId().toString().equals(resultMember.getId().toString())){
		    	mv = new ModelAndView("/admin/memberList");
		    	mv.addObject("member", resultMember);

				//session저장
				session.setAttribute("id", resultMember.id.toString());

	    	}
	    	
		}else{
	    	mv = new ModelAndView("/admin/memberList");
	    	resultMember.setId(sessionId);
	    	mv.addObject("member", resultMember);

		}
		
	
	
		return mv;

    }

	@RequestMapping(value="/registerMember.do",  method = RequestMethod.GET)
    public ModelAndView newMember() throws Exception{

    	ModelAndView mv = new ModelAndView("/admin/registerMember");
		return mv;

    }

	@RequestMapping(value="/registerMember.do",  method = RequestMethod.POST)
    public ModelAndView registerMember(HttpServletRequest request, HttpServletResponse response,
  		  @ModelAttribute("member") Member member) throws Exception{

		Member registerMember = new Member();
		registerMember.setId(request.getParameter("id"));
		registerMember.setPw(request.getParameter("pw"));
		registerMember.setName(request.getParameter("name"));
		String adminCheckValue = request.getParameter("isAdmin");
		if(adminCheckValue.equals("yes")) {
			registerMember.setIsAdmin(true);
		}
		
		memberService.insertMember(registerMember);

    	ModelAndView mv = new ModelAndView("/admin/registerMember");
		return mv;

    }


	@RequestMapping(value="/updateMember.do",  method = RequestMethod.GET)
    public ModelAndView updateMember(HttpServletRequest request, HttpServletResponse response,
  		  @ModelAttribute("member") Member member) throws Exception{

		
		HttpSession session  =  request.getSession();
		String sessionId = (String)session.getAttribute("id");

		Member resultMember = new Member();
		Member loginMember = new Member();
		loginMember.setId(sessionId);
		loginMember.setPw("");
		resultMember = memberService.selectMember(loginMember);
		
		
    	ModelAndView mv = new ModelAndView("/admin/registerMember");
    	mv.addObject("members", resultMember);
		return mv;

    }

	
    public ModelAndView memberList() throws Exception{

		List<Member> members = memberService.selectMemberList();
		
		
    	ModelAndView mv = new ModelAndView("/admin/memberList");
    	mv.addObject("members", members);
		return mv;

    }


}
