package net.koreate.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.service.NoticeBoardService;
import net.koreate.util.SearchCriteria;
import net.koreate.vo.NoticeBoardVO;

@Controller
@RequestMapping("/board/*")
public class NoticeBoardController {
	
	@Inject
	NoticeBoardService service;
	
	@GetMapping("register")
	public String registerGET() {
		return "board/register";
	}
	
	@PostMapping("register")
	public String registerPost(NoticeBoardVO board) throws Exception {
		System.out.println("registerPost : " + board);
		service.registReply(board);
		return "redirect:/board/listPage";
	}

	@GetMapping("listPage")
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		 List<NoticeBoardVO> list =  service.listPageCriteria(cri);
		model.addAttribute("list",list);
		System.out.println("list : "+list);
		System.out.println(cri);
		model.addAttribute("pageMaker", service.getPageMaker(cri));
		System.out.println(service.getPageMaker(cri));
		return "board/listPage";
	}
	
	@GetMapping("readPage")
	public String readPage(SearchCriteria cri, @RequestParam("n_bno") int n_bno, RedirectAttributes rttr) throws Exception {
		System.out.println("readPage : " + cri);
		service.updateCnt(n_bno);
		rttr.addAttribute("n_bno", n_bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/read";
	}
	
	@GetMapping("read")
	public String readPage(@ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam("n_bno") int n_bno) throws Exception {
		System.out.println("read : " + cri);
		model.addAttribute("noticeBoardVO", service.readReply(n_bno));
		model.addAttribute("prevBoard", service.prevBoard(n_bno, cri));
		model.addAttribute("nextBoard", service.nextBoard(n_bno, cri));
		return "board/readPage";
	}
	
	@GetMapping("modifyPage")
	public String modifyPage(@RequestParam("n_bno") int n_bno, Model model) throws Exception {
		model.addAttribute("noticeBoardVO", service.readReply(n_bno));
		return "board/modifyPage";
	}
	
	@PostMapping("modifyPage")
	public String modifyPage(NoticeBoardVO vo, RedirectAttributes rttr) throws Exception {
		System.out.println("modifyPage : " + vo);
		service.modify(vo);
		rttr.addAttribute("n_bno", vo.getN_bno());
		return "redirect:/board/read";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("n_bno") int n_bno) throws Exception {
		service.remove(n_bno);
		return "redirect:/board/listPage";
	}
}
