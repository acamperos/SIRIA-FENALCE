package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * MonitoringTypes generated by hbm2java
 */
@Entity
@Table(name="monitoring_types"
    ,catalog="madr_bd13"
)
public class MonitoringTypes  implements java.io.Serializable {


     private Integer idMonTyp;
     private String nameMonTyp;
     private boolean statusMonTyp;

    public MonitoringTypes() {
    }

	
    public MonitoringTypes(String nameMonTyp, boolean statusMonTyp) {
        this.nameMonTyp = nameMonTyp;
        this.statusMonTyp = statusMonTyp;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_mon_typ", unique=true, nullable=false)
    public Integer getIdMonTyp() {
        return this.idMonTyp;
    }
    
    public void setIdMonTyp(Integer idMonTyp) {
        this.idMonTyp = idMonTyp;
    }
    
    @Column(name="name_mon_typ", nullable=false, length=45)
    public String getNameMonTyp() {
        return this.nameMonTyp;
    }
    
    public void setNameMonTyp(String nameMonTyp) {
        this.nameMonTyp = nameMonTyp;
    }
    
    @Column(name="status_mon_typ", nullable=false)
    public boolean isStatusMonTyp() {
        return this.statusMonTyp;
    }
    
    public void setStatusMonTyp(boolean statusMonTyp) {
        this.statusMonTyp = statusMonTyp;
    }

}


