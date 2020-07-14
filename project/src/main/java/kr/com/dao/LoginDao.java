package kr.com.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	public Map<String, String> userInfo(Map<String, String> loginInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfo",loginInfo);
	}

	public List<Map<String, Object>> listBoard(Map<String, String> searchInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("listBoard", searchInfo);
	}
}
