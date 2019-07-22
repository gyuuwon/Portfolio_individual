package net.koreate.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import net.koreate.service.UserService;
import net.koreate.vo.LoginDTO;
import net.koreate.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	UserService us;
	

	@GetMapping("/signIn")
	public String signIn() {
		return "/user/signIn";
	}
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "/user/signUp";
	}
	
	@PostMapping("/signUpPost")
	
	public String signUpPost(UserVO vo, RedirectAttributes rttr) throws Exception{
		System.out.println("signPost UserVO" + vo);
		us.signUp(vo);
		rttr.addFlashAttribute("message","회원가입 성공");
		return "redirect:/user/signIn";
	}
	
	@PostMapping("/signInPost")
	public ModelAndView signInPost(LoginDTO dto, ModelAndView mav) {
		mav.addObject("loginDTO", dto);
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@PostMapping("/uIdCheck")
	@ResponseBody
	public boolean uIdCheck(String u_id) throws Exception{
		boolean isCheckId = false;
		System.out.println(u_id);
		String umail = u_id.substring(0,(u_id.indexOf("@")));
		
		String umailVendor = u_id.substring(u_id.indexOf("@")+1);
		
		System.out.println(umail +"//"+umailVendor);
		
		Map<String,String> paramMap = new HashMap<>();
		paramMap.put("umail", umail);
		paramMap.put("umailVendor", umailVendor);
		
		UserVO uv = us.uIdCheck(paramMap);
		
		if(uv == null) {
			isCheckId = true;
		}
		return isCheckId;
	}
	
	
	
	@GetMapping("/signOut")
	public String signOut(HttpSession session, HttpServletRequest request, HttpServletResponse response,@CookieValue(name="signInCookie",required=false) Cookie signInCookie) {
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
			
			Cookie cookie = WebUtils.getCookie(request, "signInCookie");
			if(cookie != null) {
				System.out.println("signInCookie key : " + signInCookie.getName());
				System.out.println("signInCookie value : " + signInCookie.getValue());
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(signInCookie);
			}
		}
		return "redirect:/";
	}
}
