package com.supportforme.biz.hashtag;

import java.util.List;

public interface HashtagService {
		
	public int insertHashtag(HashtagDTO dto);
	
	public List<HashtagDTO> getHashtags(HashtagDTO dto);
	
	public int deleteHashtag(HashtagDTO dto);
}
