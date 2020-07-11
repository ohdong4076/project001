package kr.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.com.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/main")
	public String main(Locale locale, Model model) {
		return "main";
	}
	
	/**
	 * 로그인 체크
	 * @throws IOException 
	 */
	@RequestMapping(value = "/loginCkeck", method = RequestMethod.POST)
	public String loginCkeck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		int check = loginService.loginCheck(request);
		String tt = null;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(check == 1){
			out.println("<script>alert('등록되지 않은 사용자입니다.'); location.href='http://localhost:9090/';</script>");
			out.flush();
		}else if(check == 2) {
			out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='http://localhost:9090/';</script>");
			out.flush();
		}else {
			model.addAttribute("userDate",check);
			tt = "home";
		}
		return tt;
	}
}
