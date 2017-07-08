package first.sample.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.sample.service.SampleService;
import immovables.domain.Member;
import immovables.service.MemberService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleService")
	private SampleService sampleService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/main1.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardList");
    	
    	List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
		
    	
		List<Member> list1 = memberService.selectMemberList();
    	
    	mv.addObject("list", list);
    	mv.addObject("list1", list1);
    	
    	return mv;
    }
}
