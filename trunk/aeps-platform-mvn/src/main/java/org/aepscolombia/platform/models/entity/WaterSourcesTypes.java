package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA


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
 * WaterSourcesTypes generated by hbm2java
 */
@Entity
@Table(name="water_sources_types"
    ,catalog="madr_bd11"
)
public class WaterSourcesTypes  implements java.io.Serializable {


     private Integer idWatSouTyp;
     private String nameWatSouTyp;

    public WaterSourcesTypes() {
    }

    public WaterSourcesTypes(String nameWatSouTyp) {
       this.nameWatSouTyp = nameWatSouTyp;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_wat_sou_typ", unique=true, nullable=false)
    public Integer getIdWatSouTyp() {
        return this.idWatSouTyp;
    }
    
    public void setIdWatSouTyp(Integer idWatSouTyp) {
        this.idWatSouTyp = idWatSouTyp;
    }
    
    @Column(name="name_wat_sou_typ", length=45)
    public String getNameWatSouTyp() {
        return this.nameWatSouTyp;
    }
    
    public void setNameWatSouTyp(String nameWatSouTyp) {
        this.nameWatSouTyp = nameWatSouTyp;
    }

}


