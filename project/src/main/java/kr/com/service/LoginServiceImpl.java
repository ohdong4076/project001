package kr.com.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
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

	//사용자 정보
	@Override
	public Map<String, String> userInfo(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String loginId = request.getParameter("loginId");
		String loginPw = request.getParameter("loginPw");
		
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("id", loginId);
		loginInfo.put("pw", loginPw);
		
		return loginDao.userInfo(loginInfo);
	}

	//게시글가져오기
	@Override
	public List<Map<String, Object>> listBoard(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String levl = null; //검색유형
		String cho = null; //결재상태
		String searchText = null; //검색어
		String strDate = null; //시작일
		String endDate = null; //종료일
		
		levl = request.getParameter("levl");
		cho = request.getParameter("cho");
		searchText = request.getParameter("searchText");
		
		strDate = request.getParameter("strDate");
		endDate = request.getParameter("endDate");
		
		Map<String, String> searchInfo = new HashMap<String, String>();
		if(null != levl) {
			if("01".equals(levl)){
				searchInfo.put("name", searchText); //작성자검색
			}else if("02".equals(levl)){
				searchInfo.put("cho_name", searchText); //결재자검색
			}else {
				searchInfo.put("subject", searchText); //제목 + 내용 검색
				searchInfo.put("content", searchText); //제목 + 내용 검색
			}
		}
		searchInfo.put("cho_state", cho); //결재상태
		searchInfo.put("strDate", strDate); //시작일
		searchInfo.put("endDate", endDate); //종료일
		
		return loginDao.listBoard(searchInfo);
	}
}
