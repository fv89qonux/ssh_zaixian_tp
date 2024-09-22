package com.user.service;

import java.util.List;

import com.user.dao.IUsersDAO;
import com.user.model.Users;

public class UsersService implements IUsersService {

	private IUsersDAO usersDAO;
	
	@Override
	public Users login(String username, String password) {
		Users user = usersDAO.findUserByUsername(username);
		if (null == user) {
			return null;
		}
		if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
			return user;
		}else{
			return null;
		}
	}
	
	@Override
	public List<Users> findAllUsers() {
		List<Users> list = null;
		try {
			list = usersDAO.findAllUsers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list == null || list.size() == 0) {
			return null;
		} else
			return list;
	}

	@Override
	public void addUser(Users user) {
		try {
			usersDAO.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUser(Users user) {
		try {
			usersDAO.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUserByUsername(String username) {
		try {
			Users user = usersDAO.findUserByUsername(username);
			usersDAO.deleteUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String findPasswordByUsername(String username) {
		String password = null;
		try {
			Users user = usersDAO.findUserByUsername(username);
			password = user.getPassword();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}

	@Override
	public String findRoleByUsername(String username) {
		String role = null;
		try {
			Users user = usersDAO.findUserByUsername(username);
			role = user.getRole();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return role;
	}

	@Override
	public List<Users> findUsersByKeyword(String keyword, int start, int length, String orderColumn, String orderDir) {
		return usersDAO.findUsers(keyword, start, length, orderColumn, orderDir);
	}

	@Override
	public int getUsersFiltered(String keyword) {
		int resultlength = (usersDAO.getUsersFiltered(keyword)).size();
		return resultlength;
	}
	
	public IUsersDAO getUsersDAO() {
		return usersDAO;
	}

	public void setUsersDAO(IUsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

}
