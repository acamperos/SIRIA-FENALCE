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
 * SeedsTypes generated by hbm2java
 */
@Entity
@Table(name="seeds_types"
    ,catalog="madr_bd13"
)
public class SeedsTypes  implements java.io.Serializable {


     private Integer idSeeTyp;
     private String nameSeeTyp;
     private boolean statusSeeTyp;

    public SeedsTypes() {
    }

	
    public SeedsTypes(String nameSeeTyp, boolean statusSeeTyp) {
        this.nameSeeTyp = nameSeeTyp;
        this.statusSeeTyp = statusSeeTyp;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_see_typ", unique=true, nullable=false)
    public Integer getIdSeeTyp() {
        return this.idSeeTyp;
    }
    
    public void setIdSeeTyp(Integer idSeeTyp) {
        this.idSeeTyp = idSeeTyp;
    }
    
    @Column(name="name_see_typ", nullable=false, length=45)
    public String getNameSeeTyp() {
        return this.nameSeeTyp;
    }
    
    public void setNameSeeTyp(String nameSeeTyp) {
        this.nameSeeTyp = nameSeeTyp;
    }
    
    @Column(name="status_see_typ", nullable=false)
    public boolean isStatusSeeTyp() {
        return this.statusSeeTyp;
    }
    
    public void setStatusSeeTyp(boolean statusSeeTyp) {
        this.statusSeeTyp = statusSeeTyp;
    }

}


