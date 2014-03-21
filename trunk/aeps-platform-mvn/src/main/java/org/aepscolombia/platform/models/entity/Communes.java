package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Communes generated by hbm2java
 */
@Entity
@Table(name="communes"
    ,catalog="madr_bd10"
    , uniqueConstraints = @UniqueConstraint(columnNames="code_com") 
)
public class Communes  implements java.io.Serializable {


     private int idCom;
     private Municipalities municipalities;
     private String codeCom;
     private String nameCom;

    public Communes() {
    }

    public Communes(int idCom, Municipalities municipalities, String codeCom, String nameCom) {
       this.idCom = idCom;
       this.municipalities = municipalities;
       this.codeCom = codeCom;
       this.nameCom = nameCom;
    }
   
     @Id 
    
    @Column(name="id_com", unique=true, nullable=false)
    public int getIdCom() {
        return this.idCom;
    }
    
    public void setIdCom(int idCom) {
        this.idCom = idCom;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_municipality_com", nullable=false)
    public Municipalities getMunicipalities() {
        return this.municipalities;
    }
    
    public void setMunicipalities(Municipalities municipalities) {
        this.municipalities = municipalities;
    }
    
    @Column(name="code_com", unique=true, nullable=false, length=10)
    public String getCodeCom() {
        return this.codeCom;
    }
    
    public void setCodeCom(String codeCom) {
        this.codeCom = codeCom;
    }
    
    @Column(name="name_com", nullable=false, length=100)
    public String getNameCom() {
        return this.nameCom;
    }
    
    public void setNameCom(String nameCom) {
        this.nameCom = nameCom;
    }




}

