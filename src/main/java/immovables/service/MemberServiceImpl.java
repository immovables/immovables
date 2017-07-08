package immovables.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import immovables.dao.MemberRepository;
import immovables.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());
	
		@Autowired
		private MemberRepository dao;
	
		@Override
		public List<Member> selectMemberList() throws Exception {
		
		return dao.selectMemberList();
	}

		@Override
		public Integer insertMember(Member member) throws Exception {
			return dao.insertMember(member);
		}

		@Override
		public Integer updateMember(Member member) throws Exception {
			return dao.updateMember(member);
		}

		@Override
		public Integer deleteMember(Member member) throws Exception {
			return dao.deleteMember(member);
		}

		@Override
		public Member selectMember(Member member) throws Exception {
			return dao.selectMember(member);
		}

		@Override
		public Member selectMemberById(Member member) throws Exception {
			return dao.selectMemberById(member);
		}

}
