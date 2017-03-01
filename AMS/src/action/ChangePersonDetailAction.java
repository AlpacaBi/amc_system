package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import dao.PersonDao;
import entity.Admin;

@Controller @Scope("prototype")
public class ChangePersonDetailAction {
	private Integer dp;
	private String email;
	private String wp;
	private String mp;
	@Resource private PersonDao cpd;
	
	public String change() throws IOException{
		String regex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";  
	    Pattern   p   =   Pattern.compile(regex);  
	    Matcher   m   =   p.matcher(email);
	    ServletResponse response = ServletActionContext.getResponse();
		HttpSession session = ServletActionContext.getRequest().getSession();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
	    if(!m.find()){
	    	out.print("email");
	    	return null;
	    }
	    Pattern pattern = Pattern.compile("[0-9]*");
        Matcher match = pattern.matcher(wp);
        if(!match.matches()){
        	out.print("wp");
        	return null;
        }
        match = pattern.matcher(mp);
        if(!match.matches()){
        	out.print("mp");
        	return null;
        }
        if(dp == 0){
        	out.print("dp");
        	return null;
        }
        Admin admin = (Admin)session.getAttribute("admin");
        admin = cpd.update(dp, email, wp, mp, admin);
        session.setAttribute("admin", admin);
        out.print("suc");
		return null;
	}
	
	
	public Integer getDp() {
		return dp;
	}

	public void setDp(Integer dp) {
		this.dp = dp;
	}


	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWp() {
		return wp;
	}
	public void setWp(String wp) {
		this.wp = wp;
	}
	public String getMp() {
		return mp;
	}
	public void setMp(String mp) {
		this.mp = mp;
	}
	
	
}
