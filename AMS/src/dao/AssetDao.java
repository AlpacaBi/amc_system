package dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import entity.Assets;
import entity.Bsend;
import entity.Department;
import entity.Type;
import entity.User;

import util.HibernateUtil;

@Service
public class AssetDao {
	@Resource private HibernateUtil util;
	
	public Assets get(Integer id){
		return (Assets)util.get(Assets.class, id);
	}
	
	public void bsend(Integer id, Bsend bsend, Integer uid){
		Assets asset = (Assets)util.get(Assets.class, id);
		bsend.setAssets(asset);
		bsend.setBsendperson(uid);
		bsend.setState(1);
		asset.setUsestate(3);
		util.update(asset);
		util.add(bsend);
	}
	
	public void delete(Integer id){
		util.delete(util.get(Assets.class, id));
	}
	
	@SuppressWarnings("unchecked")
	public void sxwb(Integer id){
		Session session = util.getSession();
		Assets asset = (Assets) util.get(Assets.class, id);
		Query query = session.createQuery("from Bsend b where b.assets=?");
		query.setEntity(0, asset);
		List list = query.list();
		Bsend bsend = (Bsend) list.get(list.size() - 1);
		bsend.setState(2);
		if(asset.getDepartment() != null && asset.getUser() != null)
			asset.setUsestate(2);
		else
			asset.setUsestate(1);
		util.update(asset);
		util.update(bsend);
	}
	
	public void add(Assets asset, Integer typeid, Integer did, Integer uid){
		if(did != 0 && uid != 0 && asset.getUsestate() == 2){
			asset.setDepartment((Department)util.get(Department.class, did));
			asset.setUser((User)util.get(User.class, uid));
		}
		asset.setType((Type)util.get(Type.class, typeid));
		util.add(asset);
	}
	
	public void update(Assets asset, Integer typeid, Integer did, Integer uid){
		asset.setDepartment(null);
		asset.setUser(null);
		if(did != 0 && uid != 0 && asset.getUsestate() == 2){
			asset.setDepartment((Department)util.get(Department.class, did));
			asset.setUser((User)util.get(User.class, uid));
		}
		asset.setType((Type)util.get(Type.class, typeid));
		util.update(asset);
	}
	
	@SuppressWarnings("unchecked")
	public List getNewAssets(){
		String hql = "from Assets a where TO_DAYS(NOW()) - TO_DAYS(a.buydate)<=30";
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List getBsendAssets(){
		String hql = "from Bsend a where TO_DAYS(NOW()) - TO_DAYS(a.bsenddate)<=30";
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		List bsends = query.list();
		List assets = new ArrayList();
		System.out.println(bsends.size());
		if(bsends.size() > 0){
			for(int i = 0; i < bsends.size(); i++){
				Bsend b = (Bsend) bsends.get(i);
				assets.add(i, util.get(Assets.class, b.getAssets().getId()));
			}
		}
		return assets;
	}
	
	@SuppressWarnings("unchecked")
	public List searchNewAssets(Timestamp time1, Timestamp time2){
		String hql = "from Assets a where TO_DAYS(a.buydate)>=TO_DAYS(?) and TO_DAYS(a.buydate)<=TO_DAYS(?)";
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		query.setTimestamp(0, time1);
		query.setTimestamp(1, time2);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List searchBsendAssets(Timestamp time1, Timestamp time2){
		String hql = "from Bsend a where TO_DAYS(a.bsenddate)>=TO_DAYS(?) and TO_DAYS(a.bsenddate)<=TO_DAYS(?)";
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		query.setTimestamp(0, time1);
		query.setTimestamp(1, time2);
		List bsends = query.list();
		List assets = new ArrayList();
		System.out.println(bsends.size());
		if(bsends.size() > 0){
			for(int i = 0; i < bsends.size(); i++){
				Bsend b = (Bsend) bsends.get(i);
				assets.add(i, util.get(Assets.class, b.getAssets().getId()));
			}
		}
		return assets;
	}
	
	@SuppressWarnings("unchecked")
	public List searchByAid(String value, String typeid, String isdep, String isuse, String price1, String price2, String did, String uid){
		String hql = "from Assets a where a.aid like ? ";
		if(!typeid.equals("0"))
			hql += "and a.type = ? ";
		if(!isdep.equals("undefined"))
			hql += "and a.deprecition = ? ";
		if(!isuse.equals("undefined"))
			hql += "and a.usestate = ? ";
		if(!did.equals("0"))
			hql += "and a.department = ? ";
		if(!uid.equals("0"))
			hql += "and a.user = ? ";
		if(!price1.equals("") && !price2.equals(""))
			hql += "and a.price between ? and ? ";
		return this.search(hql, value, typeid, isdep, isuse, price1, price2, did, uid);
	}
	
	@SuppressWarnings("unchecked")
	public List searchByName(String value, String typeid, String isdep, String isuse, String price1, String price2, String did, String uid){
		String hql = "from Assets a where a.assetname like ? ";
		if(!typeid.equals("0"))
			hql += "and a.type = ? ";
		if(!isdep.equals("undefined"))
			hql += "and a.deprecition = ? ";
		if(!isuse.equals("undefined"))
			hql += "and a.usestate = ? ";
		if(!did.equals("0"))
			hql += "and a.department = ? ";
		if(!uid.equals("0"))
			hql += "and a.user = ? ";
		if(!price1.equals("") && !price2.equals(""))
			hql += "and a.price between ? and ? ";
		return this.search(hql, value, typeid, isdep, isuse, price1, price2, did, uid);
	}
	
	@SuppressWarnings("unchecked")
	public List search(String hql, String value, String type, String deprecition, String usestate, String price1, String price2, String department, String user){
		Session session = util.getSession();
		Query query = session.createQuery(hql);
		String str;
		String temp[] = hql.split("[.]");
		query.setString(0, "%"+value+"%");
		for(int i = 0; i < temp.length; i ++){
			str = temp[i].split("[ ]")[0];
			if(str.equals("assetname")){
				query.setString(i-1, "%"+value+"%");
			}
			if(str.equals("type")){
				query.setInteger(i-1, Integer.valueOf(type));
			}
			if(str.equals("deprecition")){
				query.setInteger(i-1, Integer.valueOf(deprecition));
			}
			if(str.equals("usestate")){
				query.setInteger(i-1, Integer.valueOf(usestate));
			}
			if(str.equals("price")){
				query.setDouble(i-1, Double.valueOf(price1));
				query.setDouble(i, Double.valueOf(price2));
			}
			if(str.equals("department")){
				query.setInteger(i-1, Integer.valueOf(department));
			}
			if(str.equals("user")){
				query.setInteger(i-1, Integer.valueOf(user));
			}
		}
		return query.list();
	}
	
}

