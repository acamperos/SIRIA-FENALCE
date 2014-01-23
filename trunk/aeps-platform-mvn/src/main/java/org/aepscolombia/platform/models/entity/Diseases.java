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
 * Diseases generated by hbm2java
 */
@Entity
@Table(name="diseases"
    ,catalog="madr_bd10"
)
public class Diseases  implements java.io.Serializable {


     private Integer idDis;
     private String nameDis;
     private boolean statusDis;

    public Diseases() {
    }

	
    public Diseases(String nameDis, boolean statusDis) {
        this.nameDis = nameDis;
        this.statusDis = statusDis;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_dis", unique=true, nullable=false)
    public Integer getIdDis() {
        return this.idDis;
    }
    
    public void setIdDis(Integer idDis) {
        this.idDis = idDis;
    }
    
    @Column(name="name_dis", nullable=false, length=100)
    public String getNameDis() {
        return this.nameDis;
    }
    
    public void setNameDis(String nameDis) {
        this.nameDis = nameDis;
    }
    
    @Column(name="status_dis", nullable=false)
    public boolean isStatusDis() {
        return this.statusDis;
    }
    
    public void setStatusDis(boolean statusDis) {
        this.statusDis = statusDis;
    }

}


