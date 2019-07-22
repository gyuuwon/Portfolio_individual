package net.koreate.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {

	private int n_bno;				// 번호
	private String n_title;			// 제목
	private String n_content;		// 내용
	private String n_writer;		// 작성자
	private Date n_regdate;			// 등록일
	private Date n_updatedate;		// 수정일
	private int n_viewcnt;			// 조회수
	private String n_showboard; 	// 삭제유무
	private int n_uno;				// 작성자	

}
