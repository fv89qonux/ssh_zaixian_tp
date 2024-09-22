package com.vote.service;

import java.util.List;

import com.vote.dao.IOptionDAO;
import com.vote.model.Option;

public class OptionService implements IOptionService {

	private IOptionDAO optionDAO;
	
	@Override
	public List<Option> findAllOption() {
		List<Option> list = null;
		try {
			String hql = "from Option order by id asc";
			list = optionDAO.findList(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list == null || list.size() == 0) {
			return null;
		} else
			return list;
	}

	@Override
	public void addOption(Option option) {
		try {
			optionDAO.merge(option);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOption(Option option) {
		try {
			optionDAO.merge(option);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOptionById(int id) {
		try {
			String hql = " from Option o where o.id='" + id + "' ";
            String delhql = " delete Option where id='" + id + "' ";
            if(optionDAO.findOne(hql) != null){
            	optionDAO.deleteWithHql(delhql);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteOptionsBySubjectId(int subjectId) {
		try {
			String hql = " from Option o where o.subjectId='" + subjectId + "' ";
            String delhql = " delete Option where subjectId='" + subjectId + "' ";
            if(optionDAO.findOne(hql) != null){
            	optionDAO.deleteWithHql(delhql);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Option> findOptionByKeyword(String keyword, int start, int length, String orderColumn, String orderDir) {
		final String queryString = "from Option where optionId like '%"
			+ keyword
			+ "%' or subjectId like '%"
			+ keyword
			+ "%' or optionContent like '%"
			+ keyword
			+ "%' or remark like '%"
			+ keyword
			+ "%' order by "
			+ orderColumn + " "
			+ orderDir;
		return optionDAO.findForDatatables(queryString, start, length);
	}

	@Override
	public int getOptionFiltered(String keyword) {
		String queryString = "from Option where optionId like '%"
				+ keyword
				+ "%' or subjectId like '%"
				+ keyword
				+ "%' or optionContent like '%"
				+ keyword
				+ "%' or remark like '%"
				+ keyword
				+ "%' order by id asc";
		int resultlength = (optionDAO.getFilteredForDatatables(queryString)).size();
		return resultlength;
	}

	@Override
	public List<Option> findOptionsBySubjectId(Integer subjectId) {
		List<Option> list = null;
		try {
			String hql = "from Option where subjectId = '" + subjectId + "' order by id asc";
			list = optionDAO.findList(hql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list == null || list.size() == 0) {
			return null;
		} else
			return list;
	}
	
	public IOptionDAO getOptionDAO() {
		return optionDAO;
	}

	public void setOptionDAO(IOptionDAO optionDAO) {
		this.optionDAO = optionDAO;
	}

}
