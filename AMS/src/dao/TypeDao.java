package dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import entity.Type;

import util.HibernateUtil;

@Service
public class TypeDao {
	@Resource private HibernateUtil util;
	
	public void add(Type tp){
		util.add(tp);
	}
	
	public void delete(Integer id){
		util.delete(util.get(Type.class, id));
	}
	
	public void update(Type tp){
		util.update(tp);
	}
	
	@SuppressWarnings("unchecked")
	public List search(String str){
		String hql = "from Type t where t.typename like ?";
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%"+str+"%");
		return query.list();
	}
}
