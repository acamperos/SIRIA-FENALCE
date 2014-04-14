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
 * Intercropping generated by hbm2java
 */
@Entity
@Table(name="intercropping"
    ,catalog="madr_bd13"
)
public class Intercropping  implements java.io.Serializable {


     private Integer idInt;
     private CropsTypes cropsTypes;
     private ProductionEvents productionEvents;
     private Boolean status;
     private Integer createdBy;

    public Intercropping() {
    }

	
    public Intercropping(CropsTypes cropsTypes, ProductionEvents productionEvents) {
        this.cropsTypes = cropsTypes;
        this.productionEvents = productionEvents;
    }
    public Intercropping(CropsTypes cropsTypes, ProductionEvents productionEvents, Boolean status, Integer createdBy) {
       this.cropsTypes = cropsTypes;
       this.productionEvents = productionEvents;
       this.status = status;
       this.createdBy = createdBy;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_int", unique=true, nullable=false)
    public Integer getIdInt() {
        return this.idInt;
    }
    
    public void setIdInt(Integer idInt) {
        this.idInt = idInt;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="type_crop_int", nullable=false)
    public CropsTypes getCropsTypes() {
        return this.cropsTypes;
    }
    
    public void setCropsTypes(CropsTypes cropsTypes) {
        this.cropsTypes = cropsTypes;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_production_event_int", nullable=false)
    public ProductionEvents getProductionEvents() {
        return this.productionEvents;
    }
    
    public void setProductionEvents(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }
    
    @Column(name="status")
    public Boolean getStatus() {
        return this.status;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    @Column(name="created_by")
    public Integer getCreatedBy() {
        return this.createdBy;
    }
    
    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }




}


