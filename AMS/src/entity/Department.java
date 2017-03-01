package entity;

public class Department {
	private Integer id;
	private String dpname;
	private String description;
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDpname() {
		return this.dpname;
	}

	public void setDpname(String dpname) {
		this.dpname = dpname;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}