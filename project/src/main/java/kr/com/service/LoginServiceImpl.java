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
		
		//���̵� üũ
		Map<String, String> check = loginDao.idCheck(loginInfo);
		if(null == check) {
			dataChect = 1;
		}else {
			//��й�ȣ üũ
			Map<String, String> check2 = loginDao.pwCheck(loginInfo);
			if(null == check2) {
				dataChect = 2;
			}else {
				dataChect = 3;
			}
		}
		return dataChect;
	}

	//����� ����
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

	//�Խñ۰�������
	@Override
	public List<Map<String, Object>> listBoard(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String levl = null; //�˻�����
		String cho = null; //�������
		String searchText = null; //�˻���
		String strDate = null; //������
		String endDate = null; //������
		
		levl = request.getParameter("levl");
		cho = request.getParameter("cho");
		searchText = request.getParameter("searchText");
		
		strDate = request.getParameter("strDate");
		endDate = request.getParameter("endDate");
		
		Map<String, String> searchInfo = new HashMap<String, String>();
		if(null != levl) {
			if("01".equals(levl)){
				searchInfo.put("name", searchText); //�ۼ��ڰ˻�
			}else if("02".equals(levl)){
				searchInfo.put("cho_name", searchText); //�����ڰ˻�
			}else {
				searchInfo.put("subject", searchText); //���� + ���� �˻�
				searchInfo.put("content", searchText); //���� + ���� �˻�
			}
		}
		searchInfo.put("cho_state", cho); //�������
		searchInfo.put("strDate", strDate); //������
		searchInfo.put("endDate", endDate); //������
		
		return loginDao.listBoard(searchInfo);
	}
}
