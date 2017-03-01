package action;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

@Controller
public class Exit {
	public String exit(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return "login";
	}
}
