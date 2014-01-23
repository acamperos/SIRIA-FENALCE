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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Genotypes generated by hbm2java
 */
@Entity
@Table(name="genotypes"
    ,catalog="madr_bd10"
)
public class Genotypes  implements java.io.Serializable {


     private Integer idGen;
     private CropsTypes cropsTypes;
     private String nameGen;
     private String codeGen;
     private Boolean statusGen;

    public Genotypes() {
    }

    public Genotypes(CropsTypes cropsTypes, String nameGen, String codeGen, Boolean statusGen) {
       this.cropsTypes = cropsTypes;
       this.nameGen = nameGen;
       this.codeGen = codeGen;
       this.statusGen = statusGen;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_gen", unique=true, nullable=false)
    public Integer getIdGen() {
        return this.idGen;
    }
    
    public void setIdGen(Integer idGen) {
        this.idGen = idGen;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="crop_type_gen")
    public CropsTypes getCropsTypes() {
        return this.cropsTypes;
    }
    
    public void setCropsTypes(CropsTypes cropsTypes) {
        this.cropsTypes = cropsTypes;
    }
    
    @Column(name="name_gen", length=45)
    public String getNameGen() {
        return this.nameGen;
    }
    
    public void setNameGen(String nameGen) {
        this.nameGen = nameGen;
    }
    
    @Column(name="code_gen", length=45)
    public String getCodeGen() {
        return this.codeGen;
    }
    
    public void setCodeGen(String codeGen) {
        this.codeGen = codeGen;
    }
    
    @Column(name="status_gen")
    public Boolean getStatusGen() {
        return this.statusGen;
    }
    
    public void setStatusGen(Boolean statusGen) {
        this.statusGen = statusGen;
    }

}


