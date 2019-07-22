package net.koreate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tour/*")
public class TourController {

	@GetMapping("program")
	public void program() {}
	
	@GetMapping("tourData")
	public void toruData() {}
	
	@GetMapping("lodge")
	public void lodge() {}
	
	@GetMapping("flights")
	public void flights() {}
}
