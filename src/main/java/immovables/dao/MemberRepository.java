package immovables.dao;

import java.util.List;

import immovables.domain.Member;

public interface MemberRepository {

	List<Member> selectMemberList() throws Exception;
	
	Member	selectMember(Member member) throws Exception;

	Member	selectMemberById(Member member) throws Exception;

	Integer insertMember(Member member)throws Exception;
	
	Integer updateMember(Member member) throws Exception;
	
	Integer deleteMember(Member member) throws Exception;
}
