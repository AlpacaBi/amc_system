package util;

import java.io.Serializable;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class HibernateUtil {
	@Resource private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.openSession();
	}
	
	public void add(Object obj){
		sessionFactory.getCurrentSession().save(obj);
	}
	
	public void update(Object obj){
		sessionFactory.getCurrentSession().update(obj);
	}
	
	public void delete(Object... objs){
		for(Object obj : objs)
			sessionFactory.getCurrentSession().delete(obj);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Object get(Class clazz, Serializable id){
		return sessionFactory.openSession().get(clazz, id);
	}
	
	public Query getQuery(String hql){
		return sessionFactory.openSession().createQuery(hql);
	}
}
