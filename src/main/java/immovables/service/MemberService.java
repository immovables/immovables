package immovables.service;

import java.util.List;

import immovables.domain.Member;

public interface MemberService {

	List<Member> selectMemberList() throws Exception;
	
	Member	selectMember(Member member) throws Exception;
	
	Integer insertMember(Member member)throws Exception;
	
	Integer updateMember(Member member) throws Exception;
	
	Integer deleteMember(Member member) throws Exception;
}
