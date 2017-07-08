package immovables.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import immovables.domain.Member;

@Repository
public class MemberRepositoryImpl  extends AbstractDAO implements MemberRepository{

	@Autowired
	private	SqlSession session;
	
	@Override
	public List<Member> selectMemberList() throws Exception {
		
		return session.selectList("Member.selectMemberList");
	}

	@Override
	public Integer insertMember(Member member) throws Exception {
		return session.insert("Member.insert", member);
	}

	@Override
	public Integer updateMember(Member member) throws Exception {
		return session.update("Member.update", member);
	}

	@Override
	public Integer deleteMember(Member member) throws Exception {
		return session.delete("Member.delete", member);
	}

	@Override
	public Member selectMember(Member member) throws Exception {
		return session.selectOne("Member.selectMember", member);
	}

}
