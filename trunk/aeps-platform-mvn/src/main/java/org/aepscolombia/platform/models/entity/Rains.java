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
 * Rains generated by hbm2java
 */
@Entity
@Table(name="rains"
    ,catalog="madr_bd13"
)
public class Rains  implements java.io.Serializable {


     private Integer idRain;
     private ProductionEvents productionEvents;
     private Boolean sowAccordingRain;
     private String sowingMonthsRain;
     private Boolean sowOtherSeasonRain;
     private String monthsOtherSeasonRain;
     private Boolean status;
     private Integer createdBy;

    public Rains() {
    }

	
    public Rains(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }
    public Rains(ProductionEvents productionEvents, Boolean sowAccordingRain, String sowingMonthsRain, Boolean sowOtherSeasonRain, String monthsOtherSeasonRain, Boolean status, Integer createdBy) {
       this.productionEvents = productionEvents;
       this.sowAccordingRain = sowAccordingRain;
       this.sowingMonthsRain = sowingMonthsRain;
       this.sowOtherSeasonRain = sowOtherSeasonRain;
       this.monthsOtherSeasonRain = monthsOtherSeasonRain;
       this.status = status;
       this.createdBy = createdBy;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_rain", unique=true, nullable=false)
    public Integer getIdRain() {
        return this.idRain;
    }
    
    public void setIdRain(Integer idRain) {
        this.idRain = idRain;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_production_event_rain", nullable=false)
    public ProductionEvents getProductionEvents() {
        return this.productionEvents;
    }
    
    public void setProductionEvents(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }
    
    @Column(name="sow_according_rain")
    public Boolean getSowAccordingRain() {
        return this.sowAccordingRain;
    }
    
    public void setSowAccordingRain(Boolean sowAccordingRain) {
        this.sowAccordingRain = sowAccordingRain;
    }
    
    @Column(name="sowing_months_rain", length=50)
    public String getSowingMonthsRain() {
        return this.sowingMonthsRain;
    }
    
    public void setSowingMonthsRain(String sowingMonthsRain) {
        this.sowingMonthsRain = sowingMonthsRain;
    }
    
    @Column(name="sow_other_season_rain")
    public Boolean getSowOtherSeasonRain() {
        return this.sowOtherSeasonRain;
    }
    
    public void setSowOtherSeasonRain(Boolean sowOtherSeasonRain) {
        this.sowOtherSeasonRain = sowOtherSeasonRain;
    }
    
    @Column(name="months_other_season_rain", length=50)
    public String getMonthsOtherSeasonRain() {
        return this.monthsOtherSeasonRain;
    }
    
    public void setMonthsOtherSeasonRain(String monthsOtherSeasonRain) {
        this.monthsOtherSeasonRain = monthsOtherSeasonRain;
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


