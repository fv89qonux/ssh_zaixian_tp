package com.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.user.model.Users;

public class UsersDAO extends HibernateDaoSupport implements IUsersDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> findAllUsers() {
		try {
			String queryString = "from Users order by id asc";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Override
	public void addUser(Users user) {
		try {
			getHibernateTemplate().save(user);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Override
	public void updateUser(Users user) {
		try {
			getHibernateTemplate().update(user);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Override
	public void deleteUser(Users user) {
		try {
			getHibernateTemplate().delete(user);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public Users findUserByUsername(String username) {
		List<Users> list = null;
		try {
			String queryString = "from Users where username='" + username + "'order by id asc";
			list = getHibernateTemplate().find(queryString);
			if(list.size() != 0 || list != null){
				return list.get(0);
			}else
				return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<Users> findUsers(final String keyword, final int start, final int length, String orderColumn, String orderDir) {
		final String queryString = "from Users where id like '%"
				+ keyword
				+ "%' or username like '%"
				+ keyword
				+ "%' or password like '%"
				+ keyword
				+ "%' or realname like '%"
				+ keyword
				+ "%' or age like '%"
				+ keyword
				+ "%' or sex like '%"
				+ keyword
				+ "%' or phone like '%"
				+ keyword
				+ "%' or role like '%"
				+ keyword
				+ "%' or remark like '%"
				+ keyword
				+ "%' order by "
				+ orderColumn + " "
				+ orderDir;
		return (List) super.getHibernateTemplate().execute(
				new HibernateCallback() {
					// 重写其doInHibernate方法返回一个object对象，
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// 创建query对象
						Query query = session.createQuery(queryString);
						// 返回其执行了分布方法的list
						return query.setFirstResult(start)
								.setMaxResults(length).list();
					}
				});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> getUsersFiltered(String keyword) {
		String queryString = "from Users where id like '%"
				+ keyword
				+ "%' or username like '%"
				+ keyword
				+ "%' or password like '%"
				+ keyword
				+ "%' or realname like '%"
				+ keyword
				+ "%' or age like '%"
				+ keyword
				+ "%' or sex like '%"
				+ keyword
				+ "%' or phone like '%"
				+ keyword
				+ "%' or role like '%"
				+ keyword
				+ "%' or remark like '%"
				+ keyword
				+ "%' order by id asc";

		return this.getHibernateTemplate().find(queryString);
	}

}
