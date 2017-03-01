package dao;

import java.sql.Timestamp;

import javax.annotation.Resource;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import entity.Admin;
import util.HibernateUtil;

@Service
public class LoginDao {
	@Resource private HibernateUtil util;
	
	public Admin login(Admin admin){
		Session session = util.getSession();
		Criteria criteria = session.createCriteria(Admin.class);
		criteria.add(Restrictions.eq("username", admin.getUsername()));
		criteria.add(Restrictions.eq("password", admin.getPassword()));
		Admin u = (Admin) criteria.uniqueResult();
		return u;
	}
	
	public void update(Admin admin){
		admin.setLogincount(admin.getLogincount() + 1);
		admin.setLasttime(new Timestamp(System.currentTimeMillis()));
		util.update(admin);
	}
}
