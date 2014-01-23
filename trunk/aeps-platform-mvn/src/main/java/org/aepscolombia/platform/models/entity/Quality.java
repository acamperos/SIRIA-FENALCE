package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA


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
 * Quality generated by hbm2java
 */
@Entity
@Table(name="quality"
    ,catalog="madr_bd10"
)
public class Quality  implements java.io.Serializable {


     private Integer idQua;
     private Production production;
     private Double extraQua;
     private Double firstQua;
     private Double secondQua;
     private Double humidityPercentageQua;
     private Double otherQua;
     private Double dryMatterPercentageQua;
     private Double starchContentQua;
     private Double plantHeightCassavaQua;
     private Double firstBranchHeightCassavaQua;
     private Double freshWeightSeedsCassavaQua;
     private Double freshWeightStemsCassavaQua;
     private Double freshWeightLeavesCassavaQua;
     private Double percentageRootsDryMatterCassavaQua;
     private Double percentageDryMatterSeedsCassavaQua;
     private Double percentageStemsDryMatterCassavaQua;
     private Double percentageLeavesDryMatterCassavaQua;
     private Double percentageRottenRootCassavaQua;
     private Integer plantsNumberFieldCassavaQua;

    public Quality() {
    }

	
    public Quality(Production production) {
        this.production = production;
    }
    public Quality(Production production, Double extraQua, Double firstQua, Double secondQua, Double humidityPercentageQua, Double otherQua, Double dryMatterPercentageQua, Double starchContentQua, Double plantHeightCassavaQua, Double firstBranchHeightCassavaQua, Double freshWeightSeedsCassavaQua, Double freshWeightStemsCassavaQua, Double freshWeightLeavesCassavaQua, Double percentageRootsDryMatterCassavaQua, Double percentageDryMatterSeedsCassavaQua, Double percentageStemsDryMatterCassavaQua, Double percentageLeavesDryMatterCassavaQua, Double percentageRottenRootCassavaQua, Integer plantsNumberFieldCassavaQua) {
       this.production = production;
       this.extraQua = extraQua;
       this.firstQua = firstQua;
       this.secondQua = secondQua;
       this.humidityPercentageQua = humidityPercentageQua;
       this.otherQua = otherQua;
       this.dryMatterPercentageQua = dryMatterPercentageQua;
       this.starchContentQua = starchContentQua;
       this.plantHeightCassavaQua = plantHeightCassavaQua;
       this.firstBranchHeightCassavaQua = firstBranchHeightCassavaQua;
       this.freshWeightSeedsCassavaQua = freshWeightSeedsCassavaQua;
       this.freshWeightStemsCassavaQua = freshWeightStemsCassavaQua;
       this.freshWeightLeavesCassavaQua = freshWeightLeavesCassavaQua;
       this.percentageRootsDryMatterCassavaQua = percentageRootsDryMatterCassavaQua;
       this.percentageDryMatterSeedsCassavaQua = percentageDryMatterSeedsCassavaQua;
       this.percentageStemsDryMatterCassavaQua = percentageStemsDryMatterCassavaQua;
       this.percentageLeavesDryMatterCassavaQua = percentageLeavesDryMatterCassavaQua;
       this.percentageRottenRootCassavaQua = percentageRottenRootCassavaQua;
       this.plantsNumberFieldCassavaQua = plantsNumberFieldCassavaQua;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_qua", unique=true, nullable=false)
    public Integer getIdQua() {
        return this.idQua;
    }
    
    public void setIdQua(Integer idQua) {
        this.idQua = idQua;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_production_qua", nullable=false)
    public Production getProduction() {
        return this.production;
    }
    
    public void setProduction(Production production) {
        this.production = production;
    }
    
    @Column(name="extra_qua", precision=22, scale=0)
    public Double getExtraQua() {
        return this.extraQua;
    }
    
    public void setExtraQua(Double extraQua) {
        this.extraQua = extraQua;
    }
    
    @Column(name="first_qua", precision=22, scale=0)
    public Double getFirstQua() {
        return this.firstQua;
    }
    
    public void setFirstQua(Double firstQua) {
        this.firstQua = firstQua;
    }
    
    @Column(name="second_qua", precision=22, scale=0)
    public Double getSecondQua() {
        return this.secondQua;
    }
    
    public void setSecondQua(Double secondQua) {
        this.secondQua = secondQua;
    }
    
    @Column(name="humidity_percentage_qua", precision=22, scale=0)
    public Double getHumidityPercentageQua() {
        return this.humidityPercentageQua;
    }
    
    public void setHumidityPercentageQua(Double humidityPercentageQua) {
        this.humidityPercentageQua = humidityPercentageQua;
    }
    
    @Column(name="other_qua", precision=22, scale=0)
    public Double getOtherQua() {
        return this.otherQua;
    }
    
    public void setOtherQua(Double otherQua) {
        this.otherQua = otherQua;
    }
    
    @Column(name="dry_matter_percentage_qua", precision=22, scale=0)
    public Double getDryMatterPercentageQua() {
        return this.dryMatterPercentageQua;
    }
    
    public void setDryMatterPercentageQua(Double dryMatterPercentageQua) {
        this.dryMatterPercentageQua = dryMatterPercentageQua;
    }
    
    @Column(name="starch_content_qua", precision=22, scale=0)
    public Double getStarchContentQua() {
        return this.starchContentQua;
    }
    
    public void setStarchContentQua(Double starchContentQua) {
        this.starchContentQua = starchContentQua;
    }
    
    @Column(name="plant_height_cassava_qua", precision=22, scale=0)
    public Double getPlantHeightCassavaQua() {
        return this.plantHeightCassavaQua;
    }
    
    public void setPlantHeightCassavaQua(Double plantHeightCassavaQua) {
        this.plantHeightCassavaQua = plantHeightCassavaQua;
    }
    
    @Column(name="first_branch_height_cassava_qua", precision=22, scale=0)
    public Double getFirstBranchHeightCassavaQua() {
        return this.firstBranchHeightCassavaQua;
    }
    
    public void setFirstBranchHeightCassavaQua(Double firstBranchHeightCassavaQua) {
        this.firstBranchHeightCassavaQua = firstBranchHeightCassavaQua;
    }
    
    @Column(name="fresh weight_seeds_cassava_qua", precision=22, scale=0)
    public Double getFreshWeightSeedsCassavaQua() {
        return this.freshWeightSeedsCassavaQua;
    }
    
    public void setFreshWeightSeedsCassavaQua(Double freshWeightSeedsCassavaQua) {
        this.freshWeightSeedsCassavaQua = freshWeightSeedsCassavaQua;
    }
    
    @Column(name="fresh_weight_stems_cassava_qua", precision=22, scale=0)
    public Double getFreshWeightStemsCassavaQua() {
        return this.freshWeightStemsCassavaQua;
    }
    
    public void setFreshWeightStemsCassavaQua(Double freshWeightStemsCassavaQua) {
        this.freshWeightStemsCassavaQua = freshWeightStemsCassavaQua;
    }
    
    @Column(name="fresh_weight_leaves_cassava_qua", precision=22, scale=0)
    public Double getFreshWeightLeavesCassavaQua() {
        return this.freshWeightLeavesCassavaQua;
    }
    
    public void setFreshWeightLeavesCassavaQua(Double freshWeightLeavesCassavaQua) {
        this.freshWeightLeavesCassavaQua = freshWeightLeavesCassavaQua;
    }
    
    @Column(name="percentage_roots_dry_matter_cassava_qua", precision=22, scale=0)
    public Double getPercentageRootsDryMatterCassavaQua() {
        return this.percentageRootsDryMatterCassavaQua;
    }
    
    public void setPercentageRootsDryMatterCassavaQua(Double percentageRootsDryMatterCassavaQua) {
        this.percentageRootsDryMatterCassavaQua = percentageRootsDryMatterCassavaQua;
    }
    
    @Column(name="percentage_dry_matter_seeds_cassava_qua", precision=22, scale=0)
    public Double getPercentageDryMatterSeedsCassavaQua() {
        return this.percentageDryMatterSeedsCassavaQua;
    }
    
    public void setPercentageDryMatterSeedsCassavaQua(Double percentageDryMatterSeedsCassavaQua) {
        this.percentageDryMatterSeedsCassavaQua = percentageDryMatterSeedsCassavaQua;
    }
    
    @Column(name="percentage_stems_dry_matter_cassava_qua", precision=22, scale=0)
    public Double getPercentageStemsDryMatterCassavaQua() {
        return this.percentageStemsDryMatterCassavaQua;
    }
    
    public void setPercentageStemsDryMatterCassavaQua(Double percentageStemsDryMatterCassavaQua) {
        this.percentageStemsDryMatterCassavaQua = percentageStemsDryMatterCassavaQua;
    }
    
    @Column(name="percentage_leaves_dry_matter_cassava_qua", precision=22, scale=0)
    public Double getPercentageLeavesDryMatterCassavaQua() {
        return this.percentageLeavesDryMatterCassavaQua;
    }
    
    public void setPercentageLeavesDryMatterCassavaQua(Double percentageLeavesDryMatterCassavaQua) {
        this.percentageLeavesDryMatterCassavaQua = percentageLeavesDryMatterCassavaQua;
    }
    
    @Column(name="percentage_rotten_root_cassava_qua", precision=22, scale=0)
    public Double getPercentageRottenRootCassavaQua() {
        return this.percentageRottenRootCassavaQua;
    }
    
    public void setPercentageRottenRootCassavaQua(Double percentageRottenRootCassavaQua) {
        this.percentageRottenRootCassavaQua = percentageRottenRootCassavaQua;
    }
    
    @Column(name="plants_number_field_cassava_qua")
    public Integer getPlantsNumberFieldCassavaQua() {
        return this.plantsNumberFieldCassavaQua;
    }
    
    public void setPlantsNumberFieldCassavaQua(Integer plantsNumberFieldCassavaQua) {
        this.plantsNumberFieldCassavaQua = plantsNumberFieldCassavaQua;
    }




}


