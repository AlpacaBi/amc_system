package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.UserDao;
import entity.User;

@Controller @Scope("prototype")
public class CreateUserAction {
	private User user;
	private String did;
	private int isIE;
	@Resource private UserDao ud;
	
	public String create() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(user.getName().equals("")||user.getEmail().equals("")||did.equals("0")){
			out.print("empty");
	    	return null;
		}
		String regex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";  
	    Pattern   p   =   Pattern.compile(regex);  
	    Matcher   m   =   p.matcher(user.getEmail());
	    if(!m.find()){
	    	out.print("email");
	    	return null;
	    }
	    Pattern pattern = Pattern.compile("[0-9]*");
        Matcher match = pattern.matcher(user.getWorkphone());
        if(!match.matches()){
        	out.print("wp");
        	return null;
        }
        match = pattern.matcher(user.getMobilephone());
        if(!match.matches()){
        	out.print("mp");
        	return null;
        }
        
        String name;
        if(isIE == 1){
			name = new String(user.getName().getBytes("ISO-8859-1"),"gbk");
		}
		else{
			name = new String(user.getName().getBytes("ISO-8859-1"),"utf-8");
		}
		user.setName(name);
		System.out.println(name);
        ud.add(user, Integer.valueOf(did));
        out.print("suc");
		return null;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}
	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
}
