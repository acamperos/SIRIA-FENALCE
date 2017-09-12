/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.aepscolombia.platform.models.entity;

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
 *
 * @author acamperos
 */

@Entity
@Table(name="soja")
public class Soja  implements java.io.Serializable{
    
     private Integer idSoja;
     private ProductionEvents productionEvents;
     private Boolean status;
     private Integer idVariety;
     private Integer createdBy;
     private Integer seedsNumberSiteMetro;

    public Soja() {
    }

    public Soja(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }   
    
    public Soja(Integer idSoja, ProductionEvents productionEvents, Boolean status, Integer idVariety, Integer createdBy, Integer seedsNumberSiteMetro) {
        this.idSoja = idSoja;
        this.productionEvents = productionEvents;
        this.status = status;
        this.idVariety = idVariety;
        this.createdBy = createdBy;
        this.seedsNumberSiteMetro = seedsNumberSiteMetro;
    }
    
    @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_soja", unique=true, nullable=false)
    public Integer getIdSoja() {
        return idSoja;
    }

    public void setIdSoja(Integer idSoja) {
        this.idSoja = idSoja;
    }
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_production_events", nullable=false)
    public ProductionEvents getProductionEvents() {
        return productionEvents;
    }

    public void setProductionEvents(ProductionEvents productionEvents) {
        this.productionEvents = productionEvents;
    }
    
    @Column(name="status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    @Column(name="id_variety")
    public Integer getIdVariety() {
        return idVariety;
    }

    public void setIdVariety(Integer idVariety) {
        this.idVariety = idVariety;
    }
    
    @Column(name="created_by")
    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name="seeds_number_metro")
    public Integer getSeedsNumberSiteMetro() {
        return seedsNumberSiteMetro;
    }

    public void setSeedsNumberSiteMetro(Integer seedsNumberSiteMetro) {
        this.seedsNumberSiteMetro = seedsNumberSiteMetro;
    }
    
    
}
