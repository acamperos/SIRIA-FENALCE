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
 * IncomesSourcesMarkets generated by hbm2java
 */
@Entity
@Table(name="incomes_sources_markets")
public class IncomesSourcesMarkets  implements java.io.Serializable {


     private Integer idIncSouMar;
     private Markets markets;
     private String additionalIncomeSourcesIncSouMar;
     private Boolean status;
     private Integer createdBy;

    public IncomesSourcesMarkets() {
    }

	
    public IncomesSourcesMarkets(Markets markets, String additionalIncomeSourcesIncSouMar) {
        this.markets = markets;
        this.additionalIncomeSourcesIncSouMar = additionalIncomeSourcesIncSouMar;
    }
    public IncomesSourcesMarkets(Markets markets, String additionalIncomeSourcesIncSouMar, Boolean status, Integer createdBy) {
       this.markets = markets;
       this.additionalIncomeSourcesIncSouMar = additionalIncomeSourcesIncSouMar;
       this.status = status;
       this.createdBy = createdBy;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_inc_sou_mar", unique=true, nullable=false)
    public Integer getIdIncSouMar() {
        return this.idIncSouMar;
    }
    
    public void setIdIncSouMar(Integer idIncSouMar) {
        this.idIncSouMar = idIncSouMar;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_market_inc_sou_mar", nullable=false)
    public Markets getMarkets() {
        return this.markets;
    }
    
    public void setMarkets(Markets markets) {
        this.markets = markets;
    }
    
    @Column(name="additional_income_sources_inc_sou_mar", nullable=false, length=11)
    public String getAdditionalIncomeSourcesIncSouMar() {
        return this.additionalIncomeSourcesIncSouMar;
    }
    
    public void setAdditionalIncomeSourcesIncSouMar(String additionalIncomeSourcesIncSouMar) {
        this.additionalIncomeSourcesIncSouMar = additionalIncomeSourcesIncSouMar;
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


