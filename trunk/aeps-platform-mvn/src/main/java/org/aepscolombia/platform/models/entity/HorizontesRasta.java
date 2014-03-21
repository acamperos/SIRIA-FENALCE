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
 * HorizontesRasta generated by hbm2java
 */
@Entity
@Table(name="horizontes_rasta"
    ,catalog="madr_bd10"
)
public class HorizontesRasta  implements java.io.Serializable {


     private Integer idHorRas;
     private Rastas rastas;
     private ResistenciasRompimiento resistenciasRompimiento;
//     private Integer resistenciasRompimientoId;
     private Textures textures;
//     private Integer texturesId;
     private Integer numeroHorizonteHorRas=0;
     private Double espesorHorRas;
     private Integer colorSecoHorRas;
     private Integer colorHumedoHorRas;

    public HorizontesRasta() {
    }

	
    public HorizontesRasta(Rastas rastas, int numeroHorizonteHorRas) {
        this.rastas = rastas;
        this.numeroHorizonteHorRas = numeroHorizonteHorRas;
    }
    public HorizontesRasta(Rastas rastas, ResistenciasRompimiento resistenciasRompimiento, Textures textures, int numeroHorizonteHorRas, Double espesorHorRas, Integer colorSecoHorRas, Integer colorHumedoHorRas) {
       this.rastas = rastas;
       this.resistenciasRompimiento = resistenciasRompimiento;
       this.textures = textures;
       this.numeroHorizonteHorRas = numeroHorizonteHorRas;
       this.espesorHorRas = espesorHorRas;
       this.colorSecoHorRas = colorSecoHorRas;
       this.colorHumedoHorRas = colorHumedoHorRas;
    }
    
    public HorizontesRasta(ResistenciasRompimiento resistenciasRompimiento, Textures textures, int numeroHorizonteHorRas, Double espesorHorRas, Integer colorSecoHorRas, Integer colorHumedoHorRas) {
       this.resistenciasRompimiento = resistenciasRompimiento;
       this.textures = textures;
       this.numeroHorizonteHorRas = numeroHorizonteHorRas;
       this.espesorHorRas = espesorHorRas;
       this.colorSecoHorRas = colorSecoHorRas;
       this.colorHumedoHorRas = colorHumedoHorRas;
    }
    
//    public HorizontesRasta(Integer resistenciasRompimientoId, Integer texturesId, int numeroHorizonteHorRas, Double espesorHorRas, Integer colorSecoHorRas, Integer colorHumedoHorRas) {
//       this.resistenciasRompimientoId = resistenciasRompimientoId;
//       this.texturesId = texturesId;
//       this.numeroHorizonteHorRas = numeroHorizonteHorRas;
//       this.espesorHorRas = espesorHorRas;
//       this.colorSecoHorRas = colorSecoHorRas;
//       this.colorHumedoHorRas = colorHumedoHorRas;
//    }   
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id_hor_ras", unique=true, nullable=false)
    public Integer getIdHorRas() {
        return this.idHorRas;
    }
    
    public void setIdHorRas(Integer idHorRas) {
        this.idHorRas = idHorRas;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_rasta_hor_ras", nullable=false)
    public Rastas getRastas() {
        return this.rastas;
    }
    
    public void setRastas(Rastas rastas) {
        this.rastas = rastas;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="resistencia_rompimiento_hor_ras")
    public ResistenciasRompimiento getResistenciasRompimiento() {
        return this.resistenciasRompimiento;
    }
    
    public void setResistenciasRompimiento(ResistenciasRompimiento resistenciasRompimiento) {
        this.resistenciasRompimiento = resistenciasRompimiento;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="textura_hor_ras")
    public Textures getTextures() {
        return this.textures;
    }
    
    public void setTextures(Textures textures) {
        this.textures = textures;
    }
    
    @Column(name="numero_horizonte_hor_ras", nullable=false)
    public int getNumeroHorizonteHorRas() {
        return this.numeroHorizonteHorRas;
    }
    
    public void setNumeroHorizonteHorRas(int numeroHorizonteHorRas) {
        this.numeroHorizonteHorRas = numeroHorizonteHorRas;
    }
    
    @Column(name="espesor_hor_ras", precision=22, scale=0)
    public Double getEspesorHorRas() {
        return this.espesorHorRas;
    }
    
    public void setEspesorHorRas(Double espesorHorRas) {
        this.espesorHorRas = espesorHorRas;
    }
    
    @Column(name="color_seco_hor_ras")
    public Integer getColorSecoHorRas() {
        return this.colorSecoHorRas;
    }
    
    public void setColorSecoHorRas(Integer colorSecoHorRas) {
        this.colorSecoHorRas = colorSecoHorRas;
    }
    
    @Column(name="color_humedo_hor_ras")
    public Integer getColorHumedoHorRas() {
        return this.colorHumedoHorRas;
    }
    
    public void setColorHumedoHorRas(Integer colorHumedoHorRas) {
        this.colorHumedoHorRas = colorHumedoHorRas;
    }

//    @Column(name="resistencia_rompimiento_hor_ras", nullable=false)
//    public Integer getResistenciasRompimientoId() {
//        return resistenciasRompimientoId;
//    }
//
//    public void setResistenciasRompimientoId(Integer resistenciasRompimientoId) {
//        this.resistenciasRompimientoId = resistenciasRompimientoId;
//    }
//
//    @Column(name="textura_hor_ras", nullable=false)
//    public Integer getTexturesId() {
//        return texturesId;
//    }
//
//    public void setTexturesId(Integer texturesId) {
//        this.texturesId = texturesId;
//    }


}

