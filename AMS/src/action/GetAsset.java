package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;


import dao.AssetDao;
import entity.Assets;

@Controller
public class GetAsset {
	private int id;
	@Resource private AssetDao ad;
	
	public String get() throws IOException{
		ServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Assets asset = ad.get(id);
		String str = "<div class='tabledetail'><div><ul><li>编号: ";
		str += asset.getAid();
		str += "</li><li>资产名: " + asset.getAssetname();
		str += "</li><li>类别: " + asset.getType().getTypename();
		if(!asset.getVersion().equals(""))
			str += "</li><li>型号: " + asset.getVersion();
		else
			str += "</li><li>型号: 暂无信息";
		if(!asset.getManufacturer().equals(""))
			str += "</ul><ul></li><li>生产厂家: " + asset.getManufacturer();
		else
			str += "</ul><ul></li><li>生产厂家: 暂无信息";
		if(asset.getManufacturedate() != null)
			str += "</li><li>出厂日期: " + asset.getManufacturedate().toString().substring(0, 10);
		else
			str += "</li><li>出厂日期: 暂无信息";
		str += "</li><li>购买时间: " + asset.getBuydate().toString().substring(0, 10);
		str += "</li><li>原值: " + asset.getPrice() + " RMB";
		if(asset.getUsestate() == 1)
			str += "</ul><ul></li><li>使用情况: 未分配";
		if(asset.getUsestate() == 2)
			str += "</ul><ul></li><li>使用情况: 已分配";
		if(asset.getUsestate() == 3)
			str += "</ul><ul></li><li>使用情况: 送修 <span class='sxwb' relid='"+asset.getId()+"'>点此送修完毕</span>";
		if(asset.getDeprecition() == 1)
			str += "</li><li>是否折旧: 是";
		if(asset.getDeprecition() == 2)
			str += "</li><li>是否折旧: 否";
		if(asset.getDepartment() != null)
			str += "</li><li>部门: " + asset.getDepartment().getDpname();
		else
			str += "</li><li>部门: 暂无信息";
		if(asset.getUser() != null)
			str += "</li><li>使用者: " + asset.getUser().getName();
		else
			str += "</li><li>使用者: 暂无信息";
		str += "</li></ul></div></div>";
		out.print(str);
		return null;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
