package kr.com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {

	public int loginCheck(HttpServletRequest request);

	public Map<String, String> userInfo(HttpServletRequest request);

	public List<Map<String, Object>> listBoard(HttpServletRequest request);

}
