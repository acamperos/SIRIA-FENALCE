package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * WetSoils generated by hbm2java
 */
@Entity
@Table(name="wet_soils")
public class WetSoils  implements java.io.Serializable {


     private Integer idWeSo;
     private String nameWeSo;
     private Boolean statusWeSo;
     private IdiomCountry countryWeSo;

    public WetSoils() {
    }
    
    public WetSoils(Integer idWeSo) {
       this.idWeSo = idWeSo;
    }

    public WetSoils(String nameWeSo, Boolean statusWeSo) {
       this.nameWeSo = nameWeSo;
       this.statusWeSo = statusWeSo;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_we_so", unique=true, nullable=false)
    public Integer getIdWeSo() {
        return this.idWeSo;
    }
    
    public void setIdWeSo(Integer idWeSo) {
        this.idWeSo = idWeSo;
    }
    
    @Column(name="name_we_so", length=45)
    public String getNameWeSo() {
        return this.nameWeSo;
    }
    
    public void setNameWeSo(String nameWeSo) {
        this.nameWeSo = nameWeSo;
    }
    
    @Column(name="status_we_so")
    public Boolean getStatusWeSo() {
        return this.statusWeSo;
    }
    
    public void setStatusWeSo(Boolean statusWeSo) {
        this.statusWeSo = statusWeSo;
    }
    
    @ManyToOne
    @JoinColumn(name="country_we_so")
    public IdiomCountry getCountryWeSo() {
        return this.countryWeSo;
    }
    
    public void setCountryWeSo(IdiomCountry countryWeSo) {
        this.countryWeSo = countryWeSo;
    }

}


