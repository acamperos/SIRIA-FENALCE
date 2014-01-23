package org.aepscolombia.platform.models.entity;
// Generated Jan 21, 2014 11:35:29 AM by Hibernate Tools 3.2.1.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Status generated by hbm2java
 */
@Entity
@Table(name="status"
    ,catalog="madr_bd10"
)
public class Status  implements java.io.Serializable {


     private int idStatus;
     private String nameStatus;

    public Status() {
    }

	
    public Status(int idStatus) {
        this.idStatus = idStatus;
    }
    public Status(int idStatus, String nameStatus) {
       this.idStatus = idStatus;
       this.nameStatus = nameStatus;
    }
   
     @Id 
    
    @Column(name="id_status", unique=true, nullable=false)
    public int getIdStatus() {
        return this.idStatus;
    }
    
    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }
    
    @Column(name="name_status", length=45)
    public String getNameStatus() {
        return this.nameStatus;
    }
    
    public void setNameStatus(String nameStatus) {
        this.nameStatus = nameStatus;
    }




}


