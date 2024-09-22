package com.vote.dao;

import com.base.dao.BaseDao;
import com.vote.model.UserOption;

public class UserOptionDAO extends BaseDao<UserOption> implements IUserOptionDAO {
	public UserOptionDAO() {
		super(UserOption.class);
	}
}
