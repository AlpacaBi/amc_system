package dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import entity.Department;

import util.HibernateUtil;

@Service
public class DepartmentDao {
	@Resource private HibernateUtil util;
	
	public void add(Department dp){
		util.add(dp);
	}
	
	public void delete(Integer id){
		util.delete(util.get(Department.class, id));
	}
	
	public void update(Department dp){
		util.update(dp);
	}
	
	@SuppressWarnings("unchecked")
	public List search(String str){
		String hql = "from Department d where d.dpname like ?";
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%"+str+"%");
		return query.list();
	}
}
