package dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import entity.Department;
import entity.User;

import util.HibernateUtil;

@Service
public class UserDao {
	@Resource private HibernateUtil util;
	
	public void add(User user, Integer did){
		user.setDepartment((Department)util.get(Department.class, did));
		util.add(user);
	}
	
	public void delete(Integer id){
		util.delete(util.get(User.class, id));
	}
	
	public void update(User user, Integer did){
		user.setDepartment((Department)util.get(Department.class, did));
		util.update(user);
	}
	
	@SuppressWarnings("unchecked")
	public List searchByName(String str1, String str2){
		String hql = "from User u where u.name like ? and u.department=?";
		if(str2 == null || str2.equals("") || str2.equals("0"))
			hql = "from User u where u.name like ?";
		return this.search(hql, str1, str2);
	}
	
	@SuppressWarnings("unchecked")
	public List searchByEmail(String str1, String str2){
		String hql = "from User u where u.email like ? and u.department=?";
		if(str2 == null || str2.equals("") || str2.equals("0"))
			hql = "from User u where u.email like ?";
		return this.search(hql, str1, str2);
	}
	
	@SuppressWarnings("unchecked")
	public List search(String hql, String str1, String str2){
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%"+str1+"%");
		if(hql.split("[?]").length > 1)
			query.setInteger(1, Integer.valueOf(str2));
		return query.list();
	}

}
