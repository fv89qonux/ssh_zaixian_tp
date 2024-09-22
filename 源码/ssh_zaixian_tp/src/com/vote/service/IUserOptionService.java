package com.vote.service;

import org.json.JSONObject;

public interface IUserOptionService {
	
	// 发布投票
	public abstract String publishVote(Integer id, Integer subjectId, Integer userId);
	public abstract JSONObject findVotedSubjectByUserId(int userId);

	
}
