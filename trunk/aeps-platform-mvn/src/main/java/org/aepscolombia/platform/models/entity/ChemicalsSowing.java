package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * ChemicalsSowing generated by hbm2java
 */
@Entity
@Table(name="chemicals_sowing"
    ,catalog="madr_bd11"
)
public class ChemicalsSowing  implements java.io.Serializable {


     private Integer idCheSow;
     private String nameCheSow;
     private Boolean statusCheSow;

    public ChemicalsSowing() {
    }

    public ChemicalsSowing(String nameCheSow, Boolean statusCheSow) {
       this.nameCheSow = nameCheSow;
       this.statusCheSow = statusCheSow;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_che_sow", unique=true, nullable=false)
    public Integer getIdCheSow() {
        return this.idCheSow;
    }
    
    public void setIdCheSow(Integer idCheSow) {
        this.idCheSow = idCheSow;
    }
    
    @Column(name="name_che_sow", length=45)
    public String getNameCheSow() {
        return this.nameCheSow;
    }
    
    public void setNameCheSow(String nameCheSow) {
        this.nameCheSow = nameCheSow;
    }
    
    @Column(name="status_che_sow")
    public Boolean getStatusCheSow() {
        return this.statusCheSow;
    }
    
    public void setStatusCheSow(Boolean statusCheSow) {
        this.statusCheSow = statusCheSow;
    }

}


