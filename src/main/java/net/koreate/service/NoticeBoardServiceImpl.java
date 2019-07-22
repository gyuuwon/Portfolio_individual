package net.koreate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.dao.NoticeBoardDAO;
import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;
import net.koreate.vo.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Inject
	NoticeBoardDAO dao;

	@Override
	public void registReply(NoticeBoardVO board) throws Exception {
		dao.register(board);
		System.out.println("register 작업완료");
	}

	@Override
	public List<NoticeBoardVO> listPageCriteria(SearchCriteria cri) throws Exception {
		List<NoticeBoardVO> list = dao.listPageCriteria(cri);
		
		return list;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listPageCount(cri));
		return pageMaker;
	}

	@Override
	public void updateCnt(int n_bno) throws Exception {
		dao.updateCnt(n_bno);		
	}

	@Override
	public NoticeBoardVO readReply(int n_bno) throws Exception {
		return dao.readReply(n_bno);
	}

	@Override
	@Transactional
	public void remove(int n_bno) throws Exception {
		dao.delete(n_bno);
	}

	@Override
	@Transactional
	public void modify(NoticeBoardVO vo) throws Exception {
		dao.update(vo);
	}


	@Override
	public NoticeBoardVO nextBoard(int n_bno, SearchCriteria cri) throws Exception {
		List<NoticeBoardVO> list = dao.listAll(cri);
		System.out.println(list.size());

		// 0에 가까울수록 새글
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getN_bno() == n_bno) {
				if (i > 0) {
					n_bno = list.get(i - 1).getN_bno();
					break;
				}
			}
		}
		return dao.readReply(n_bno);
	}

	@Override
	public NoticeBoardVO prevBoard(int bno, SearchCriteria cri) throws Exception {
		List<NoticeBoardVO> list = dao.listAll(cri);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getN_bno() == bno) {
				if (list.size() - 1 >= i + 1) {
					bno = list.get(i + 1).getN_bno();
					break;
				}
			}
		}
		return dao.readReply(bno);
	}

}
