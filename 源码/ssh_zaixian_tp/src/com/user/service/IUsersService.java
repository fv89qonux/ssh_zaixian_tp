package com.user.service;

import java.util.List;

import com.user.model.Users;

public interface IUsersService {
	
	public Users login(String userNo, String password);
	
	public abstract List<Users> findAllUsers();
	
	public abstract void addUser(Users user);

	public abstract void updateUser(Users user);

	public abstract void deleteUserByUsername(String username);

	public abstract String findPasswordByUsername(String username);
	
	public abstract String findRoleByUsername(String username);

	public abstract List<Users> findUsersByKeyword(String keyword, int start, int length, String orderColumn, String orderDir);

	public abstract int getUsersFiltered(String keyword);
	
}
