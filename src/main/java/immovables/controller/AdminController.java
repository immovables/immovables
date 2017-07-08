package immovables.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	@RequestMapping(value="/login.do",  method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
    		  @ModelAttribute("member") Member member) throws Exception{

		Member loginMember = new Member();
		loginMember.setId(request.getParameter("id"));
		loginMember.setPw(request.getParameter("pw"));
		
		Member resultMember = memberService.selectMember(loginMember);
		Member resultMember1 = memberService.selectMember(loginMember);
	
    	ModelAndView mv = new ModelAndView("/index");
		if(resultMember.getId().toString().equals(loginMember.getId().toString())){
	    	mv = new ModelAndView("/admin/memberList");
	    	mv.addObject("member", resultMember);
		}
	
		return mv;

    }

    public ModelAndView memberList() throws Exception{

		List<Member> members = memberService.selectMemberList();
		
		
    	ModelAndView mv = new ModelAndView("/admin/memberList");
    	mv.addObject("members", members);
		return mv;

    }


}
