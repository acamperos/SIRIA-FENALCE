package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * DocumentsTypes generated by hbm2java
 */
@Entity
@Table(name="documents_types"
    ,catalog="madr_bd13"
)
public class DocumentsTypes  implements java.io.Serializable {


     private String acronymDocTyp;
     private String nameDocTyp;

    public DocumentsTypes() {
    }

    public DocumentsTypes(String acronymDocTyp) {
        this.acronymDocTyp = acronymDocTyp;
    }
	
    public DocumentsTypes(String acronymDocTyp, String nameDocTyp) {
        this.acronymDocTyp = acronymDocTyp;
        this.nameDocTyp = nameDocTyp;
    }
   
     @Id 
    
    @Column(name="acronym_doc_typ", unique=true, nullable=false, length=3)
    public String getAcronymDocTyp() {
        return this.acronymDocTyp;
    }
    
    public void setAcronymDocTyp(String acronymDocTyp) {
        this.acronymDocTyp = acronymDocTyp;
    }
    
    @Column(name="name_doc_typ", nullable=false, length=45)
    public String getNameDocTyp() {
        return this.nameDocTyp;
    }
    
    public void setNameDocTyp(String nameDocTyp) {
        this.nameDocTyp = nameDocTyp;
    }

}


