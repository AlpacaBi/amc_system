package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.AdminDao;
import entity.Admin;

@Controller @Scope("prototype")
public class CreateAdminAction {
	private Admin admin;
	private String confirm;
	private String did;
	private int isIE;
	@Resource private AdminDao ad;
	
	public String create() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Admin adm = (Admin)ServletActionContext.getRequest().getSession().getAttribute("admin");
		if(adm.getPermission()!=0){
			return null;
		}
		if(admin.getUsername().equals("")||admin.getName().equals("")||admin.getEmail().equals("")||did.equals("0")||confirm.equals("")||admin.getPassword().equals("")){
			out.print("empty");
	    	return null;
		}
		if(admin.getUsername().length()<6||admin.getPassword().length()<6){
			out.print("length");
	    	return null;
		}
		if(!admin.getPassword().equals(confirm)){
			out.print("same");
	    	return null;
		}
		String regex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";  
	    Pattern   p   =   Pattern.compile(regex);  
	    Matcher   m   =   p.matcher(admin.getEmail());
	    if(!m.find()){
	    	out.print("email");
	    	return null;
	    }
	    Pattern pattern = Pattern.compile("[0-9]*");
        Matcher match = pattern.matcher(admin.getWorkphone());
        if(!match.matches()){
        	out.print("wp");
        	return null;
        }
        match = pattern.matcher(admin.getMobilephone());
        if(!match.matches()){
        	out.print("mp");
        	return null;
        }
        String name, username;
		if(isIE == 1){
			name = new String(admin.getName().getBytes("ISO-8859-1"),"gbk");
			username = new String(admin.getUsername().getBytes("ISO-8859-1"),"gbk");
		}
		else{
			name = new String(admin.getName().getBytes("ISO-8859-1"),"utf-8");
			username = new String(admin.getUsername().getBytes("ISO-8859-1"),"utf-8");
		}
		
		/********************************************************/
		admin.setName(name);
		admin.setUsername(username);
        admin.setPermission(1);
        admin.setLogincount(0);
        admin.setLasttime(new Timestamp(System.currentTimeMillis()));
		ad.add(admin, Integer.valueOf(did));//梦幻位置
		out.print("suc");
		/********************************************************/
		return null;
	}
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
	
}
