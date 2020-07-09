package kr.com.dao;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("loginDao")
public class LoginDao {
	
	@Autowired
	private SqlSession sqlSession;

	public Map<String, String> idCheck(Map<String, String> loginInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("idCheck",loginInfo);
	}

	public Map<String, String> pwCheck(Map<String, String> loginInfo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("pwCheck",loginInfo);
	}
}
