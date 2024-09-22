package com.vote.service;

import java.util.List;

import com.vote.dao.ISubjectDAO;
import com.vote.model.Subject;

public class SubjectService implements ISubjectService {

	private ISubjectDAO subjectDAO;
	
	@Override
	public List<Subject> findAllSubject() {
		List<Subject> list = null;
		try {
			String hql = "from Subject order by id asc";
			list = subjectDAO.findList(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list == null || list.size() == 0) {
			return null;
		} else
			return list;
	}

	@Override
	public void addSubject(Subject subject) {
		try {
			subjectDAO.merge(subject);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateSubject(Subject subject) {
		try {
			subjectDAO.merge(subject);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteSubjectById(int id) {
		try {
			String hql = " from Subject s where s.id='" + id + "' ";
            String delhql = " delete Subject where id='" + id + "' ";
            if(subjectDAO.findOne(hql) != null){
            	subjectDAO.deleteWithHql(delhql);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Subject findSubjectById(int id) {
		Subject subject = new Subject();
		try {
			String hql = " from Subject s where s.id='" + id + "' ";
			subject = subjectDAO.findOne(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return subject;
	}
	
	@Override
	public Subject findSubjectBySubjectName(String subjectName) {
		Subject subject = new Subject();
		try {
			String hql = " from Subject s where s.subjectName='" + subjectName + "' ";
			subject = subjectDAO.findOne(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return subject;
	}


	@Override
	public List<Subject> findSubjectByKeyword(String keyword, int start, int length, String orderColumn, String orderDir) {
		final String queryString = "from Subject where id like '%"
			+ keyword
			+ "%' or subjectName like '%"
			+ keyword
			+ "%' or optionType like '%"
			+ keyword
			+ "%' or optionNum like '%"
			+ keyword
			+ "%' or createTime like '%"
			+ keyword
			+ "%' or remark like '%"
			+ keyword
			+ "%' order by id desc";
		return subjectDAO.findForDatatables(queryString, start, length);
	}

	@Override
	public int getSubjectFiltered(String keyword) {
		String queryString = "from Subject where id like '%"
				+ keyword
				+ "%' or subjectName like '%"
				+ keyword
				+ "%' or optionType like '%"
				+ keyword
				+ "%' or optionNum like '%"
				+ keyword
				+ "%' or createTime like '%"
				+ keyword
				+ "%' or remark like '%"
				+ keyword
				+ "%' order by id asc";
		int resultlength = (subjectDAO.getFilteredForDatatables(queryString)).size();
		return resultlength;
	}

	public ISubjectDAO getSubjectDAO() {
		return subjectDAO;
	}

	public void setSubjectDAO(ISubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}

}
