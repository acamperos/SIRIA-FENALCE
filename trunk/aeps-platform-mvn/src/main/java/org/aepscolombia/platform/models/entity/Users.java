package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Users generated by hbm2java
 */
@Entity
@Table(name="users"
    ,catalog="madr_bd10"
    , uniqueConstraints = @UniqueConstraint(columnNames="name_user_usr") 
)
public class Users  implements java.io.Serializable {


     private Integer idUsr;
     private String nameUserUsr;
     private String passwordUsr;
     private String codValidationUsr;
     private Integer statusUsr;

    public Users() {
    }

	
    public Users(String nameUserUsr, String passwordUsr, String codValidationUsr, Integer statusUsr) {
        this.nameUserUsr = nameUserUsr;
        this.passwordUsr = passwordUsr;
        this.codValidationUsr = codValidationUsr;
        this.statusUsr = statusUsr;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_usr", unique=true, nullable=false)
    public Integer getIdUsr() {
        return this.idUsr;
    }
    
    public void setIdUsr(Integer idUsr) {
        this.idUsr = idUsr;
    }
    
    @Column(name="name_user_usr", unique=true, nullable=false, length=120)
    public String getNameUserUsr() {
        return this.nameUserUsr;
    }
    
    public void setNameUserUsr(String nameUserUsr) {
        this.nameUserUsr = nameUserUsr;
    }
    
    @Column(name="password_usr", nullable=false, length=120)
    public String getPasswordUsr() {
        return this.passwordUsr;
    }
    
    public void setPasswordUsr(String passwordUsr) {
        this.passwordUsr = passwordUsr;
    }
    
    @Column(name="cod_validation_usr", nullable=false, length=120)
    public String getCodValidationUsr() {
        return this.passwordUsr;
    }
    
    public void setCodValidationUsr(String codValidationUsr) {
        this.codValidationUsr = codValidationUsr;
    }
    
    @Column(name="status_usr", nullable=false)
    public Integer getStatusUsr() {
        return this.statusUsr;
    }
    
    public void setStatusUsr(Integer statusUsr) {
        this.statusUsr = statusUsr;
    }

}


