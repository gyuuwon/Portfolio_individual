package net.koreate.dao;

import java.util.List;

import net.koreate.util.SearchCriteria;
import net.koreate.vo.NoticeBoardVO;

public interface NoticeBoardDAO {
	
	// 게시물 등록
	void register(NoticeBoardVO board) throws Exception;
	
	// 검색된 게시물 항목 중 페이징 처리된 게시물 리스트
	List<NoticeBoardVO> listPageCriteria(SearchCriteria cri) throws Exception;
	
	// 검색된 게시물 총 개수
	int listPageCount(SearchCriteria cri) throws Exception;
	
	// 조회수 업데이트
	void updateCnt(int n_bno) throws Exception;
	
	// 게시물 정보
	NoticeBoardVO readReply(int n_bno) throws Exception;

	// 게시글 삭제
	void delete(int n_bno) throws Exception;

	// 게시물 정보 수정
	void update(NoticeBoardVO vo) throws Exception;

	List<NoticeBoardVO> listAll(SearchCriteria cri)  throws Exception;
	
}
