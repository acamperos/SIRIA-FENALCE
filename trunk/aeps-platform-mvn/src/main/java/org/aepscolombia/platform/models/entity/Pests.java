package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


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
 * Pests generated by hbm2java
 */
@Entity
@Table(name="pests"
    ,catalog="madr_bd13"
)
public class Pests  implements java.io.Serializable {


     private Integer idPes;
     private String namePes;
     private boolean statusPes;

    public Pests() {
    }

	
    public Pests(String namePes, boolean statusPes) {
        this.namePes = namePes;
        this.statusPes = statusPes;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_pes", unique=true, nullable=false)
    public Integer getIdPes() {
        return this.idPes;
    }
    
    public void setIdPes(Integer idPes) {
        this.idPes = idPes;
    }
    
    @Column(name="name_pes", nullable=false, length=100)
    public String getNamePes() {
        return this.namePes;
    }
    
    public void setNamePes(String namePes) {
        this.namePes = namePes;
    }
    
    @Column(name="status_pes", nullable=false)
    public boolean isStatusPes() {
        return this.statusPes;
    }
    
    public void setStatusPes(boolean statusPes) {
        this.statusPes = statusPes;
    }

}


