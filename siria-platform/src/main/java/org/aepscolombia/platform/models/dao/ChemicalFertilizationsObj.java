package org.aepscolombia.platform.models.dao;

import java.math.BigDecimal;
import org.aepscolombia.platform.models.entity.*;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * ChemicalFertilizations generated by hbm2java
 */
public class ChemicalFertilizationsObj {


     private Integer idCheFer;
     private ChemicalFertilizers chemicalFertilizers;
     private ApplicationTypes applicationTypes;
     private Fertilizations fertilizations;
     private Integer unitCheFer;
     private String otherProductCheFer;
     private BigDecimal costProductCheFer;
     private Integer costFormAppCheFer;
     private BigDecimal costAppCheFer;
     private Boolean status;
     private Integer createdBy;
     private Double amountProductUsedCheFer;
     private List<ChemicalElements> additionalsElem;
    
    public ChemicalFertilizationsObj() {
    }

	
    public ChemicalFertilizationsObj(Fertilizations fertilizations) {
        this.fertilizations = fertilizations;
    }
    public ChemicalFertilizationsObj(ChemicalFertilizers chemicalFertilizers, ApplicationTypes applicationTypes, Fertilizations fertilizations, Integer unitCheFer, String otherProductCheFer, Double amountProductUsedCheFer, BigDecimal costProductCheFer, Integer costFormAppCheFer, BigDecimal costAppCheFer,Boolean status, Integer createdBy) {
       this.chemicalFertilizers = chemicalFertilizers;
       this.applicationTypes = applicationTypes;
       this.fertilizations = fertilizations;
       this.unitCheFer = unitCheFer;
       this.otherProductCheFer = otherProductCheFer;
       this.costProductCheFer   = costProductCheFer;
       this.costFormAppCheFer   = costFormAppCheFer;
       this.costAppCheFer   =   costAppCheFer;       
       this.amountProductUsedCheFer = amountProductUsedCheFer;
       this.status = status;
       this.createdBy = createdBy;
    }
   
    public Integer getIdCheFer() {
        return this.idCheFer;
    }
    
    public void setIdCheFer(Integer idCheFer) {
        this.idCheFer = idCheFer;
    }
    
    public ChemicalFertilizers getChemicalFertilizers() {
        return this.chemicalFertilizers;
    }
    
    public void setChemicalFertilizers(ChemicalFertilizers chemicalFertilizers) {
        this.chemicalFertilizers = chemicalFertilizers;
    }
    
    public ApplicationTypes getApplicationTypes() {
        return this.applicationTypes;
    }
    
    public void setApplicationTypes(ApplicationTypes applicationTypes) {
        this.applicationTypes = applicationTypes;
    }
    
    public Fertilizations getFertilizations() {
        return this.fertilizations;
    }
    
    public void setFertilizations(Fertilizations fertilizations) {
        this.fertilizations = fertilizations;
    }
    
    public Integer getUnitCheFer() {
        return this.unitCheFer;
    }
    
    public void setUnitCheFer(Integer unitCheFer) {
        this.unitCheFer = unitCheFer;
    }
    
    public Double getAmountProductUsedCheFer() {
        return this.amountProductUsedCheFer;
    }
    
    public void setAmountProductUsedCheFer(Double amountProductUsedCheFer) {
        this.amountProductUsedCheFer = amountProductUsedCheFer;
    }
    
    public String getOtherProductCheFer() {
        return this.otherProductCheFer;
    }
    
    public void setOtherProductCheFer(String otherProductCheFer) {
        this.otherProductCheFer = otherProductCheFer;
    }
    
    public Boolean getStatus() {
        return this.status;
    }
    
    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    public Integer getCreatedBy() {
        return this.createdBy;
    }
    
    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }
    
    public List<ChemicalElements> getAdditionalsElem() {
        return additionalsElem;
    }

    public void setAdditionalsElem(List<ChemicalElements> additionalsElem) {
        this.additionalsElem = additionalsElem;
    }
    
        public BigDecimal getCostProductCheFer() {
        return costProductCheFer;
    }

    public void setCostProductCheFer(BigDecimal costProductCheFer) {
        this.costProductCheFer = costProductCheFer;
    }

    public Integer getCostFormAppCheFer() {
        return costFormAppCheFer;
    }

    public void setCostFormAppCheFer(Integer costFormAppCheFer) {
        this.costFormAppCheFer = costFormAppCheFer;
    }

    public BigDecimal getCostAppCheFer() {
        return costAppCheFer;
    }

    public void setCostAppCheFer(BigDecimal costAppCheFer) {
        this.costAppCheFer = costAppCheFer;
    }
}