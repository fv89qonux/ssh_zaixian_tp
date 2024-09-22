package com.user.dao;

import java.util.List;

import com.user.model.Users;

public interface IUsersDAO {
	
	public abstract List<Users> findAllUsers();

	public abstract void addUser(Users user);

	public abstract void updateUser(Users user);

	public abstract void deleteUser(Users user);

	public abstract Users findUserByUsername(String username);
	
	public abstract List<Users> findUsers(String keyword, int start, int length, String orderColumn, String orderDir);

	public abstract List<Users> getUsersFiltered(String keyword);

}
