package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * SeedsInoculations generated by hbm2java
 */
@Entity
@Table(name="seeds_inoculations")
public class SeedsInoculations  implements java.io.Serializable {


     private int idSeeIno;
     private String nameSeeIno;
     private IdiomCountry countrySeeIno;

    public SeedsInoculations() {
    }

	
    public SeedsInoculations(int idSeeIno, String nameSeeIno) {
        this.idSeeIno = idSeeIno;
        this.nameSeeIno = nameSeeIno;
    }
   
     @Id 
    
    @Column(name="id_see_ino", unique=true, nullable=false)
    public int getIdSeeIno() {
        return this.idSeeIno;
    }
    
    public void setIdSeeIno(int idSeeIno) {
        this.idSeeIno = idSeeIno;
    }
    
    @Column(name="name_see_ino", nullable=false, length=45)
    public String getNameSeeIno() {
        return this.nameSeeIno;
    }
    
    public void setNameSeeIno(String nameSeeIno) {
        this.nameSeeIno = nameSeeIno;
    }
    
    @ManyToOne
    @JoinColumn(name="country_see_ino")
    public IdiomCountry getCountrySeeIno() {
        return this.countrySeeIno;
    }
    
    public void setCountrySeeIno(IdiomCountry countrySeeIno) {
        this.countrySeeIno = countrySeeIno;
    }

}


