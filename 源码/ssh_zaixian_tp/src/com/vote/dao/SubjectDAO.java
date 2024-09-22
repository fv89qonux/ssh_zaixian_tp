package com.vote.dao;

import com.base.dao.BaseDao;
import com.vote.model.Subject;

public class SubjectDAO extends BaseDao<Subject> implements ISubjectDAO {
	public SubjectDAO() {
		super(Subject.class);
	}
}
