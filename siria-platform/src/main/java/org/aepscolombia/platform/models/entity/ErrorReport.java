package org.aepscolombia.platform.models.entity;
// Generated Apr 8, 2014 9:37:27 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ErrorReport generated by hbm2java
 */
@Entity
@Table(name="error_report")
public class ErrorReport  implements java.io.Serializable {


     private Integer idErrRep;
     private Integer idUsesErrRep;
     private String sqlUsesErrRep;
     private Date dateErrRep;
     private String descErrRep;

    public ErrorReport() {
    }

    public ErrorReport(Integer idUsesErrRep, String sqlUsesErrRep, Date dateErrRep, String descErrRep) {
       this.idUsesErrRep = idUsesErrRep;
       this.sqlUsesErrRep = sqlUsesErrRep;
       this.dateErrRep = dateErrRep;
       this.descErrRep = descErrRep;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_err_rep", unique=true, nullable=false)
    public Integer getIdErrRep() {
        return this.idErrRep;
    }
    
    public void setIdErrRep(Integer idErrRep) {
        this.idErrRep = idErrRep;
    }
    
    @Column(name="id_uses_err_rep")
    public Integer getIdUsesErrRep() {
        return this.idUsesErrRep;
    }
    
    public void setIdUsesErrRep(Integer idUsesErrRep) {
        this.idUsesErrRep = idUsesErrRep;
    }
    
    @Column(name="sql_uses_err_rep", length=65535)
    public String getSqlUsesErrRep() {
        return this.sqlUsesErrRep;
    }
    
    public void setSqlUsesErrRep(String sqlUsesErrRep) {
        this.sqlUsesErrRep = sqlUsesErrRep;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="date_err_rep", length=19)
    public Date getDateErrRep() {
        return this.dateErrRep;
    }
    
    public void setDateErrRep(Date dateErrRep) {
        this.dateErrRep = dateErrRep;
    }
    
    @Column(name="desc_err_rep", length=65535)
    public String getDescErrRep() {
        return this.descErrRep;
    }
    
    public void setDescErrRep(String descErrRep) {
        this.descErrRep = descErrRep;
    }




}


