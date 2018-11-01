package com.supportforme.biz.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HashtagServiceImpl implements HashtagService{
	
	@Autowired HashtagDAO hashtagDAO;

	@Override
	public int insertHashtag(HashtagDTO dto) {
		return hashtagDAO.insertHashtag(dto);
	}

	@Override
	public List<HashtagDTO> getHashtags(HashtagDTO dto) {
		return hashtagDAO.getHashtags(dto);
	}

	@Override
	public int deleteHashtag(HashtagDTO dto) {
		return hashtagDAO.deleteHashtag(dto);
	}

}
