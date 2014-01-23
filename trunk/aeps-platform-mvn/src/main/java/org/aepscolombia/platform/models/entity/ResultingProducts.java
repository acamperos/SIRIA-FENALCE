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
 * ResultingProducts generated by hbm2java
 */
@Entity
@Table(name="resulting_products"
    ,catalog="madr_bd10"
)
public class ResultingProducts  implements java.io.Serializable {


     private Integer idResPro;
     private String nameResPro;
     private Boolean statusResPro;

    public ResultingProducts() {
    }

    public ResultingProducts(String nameResPro, Boolean statusResPro) {
       this.nameResPro = nameResPro;
       this.statusResPro = statusResPro;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_res_pro", unique=true, nullable=false)
    public Integer getIdResPro() {
        return this.idResPro;
    }
    
    public void setIdResPro(Integer idResPro) {
        this.idResPro = idResPro;
    }
    
    @Column(name="name_res_pro", length=45)
    public String getNameResPro() {
        return this.nameResPro;
    }
    
    public void setNameResPro(String nameResPro) {
        this.nameResPro = nameResPro;
    }
    
    @Column(name="status_res_pro")
    public Boolean getStatusResPro() {
        return this.statusResPro;
    }
    
    public void setStatusResPro(Boolean statusResPro) {
        this.statusResPro = statusResPro;
    }

}


