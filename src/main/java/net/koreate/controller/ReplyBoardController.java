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

import net.koreate.service.BoardService;
import net.koreate.util.SearchCriteria;
import net.koreate.vo.BoardVO;

@Controller
@RequestMapping("/sboard/*")
public class ReplyBoardController {
	
	@Inject
	BoardService service;
	
	@GetMapping("register")
	public String registerGET() {
		return "sboard/register";
	}
	
	@PostMapping("register")
	public String registerPost(BoardVO board) throws Exception{
		System.out.println("registerPost : " + board);
		service.registReply(board);
		return "redirect:/sboard/listReply";
	}

	@GetMapping("listReply")
	public String listReply(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		 List<BoardVO> list =  service.listReplyCriteria(cri);
		model.addAttribute("list",list);
		System.out.println("list : "+list);
		System.out.println(cri);
		model.addAttribute("pageMaker", service.getPageMaker(cri));
		System.out.println(service.getPageMaker(cri));
		return "sboard/listReply";
	}
	
	@GetMapping("readPage")
	public String readPage(SearchCriteria cri, @RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		System.out.println("readPage : " + cri);
		service.updateCnt(bno);
		rttr.addAttribute("bno", bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/sboard/read";
	}
	
	@GetMapping("read")
	public String readPage(@ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam("bno") int bno) throws Exception {
		System.out.println("read : " + cri);
		model.addAttribute("boardVO", service.readReply(bno));
		model.addAttribute("prevBoard", service.prevBoard(bno, cri));
		model.addAttribute("nextBoard", service.nextBoard(bno, cri));
		return "sboard/readPage";
	}
	
	@GetMapping("modifyPage")
	public String modifyPage(@RequestParam("bno") int bno, Model model) throws Exception{
		model.addAttribute("boardVO", service.readReply(bno));
		return "sboard/modifyPage";
	}
	
	@PostMapping("modifyPage")
	public String modifyPage(BoardVO vo, RedirectAttributes rttr) throws Exception {
		System.out.println("modifyPage : " + vo);
		service.modify(vo);
		rttr.addAttribute("bno", vo.getBno());
		return "redirect:/sboard/read";
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("bno") int bno) throws Exception {
		service.remove(bno);
		return "redirect:/sboard/listReply";
	}
	
	@GetMapping("replyRegister")
	public String replyRegister(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		System.out.println("답글 작성 페이지 요청" + bno + "cri : " + cri);
		model.addAttribute("boardVO", service.readReply(bno));
		
		return "sboard/replyRegister";
	}
	
	@PostMapping("replyRegister")
	public String replyRegister(SearchCriteria cri, BoardVO board, RedirectAttributes rttr) throws Exception {
		System.out.println("답글 등록 요청");
		System.out.println("board : " + board);
		
		service.replyRegister(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/sboard/listReply";
	}
	
	
	



}
