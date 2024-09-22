package com.base.dao;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.base.model.Page;
import com.base.vo.Parameter;

public class BaseDao<T> extends HibernateDaoSupport implements IBaseDao<T> {

	private int BATCH_MAX_ROW = 5;

	private Class<T> entityClass;

	public BaseDao() {
	}

	public BaseDao(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	@Override
	public void save(T entity) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		session.save(entity);
		session.getTransaction().commit();
	}
	
	@Override
	public void merge(T entity) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		session.merge(entity);
		session.getTransaction().commit();
	}

	@Override
	public int batchSave(List<T> list) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		for (int i = 0; i < list.size(); ++i) {
			session.save(list.get(i));
			if (i % BATCH_MAX_ROW == 0) {
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
		session.getTransaction().commit();
		return list.size();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void deleteAll(Collection entities) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		for (Object entity : entities) {
			session.delete(entity);
		}
		session.getTransaction().commit();
	}

	@Override
	public void delete(T entity) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		session.delete(entity);
		session.getTransaction().commit();
	}

	@Override
	public void deleteWithHql(String hql) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	@Override
	public void update(T entity) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		session.update(entity);
		session.getTransaction().commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public T getOne(int id) throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		Object returnObject = session.get(entityClass, id);
		session.getTransaction().commit();

		return (T) returnObject;
	}

	@Override
	public T findOne(String hql) throws Exception {
		return findOne(hql, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findOne(final String hql, final Parameter parameter)
			throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		setParameter(query, parameter);
		Object returnObject = query.setMaxResults(1).uniqueResult();
		session.getTransaction().commit();

		return (T) returnObject;
	}

	@Override
	public List<T> findList(final String hql) throws Exception {
		return findList(hql, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findList(final String hql, final Parameter parameter)
			throws Exception {
		Session session = this.getSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		setParameter(query, parameter);
		List<T> returnList = query.list();
		session.getTransaction().commit();

		return returnList;
	}

	/**
	 * 
	 * @param query
	 * @param parameter
	 *            set sql parameters
	 */
	private void setParameter(Query query, Parameter parameter) {
		if (parameter != null) {
			Set<String> keySet = parameter.keySet();
			for (String string : keySet) {
				Object value = parameter.get(string);
				if (value instanceof Collection<?>) {
					query.setParameterList(string, (Collection<?>) value);
				} else if (value instanceof Object[]) {
					query.setParameterList(string, (Object[]) value);
				} else {
					query.setParameter(string, value);
				}
			}
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<T> findPage(int currentPage, int pageSize, String queryHql,
			String countHql, Object[] values) throws HibernateException,
			SQLException {
		Session session = this.getSession();
		session.beginTransaction();
		Query query = session.createQuery(queryHql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		// 如果pageSize<=0则查询全部，用于打印导出等...
		if (pageSize > 0) {
			query.setFirstResult(pageSize * (currentPage - 1));// 设置要查询的结果集的开始索引位置
			query.setMaxResults(pageSize);// 设置要查询的结果集的数量
		}
		List<T> returnList = query.list();
		session.getTransaction().commit();
		long totalRecords = findCount(countHql, values);

		return new Page<T>(returnList, totalRecords, currentPage, pageSize);
	}

	@Override
	public Page<T> findPage(int currentPage, int pageSize, String queryHql,
			String countHql) throws HibernateException, SQLException {
		return findPage(currentPage, pageSize, queryHql, countHql, null);
	}

	@Override
	public long findCount(String hql) {
		return findCount(hql, null);
	}

	@Override
	public long findCount(String hql, Object[] values) {
		Session session = this.getSession();
		session.beginTransaction();
		Query query = session.createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		Long returnLong = (Long) query.setMaxResults(1).uniqueResult();
		session.getTransaction().commit();

		return returnLong;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public List<T> findForDatatables(final String hql, final int start, final int length) {
		return (List) super.getHibernateTemplate().execute(
				new HibernateCallback() {
					// 重写其doInHibernate方法返回一个object对象，
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// 创建query对象
						Query query = session.createQuery(hql);
						// 返回其执行了分布方法的list
						return query.setFirstResult(start)
								.setMaxResults(length).list();
					}
				});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getFilteredForDatatables(String hql) {
		return this.getHibernateTemplate().find(hql);
	}
	
}
