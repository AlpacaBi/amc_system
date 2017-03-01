package dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import util.HibernateUtil;

import entity.Admin;
import entity.Department;

@Service
public class PersonDao {
	@Resource private HibernateUtil util;
	
	public void update(Admin admin){
		util.update(admin);
	}
	
	public Admin update(Integer dp, String email, String wp, String mp, Admin admin){
		admin.setEmail(email);
		admin.setWorkphone(wp);
		admin.setMobilephone(mp);
		Department depart = (Department)util.get(Department.class, dp);
		admin.setDepartment(depart);
		util.update(admin);//
		return admin;
	}
}
