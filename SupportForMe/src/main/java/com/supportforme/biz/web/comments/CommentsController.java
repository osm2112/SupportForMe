package com.supportforme.biz.web.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.comments.CommentsDTO;
import com.supportforme.biz.comments.CommentsService;

@Controller
public class CommentsController {

	@Autowired
	CommentsService commentsService;
	
	//댓글조회
	@RequestMapping("getCommentsList")
	@ResponseBody
	public List<CommentsDTO> getCommentsList(CommentsDTO dto) {
		return commentsService.getCommentsList(dto);
	}
	//답글조회
	@RequestMapping("getReplyCommentsList")
	@ResponseBody
	public List<CommentsDTO> getReplyCommentsList(CommentsDTO dto){
		return commentsService.getReplyCommentsList(dto);
	}
	//댓글 입력
	@RequestMapping("insertComments")
	@ResponseBody
	public CommentsDTO insertComments(CommentsDTO dto) {
		commentsService.insertComments(dto);
		return commentsService.getComments(dto);
	}
	//답글 입력
	@RequestMapping("insertReplyComments")
	@ResponseBody
	public CommentsDTO insertReplyComments(CommentsDTO dto) {
		commentsService.insertReplyComments(dto);
		return commentsService.getComments(dto);
	}
	//댓글수정
	@RequestMapping("updateComments")
	@ResponseBody
	public CommentsDTO updateComments(CommentsDTO dto) {
		commentsService.updateComments(dto);
		return commentsService.getComments(dto);
	}
	//답글수정
	@RequestMapping("updateReplyComments")
	@ResponseBody
	public CommentsDTO updateReplyComments(CommentsDTO dto) {
		commentsService.updateReplyComments(dto);
		return commentsService.getComments(dto);
	}
	//댓글삭제
	@RequestMapping("deleteComments")
	@ResponseBody
	public CommentsDTO deleteComments(CommentsDTO dto) {
		commentsService.deleteComments(dto);
		return dto;
	}
	//답글삭제
	@RequestMapping("deleteReplyComments")
	@ResponseBody
	public CommentsDTO deleteReplyComments(CommentsDTO dto) {
		commentsService.deleteReplyComments(dto);
		return dto;
	}
	
}
