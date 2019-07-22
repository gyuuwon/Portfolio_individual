package net.koreate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.dao.BoardDAO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;
import net.koreate.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	BoardDAO dao;

	@Override
	public void registReply(BoardVO board) throws Exception {
		dao.register(board);
		dao.updateOrigin();
		System.out.println("register 작업완료");
	}

	@Override
	public List<BoardVO> listReplyCriteria(SearchCriteria cri) throws Exception {
		List<BoardVO> list = dao.listReplyCriteria(cri);
		
		return list;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listReplyCount(cri));
		return pageMaker;
	}

	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);		
	}

	@Override
	public BoardVO readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	@Transactional
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	@Transactional
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	@Transactional
	public void replyRegister(BoardVO vo) throws Exception {
		dao.updateReply(vo);
		System.out.println("넘어온 값 : " + vo);
		vo.setDepth(vo.getDepth()+1);
		vo.setSeq(vo.getSeq()+1);
		System.out.println("등록된 값 : " + vo);
		dao.replyRegister(vo);
	}
	

	@Override
	public BoardVO nextBoard(int bno, SearchCriteria cri) throws Exception {
		List<BoardVO> list = dao.listAll(cri);
		System.out.println(list.size());

		// 0에 가까울수록 새글
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBno() == bno) {
				if (i > 0) {
					bno = list.get(i - 1).getBno();
					break;
				}
			}
		}
		return dao.readReply(bno);
	}

	@Override
	public BoardVO prevBoard(int bno, SearchCriteria cri) throws Exception {
		List<BoardVO> list = dao.listAll(cri);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getBno() == bno) {
				if (list.size() - 1 >= i + 1) {
					bno = list.get(i + 1).getBno();
					break;
				}
			}
		}
		return dao.readReply(bno);
	}

}
