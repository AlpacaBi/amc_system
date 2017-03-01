package entity;

import java.sql.Timestamp;

public class Assets {
     private Integer id;
     private Department department;
     private User user;
     private Type type;
     private String aid;
     private String assetname;
     private String version;
     private String manufacturer;
     private Timestamp manufacturedate;
     private Timestamp buydate;
     private Double price;
     private Integer usestate;
     private Integer deprecition;

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public Type getType() {
        return this.type;
    }
    
    public void setType(Type type) {
        this.type = type;
    }

    public String getAid() {
        return this.aid;
    }
    
    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getAssetname() {
        return this.assetname;
    }
    
    public void setAssetname(String assetname) {
        this.assetname = assetname;
    }

    public String getVersion() {
        return this.version;
    }
    
    public void setVersion(String version) {
        this.version = version;
    }

    public String getManufacturer() {
        return this.manufacturer;
    }
    
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public Timestamp getManufacturedate() {
        return this.manufacturedate;
    }
    
    public void setManufacturedate(Timestamp manufacturedate) {
        this.manufacturedate = manufacturedate;
    }

    public Timestamp getBuydate() {
        return this.buydate;
    }
    
    public void setBuydate(Timestamp buydate) {
        this.buydate = buydate;
    }

    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getUsestate() {
        return this.usestate;
    }
    
    public void setUsestate(Integer usestate) {
        this.usestate = usestate;
    }

    public Integer getDeprecition() {
        return this.deprecition;
    }
    
    public void setDeprecition(Integer deprecition) {
        this.deprecition = deprecition;
    }

}