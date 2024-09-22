package com.vote.service;

import java.util.List;

import com.vote.model.Option;

public interface IOptionService {
	
	public abstract List<Option> findAllOption();
	
	public abstract void addOption(Option option);

	public abstract void updateOption(Option option);

	public abstract void deleteOptionById(int id);

	public abstract List<Option> findOptionByKeyword(String keyword, int start, int length, String orderColumn, String orderDir);

	public abstract int getOptionFiltered(String keyword);
	
	// 根据subjectId删除对应的投票选项
	public abstract void deleteOptionsBySubjectId(int subjectId);
	
	// 根据subjectId查找对应的投票选项
	public abstract List<Option> findOptionsBySubjectId(Integer subjectId);
	
}
