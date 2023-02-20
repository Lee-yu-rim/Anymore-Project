package com.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ARReplyVO {
	private Long bno; // 원글 번호
	private String id; // 사용자 아이디
	private Long rno; // 댓글 번호
	private String reply; // 댓글
	private Date replydate; // 댓글 작성일
	private Date updatedate; // 댓글 수정일
}
