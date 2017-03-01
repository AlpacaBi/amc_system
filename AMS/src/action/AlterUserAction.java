package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import dao.UserDao;
import entity.User;

@Controller @Scope("prototype")
public class AlterUserAction {
	private Integer did;
	private User user;
	private int isIE;
	@Resource private UserDao ud;
	
	public String alter() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(did == 0 || user.getEmail().equals("")||user.getName().equals("")){
			out.print("empty");
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
		ud.update(user, did);
		out.print("suc");
		return null;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public int getIsIE() {
		return isIE;
	}

	public void setIsIE(int isIE) {
		this.isIE = isIE;
	}
	
}
