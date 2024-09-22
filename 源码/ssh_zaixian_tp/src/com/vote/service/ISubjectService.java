package com.vote.service;

import java.util.List;

import com.vote.model.Subject;

public interface ISubjectService {
	
	public abstract List<Subject> findAllSubject();
	
	public abstract void addSubject(Subject subject);

	public abstract void updateSubject(Subject subject);

	public abstract void deleteSubjectById(int id);
	
	public abstract Subject findSubjectById(int id);
	
	public abstract Subject findSubjectBySubjectName(String subjectName);

	public abstract List<Subject> findSubjectByKeyword(String keyword, int start, int length, String orderColumn, String orderDir);

	public abstract int getSubjectFiltered(String keyword);
	
}
