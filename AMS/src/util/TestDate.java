package util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.AssetDao;

import entity.Assets;
import entity.Bsend;


public class TestDate {

	public static void main(String[] args) throws ParseException {
		ApplicationContext acx = new ClassPathXmlApplicationContext("beans.xml");
		HibernateUtil hu = (HibernateUtil) acx.getBean("hibernateUtil");
//		Query query = hu.getQuery("from Test t where TO_DAYS(NOW()) - TO_DAYS(t.testdate)>=30");
//		List<Object> l = query.list();
//		System.out.println(l.size());
//		User u = (User)hu.get(User.class, 1);
//		System.out.println(u.getDepartment().getDpname());
//		Test t = new Test();
//		t.setName("b");
//		t.setId(4);
//		t.setTestdate(new Timestamp(System.currentTimeMillis()));
//		hu.delete(t);
//		Date date = DateFormat.getDateInstance().parse("2010-01-03");
//		System.out.println(new Timestamp(date.getTime()));;
//		Query query = hu.getQuery("from User u where u.name like '%i%' ");
//		List l = query.list();
//		JSONArray json = JSONArray.fromObject(l);
//		System.out.println(json.toString());
//		String hql = "from Assets a where a.assetname like ? and a.type = ? ";
//		String temp[] = hql.split("[.]");
//		System.out.println(temp.length);
//		for(int i = 1; i < temp.length; i ++){
//			if(temp[i].split("[?]").length==2)
//				System.out.println(temp[i].split("[ ]")[0]);
//			else
//				System.out.print("price1 price2");
//		}
//		
//		String s = "2010-01-30 0000";
//		System.out.println(s.substring(0, 10));
//		String hql = "from Bsend a where TO_DAYS(NOW()) - TO_DAYS(a.bsenddate)<=30";
//		Query query = hu.getQuery(hql);
//		List bsends = query.list();
//		List assets = new ArrayList();
//		System.out.println(bsends.size());
//		if(bsends.size() > 0){
//			for(int i = 0; i < bsends.size(); i++){
//				Bsend b = (Bsend) bsends.get(i);
//				System.out.println(b.getAssets().getId());
//				assets.add(hu.get(Assets.class, b.getAssets().getId()));
//			}
//		}
		Date date1 = DateFormat.getDateInstance().parse("2011-04-14");
		Timestamp time1 = new Timestamp(date1.getTime());
		Date date2 = DateFormat.getDateInstance().parse("2011-04-31");
		Timestamp time2 = new Timestamp(date2.getTime());
		String hql = "from Assets a where TO_DAYS(a.buydate)>=TO_DAYS(?) and TO_DAYS(a.buydate)<=TO_DAYS(?)";
		Query query = hu.getQuery(hql);
		query.setTimestamp(0, time1);
		query.setTimestamp(1, time2);
		System.out.println(query.list().size());
	}

}
