package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Controls generated by hbm2java
 */
@Entity
@Table(name="controls")
public class Controls  implements java.io.Serializable {


     private Integer idCon;
     private ProductionEvents productionEvents;
     private Date dateCon;
     private Double dosisCon;
     private Boolean cleaningsCon;
     private Integer cleaningsFrequenceCon;
     private String commentCon;
     private BigDecimal costInputCon;
     private Integer costFormAppCon;
     private BigDecimal costAppCon;

     private Boolean status;
     private Integer createdBy;
    
    public Controls() {
    }

	
    public Controls(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }
    
    public Controls(ProductionEvents productionEvents, Date dateCon, Double dosisCon, Boolean cleaningsCon, Integer cleaningsFrequenceCon, String commentCon ,Boolean status, Integer createdBy, BigDecimal costInputCon, Integer costFormAppCon, BigDecimal costAppCon) {
       this.productionEvents = productionEvents;
       this.dateCon = dateCon;
       this.dosisCon = dosisCon;
       this.cleaningsCon = cleaningsCon;
       this.cleaningsFrequenceCon = cleaningsFrequenceCon;
       this.commentCon=commentCon;
       this.status = status;
       this.createdBy = createdBy;
       this.costInputCon   = costInputCon;
       this.costFormAppCon   = costFormAppCon;
       this.costAppCon   =   costAppCon;   
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_con", unique=true, nullable=false)
    public Integer getIdCon() {
        return this.idCon;
    }
    
    public void setIdCon(Integer idCon) {
        this.idCon = idCon;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_production_event_con", nullable=false)
    public ProductionEvents getProductionEvents() {
        return this.productionEvents;
    }
    
    public void setProductionEvents(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="date_con", length=19)
    public Date getDateCon() {
        return this.dateCon;
    }
    
    public void setDateCon(Date dateCon) {
        this.dateCon = dateCon;
    }
    
    @Column(name="dosis_con", precision=22, scale=0)
    public Double getDosisCon() {
        return this.dosisCon;
    }
    
    public void setDosisCon(Double dosisCon) {
        this.dosisCon = dosisCon;
    }   
    
    @Column(name="cleanings_con")
    public Boolean getCleaningsCon() {
        return this.cleaningsCon;
    }
    
    public void setCleaningsCon(Boolean cleaningsCon) {
        this.cleaningsCon = cleaningsCon;
    }
    
    @Column(name="cleanings_frequence_con")
    public Integer getCleaningsFrequenceCon() {
        return this.cleaningsFrequenceCon;
    }
    
    public void setCleaningsFrequenceCon(Integer cleaningsFrequenceCon) {
        this.cleaningsFrequenceCon = cleaningsFrequenceCon;
    }    
    
      
    @Column(name="cost_input_con")
    public BigDecimal getCostInputCon() {
        return this.costInputCon;
    }
    
    public void setCostInputCon(BigDecimal costInputCon) {
        this.costInputCon = costInputCon;
    }
    
    @Column(name="cost_form_app_con")
    public Integer getCostFormAppCon() {
        return this.costFormAppCon;
    }
    
    public void setCostFormAppCon(Integer costFormAppCon) {
        this.costFormAppCon = costFormAppCon;
    }
     
    @Column(name="cost_app_con")
    public BigDecimal getCostAppCon() {
        return this.costAppCon;
    }
    
    public void setCostAppCon(BigDecimal costAppCon) {
        this.costAppCon = costAppCon;
    }
    
      
    @Column(name="comment_con")
    public String getCommentCon() {
        return this.commentCon;
    }
    
    public void setCommentCon(String commentCon) {
        this.commentCon = commentCon;
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


