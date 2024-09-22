package com.vote.dao;

import com.base.dao.BaseDao;
import com.vote.model.Option;

public class OptionDAO extends BaseDao<Option> implements IOptionDAO {
	public OptionDAO() {
		super(Option.class);
	}
}
