package entity;

import java.sql.Timestamp;


public class Test {
	private Integer id;
	private Timestamp testdate;
	private String name;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getTestdate() {
		return this.testdate;
	}

	public void setTestdate(Timestamp testdate) {
		this.testdate = testdate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}