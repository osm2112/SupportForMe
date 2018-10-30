package com.supportforme.biz.project.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.comments.CommentsDTO;
import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectDetailPageService;

@Service
public class ProjectDetailPageServiceImpl implements ProjectDetailPageService {

	@Autowired ProjectDetailPageDAO projectDetailPageDAO;
	
	@Override
	public ProjectDTO getProjectDetail(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectDetail(dto);
	}

	@Override
	public List<HashtagDTO> getProjectHashtags(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectHashtags(dto);
	}

	@Override
	public InvestDTO getProjectAboutInvest(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectAboutInvest(dto);
	}
	
	@Override
	public String getProjectProgressRate(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectProgressRate(dto);
	}
	
	@Override
	public List<PresentDTO> getProjectPresents(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectPresents(dto);
	}

	@Override
	public List<CommentsDTO> getComments(ProjectDTO dto) {
		return projectDetailPageDAO.getComments(dto);
	}

	@Override
	public List<CommentsDTO> getReplyComments(CommentsDTO dto) {
		return projectDetailPageDAO.getReplyComments(dto);
	}

	
}
