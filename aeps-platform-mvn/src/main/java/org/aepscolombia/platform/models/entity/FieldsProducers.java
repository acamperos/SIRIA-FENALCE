package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * FieldsProducers generated by hbm2java
 */
@Entity
@Table(name="fields_producers")
public class FieldsProducers  implements java.io.Serializable {


     private FieldsProducersId id;
     private Producers producers;
     private Fields fields;
     private Integer createdBy;

    public FieldsProducers() {
    }

	
    public FieldsProducers(FieldsProducersId id, Producers producers, Fields fields) {
        this.id = id;
        this.producers = producers;
        this.fields = fields;
    }
    public FieldsProducers(FieldsProducersId id, Producers producers, Fields fields, Integer createdBy) {
       this.id = id;
       this.producers = producers;
       this.fields = fields;
       this.createdBy = createdBy;
    }
   
     @EmbeddedId
    
    @AttributeOverrides( {
        @AttributeOverride(name="idFieldFiePro", column=@Column(name="id_field_fie_pro", nullable=false) ), 
        @AttributeOverride(name="idProducerFiePro", column=@Column(name="id_producer_fie_pro", nullable=false) ) } )
    public FieldsProducersId getId() {
        return this.id;
    }
    
    public void setId(FieldsProducersId id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_producer_fie_pro", nullable=false, insertable=false, updatable=false)
    public Producers getProducers() {
        return this.producers;
    }
    
    public void setProducers(Producers producers) {
        this.producers = producers;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_field_fie_pro", nullable=false, insertable=false, updatable=false)
    public Fields getFields() {
        return this.fields;
    }
    
    public void setFields(Fields fields) {
        this.fields = fields;
    }
    
    @Column(name="created_by")
    public Integer getCreatedBy() {
        return this.createdBy;
    }
    
    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }




}


