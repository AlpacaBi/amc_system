package entity;

import java.sql.Timestamp;

public class Bsend {
	private Integer id;
	private Assets assets;
	private Timestamp bsenddate;
	private Double cost;
	private Integer state;
	private Integer bsendperson;
	private String description;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Assets getAssets() {
		return this.assets;
	}

	public void setAssets(Assets assets) {
		this.assets = assets;
	}

	public Timestamp getBsenddate() {
		return this.bsenddate;
	}

	public void setBsenddate(Timestamp bsenddate) {
		this.bsenddate = bsenddate;
	}

	public Double getCost() {
		return this.cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getBsendperson() {
		return this.bsendperson;
	}

	public void setBsendperson(Integer bsendperson) {
		this.bsendperson = bsendperson;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}