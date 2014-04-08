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
 * MarketsReasons generated by hbm2java
 */
@Entity
@Table(name="markets_reasons"
    ,catalog="madr_bd11"
)
public class MarketsReasons  implements java.io.Serializable {


     private Integer idMarRea;
     private Boolean keyMarRea;
     private String reasonMarRea;

    public MarketsReasons() {
    }

    public MarketsReasons(Boolean keyMarRea, String reasonMarRea) {
       this.keyMarRea = keyMarRea;
       this.reasonMarRea = reasonMarRea;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_mar_rea", unique=true, nullable=false)
    public Integer getIdMarRea() {
        return this.idMarRea;
    }
    
    public void setIdMarRea(Integer idMarRea) {
        this.idMarRea = idMarRea;
    }
    
    @Column(name="key_mar_rea")
    public Boolean getKeyMarRea() {
        return this.keyMarRea;
    }
    
    public void setKeyMarRea(Boolean keyMarRea) {
        this.keyMarRea = keyMarRea;
    }
    
    @Column(name="reason_mar_rea", length=45)
    public String getReasonMarRea() {
        return this.reasonMarRea;
    }
    
    public void setReasonMarRea(String reasonMarRea) {
        this.reasonMarRea = reasonMarRea;
    }

}


