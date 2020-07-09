package kr.com.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.com.dao.LoginDao;

@Service("loginService")
public class LoginServiceImpl  implements LoginService{

	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	public int loginCheck(HttpServletRequest request) {
		int dataChect = 0;
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("id", loginId);
		loginInfo.put("pw", loginPw);
		
		//아이디 체크
		Map<String, String> check = loginDao.idCheck(loginInfo);
		if(null == check) {
			dataChect = 1;
		}else {
			//비밀번호 체크
			Map<String, String> check2 = loginDao.pwCheck(loginInfo);
			if(null == check2) {
				dataChect = 2;
			}else {
				dataChect = 3;
			}
		}
		return dataChect;
	}
}
