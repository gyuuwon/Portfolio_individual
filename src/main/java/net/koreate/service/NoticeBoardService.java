package net.koreate.service;

import java.util.List;


import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;
import net.koreate.vo.NoticeBoardVO;

public interface NoticeBoardService {

	// 게시물 작성
	void registReply(NoticeBoardVO board) throws Exception;
	
	// 검색 결과에 따른 페이징 처리된 게시물 리스트
	List<NoticeBoardVO> listPageCriteria(SearchCriteria cri) throws Exception;
	
	// 페이징 블럭 정보
	PageMaker getPageMaker(SearchCriteria cri) throws Exception;
	
	// 조회수 증가
	void updateCnt(int n_bno) throws Exception;
	
	// 게시물 정보
	NoticeBoardVO readReply(int n_bno) throws Exception;
	
	// 게시물 삭제
	void remove(int n_bno) throws Exception;
	
	// 게시물 수정
	void modify(NoticeBoardVO vo) throws Exception;
	
	
	Object prevBoard(int n_bno, SearchCriteria cri)  throws Exception;

	Object nextBoard(int n_bno, SearchCriteria cri)  throws Exception;
}