package org.aepscolombia.platform.controllers;

import com.opensymphony.xwork2.ActionContext;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.aepscolombia.platform.models.dao.ChemicalsControlsDao;
import org.aepscolombia.platform.models.dao.ControlsDao;
import org.aepscolombia.platform.models.dao.ControlsTypesDao;
import org.aepscolombia.platform.models.dao.DiseasesDao;
import org.aepscolombia.platform.models.dao.DoseUnitsDao;

import org.aepscolombia.platform.models.dao.LogEntitiesDao;
import org.aepscolombia.platform.models.dao.OrganicControlsDao;
import org.aepscolombia.platform.models.dao.PestsDao;
import org.aepscolombia.platform.models.dao.ProductionEventsDao;
import org.aepscolombia.platform.models.dao.ProductsControlsDao;
import org.aepscolombia.platform.models.dao.SfGuardUserDao;
import org.aepscolombia.platform.models.dao.SowingDao;
import org.aepscolombia.platform.models.dao.TargetsTypesDao;
import org.aepscolombia.platform.models.dao.UsersDao;
import org.aepscolombia.platform.models.dao.WeedsDao;
import org.aepscolombia.platform.models.entity.ChemicalsControls;
import org.aepscolombia.platform.models.entity.Controls;
import org.aepscolombia.platform.models.entity.ControlsTypes;
import org.aepscolombia.platform.models.entity.Diseases;
import org.aepscolombia.platform.models.entity.DoseUnits;

import org.aepscolombia.platform.models.entity.LogEntities;
import org.aepscolombia.platform.models.entity.OrganicControls;
import org.aepscolombia.platform.models.entity.ProductionEvents;
import org.aepscolombia.platform.models.entity.Pests;
import org.aepscolombia.platform.models.entity.ProductsControls;
import org.aepscolombia.platform.models.entity.Sowing;
import org.aepscolombia.platform.models.entity.TargetsTypes;
import org.aepscolombia.platform.models.entity.Users;
import org.aepscolombia.platform.models.entity.Weeds;
import org.aepscolombia.platform.models.entityservices.SfGuardUser;
import org.aepscolombia.platform.util.APConstants;
import org.aepscolombia.platform.util.GlobalFunctions;
import org.aepscolombia.platform.util.HibernateUtil;
import org.apache.commons.lang.StringUtils;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Clase ActionFer
 *
 * Contiene los metodos para interactuar con el modulo de control
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ActionCon extends BaseAction {
    
    /**
     * Atributos provenientes del formulario
     */
    private int idCrop;    
    private int idCon;    
    private int typeCrop;
    private int costCrop;
    private List<HashMap> listCont;
    private List<ProductsControls> listProd;
    private Users user;
    private Integer idEntSystem;    
    private Integer idUsrSystem;    

    private Controls con = new Controls();
    private Sowing sowing = new Sowing();
    private List<TargetsTypes> type_tar_typ;
    private List<Pests> type_pest_con;
    private List<Weeds> type_weeds_con;
    private List<Diseases> type_dis_con;
    private List<ControlsTypes> type_con_typ;
    private List<ChemicalsControls> type_prod_che_con;
    private List<OrganicControls> type_prod_org_con;
    private List<DoseUnits> type_dose_units;
    private UsersDao usrDao;
    
    private Double dosisConChe=null;
    private Integer doseUnitsChe;

    private Double dosisConOrg=null;
    private Integer doseUnitsOrg;
    
    private Double dosisConMec=null;
    private Integer doseUnitsMec;
    
    private Double dosisConMan=null;
    private Integer doseUnitsMan;
    private String coCode;
    private BigDecimal costInputCon;
     private Integer costFormAppCon;

   
     private BigDecimal costAppCon;

    /**
     * Metodos getter y setter por cada variable del formulario
     */
    public int getIdCon() {
        return idCon;
    }

    public void setIdCon(int idCon) {
        this.idCon = idCon;
    }

    public Double getDosisConChe() {
        return dosisConChe;
    }

    public void setDosisConChe(Double dosisConChe) {
        this.dosisConChe = dosisConChe;
    }

    public Integer getDoseUnitsChe() {
        return doseUnitsChe;
    }

    public void setDoseUnitsChe(Integer doseUnitsChe) {
        this.doseUnitsChe = doseUnitsChe;
    }

    public Double getDosisConOrg() {
        return dosisConOrg;
    }

    public void setDosisConOrg(Double dosisConOrg) {
        this.dosisConOrg = dosisConOrg;
    }

    public Integer getDoseUnitsOrg() {
        return doseUnitsOrg;
    }

    public void setDoseUnitsOrg(Integer doseUnitsOrg) {
        this.doseUnitsOrg = doseUnitsOrg;
    }   

    public Double getDosisConMec() {
        return dosisConMec;
    }

    public void setDosisConMec(Double dosisConMec) {
        this.dosisConMec = dosisConMec;
    }

    public Integer getDoseUnitsMec() {
        return doseUnitsMec;
    }

    public void setDoseUnitsMec(Integer doseUnitsMec) {
        this.doseUnitsMec = doseUnitsMec;
    }

    public Double getDosisConMan() {
        return dosisConMan;
    }

    public void setDosisConMan(Double dosisConMan) {
        this.dosisConMan = dosisConMan;
    }

    public Integer getDoseUnitsMan() {
        return doseUnitsMan;
    }

    public void setDoseUnitsMan(Integer doseUnitsMan) {
        this.doseUnitsMan = doseUnitsMan;
    }   

    public Sowing getSowing() {
        return sowing;
    }

    public void setSowing(Sowing sowing) {
        this.sowing = sowing;
    }  

    public Controls getCon() {
        return con;
    }

    public void setCon(Controls con) {
        this.con = con;
    }

    public List<TargetsTypes> getType_tar_typ() {
        return type_tar_typ;
    }

    public void setType_tar_typ(List<TargetsTypes> type_tar_typ) {
        this.type_tar_typ = type_tar_typ;
    }

    public List<Pests> getType_pest_con() {
        return type_pest_con;
    }

    public void setType_pest_con(List<Pests> type_pest_con) {
        this.type_pest_con = type_pest_con;
    }

    public List<Diseases> getType_dis_con() {
        return type_dis_con;
    }

    public void setType_dis_con(List<Diseases> type_dis_con) {
        this.type_dis_con = type_dis_con;
    }

    public List<ChemicalsControls> getType_prod_che_con() {
        return type_prod_che_con;
    }

    public void setType_prod_che_con(List<ChemicalsControls> type_prod_che_con) {
        this.type_prod_che_con = type_prod_che_con;
    }

    public List<OrganicControls> getType_prod_org_con() {
        return type_prod_org_con;
    }

    public void setType_prod_org_con(List<OrganicControls> type_prod_org_con) {
        this.type_prod_org_con = type_prod_org_con;
    }

    public List<DoseUnits> getType_dose_units() {
        return type_dose_units;
    }

    public void setType_dose_units(List<DoseUnits> type_dose_units) {
        this.type_dose_units = type_dose_units;
    }

    public List<Weeds> getType_weeds_con() {
        return type_weeds_con;
    }

    public void setType_weeds_con(List<Weeds> type_weeds_con) {
        this.type_weeds_con = type_weeds_con;
    }

    public List<ControlsTypes> getType_con_typ() {
        return type_con_typ;
    }

    public void setType_con_typ(List<ControlsTypes> type_con_typ) {
        this.type_con_typ = type_con_typ;
    }   

    public int getIdCrop() {
        return idCrop;
    }

    public void setIdCrop(int idCrop) {
        this.idCrop = idCrop;
    }  
    
    public int getCostCrop() {
        return costCrop;
    }

    public void setCostCrop(int costCrop) {
        this.costCrop = costCrop;
    }

    
    public int getTypeCrop() {
        return typeCrop;
    }

    public void setTypeCrop(int typeCrop) {
        this.typeCrop = typeCrop;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }       

    public List<HashMap> getListCont() {
        return listCont;
    }
    
    public List<ProductsControls> getListProd() {
        return listProd;
    }

    public void setListProd(List<ProductsControls> listProd) {
        this.listProd = listProd;
    }   

    public BigDecimal getCostInputCon() {
        return costInputCon;
    }

    public void setCostInputCon(BigDecimal costInputCon) {
        this.costInputCon = costInputCon;
    }

    public Integer getCostFormAppCon() {
        return costFormAppCon;
    }

    public void setCostFormAppCon(Integer costFormAppCon) {
        this.costFormAppCon = costFormAppCon;
    }

    public BigDecimal getCostAppCon() {
        return costAppCon;
    }

    public void setCostAppCon(BigDecimal costAppCon) {
        this.costAppCon = costAppCon;
    }
    
    private List<ProductsControls> prodCon; 

    public List<ProductsControls> getProdCon() {
        return prodCon;
    }

    public void setProdCon(List<ProductsControls> prodCon) {
        this.prodCon = prodCon;
    }
    
    
    /**
     * Atributos generales de clase
     */    
    private ProductionEventsDao cropDao    = new ProductionEventsDao();
    private ControlsDao conDao    = new ControlsDao();
    private SowingDao sowDao      = new SowingDao();
    private LogEntitiesDao logDao = new LogEntitiesDao();
    
    private String state = "";
    private String info  = "";
    
    /**
     * Metodos getter y setter por cada variable general de la clase
     */    
    public String getState() {
        return state;
    }

    public String getInfo() {
        return info;
    }

    public LogEntitiesDao getLogDao() {
        return logDao;
    }

    public void setLogDao(LogEntitiesDao logDao) {
        this.logDao = logDao;
    }      
    
    private String lanSel;

    public String getLanSel() {
        return lanSel;
    }

    public void setLanSel(String lanSel) {
        this.lanSel = lanSel;
    }
    
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }       
    
    @Override
    public void prepare() throws Exception {
        user = (Users) this.getSession().get(APConstants.SESSION_USER);
        idEntSystem = UsersDao.getEntitySystem(user.getIdUsr());  
        idUsrSystem = user.getIdUsr();
//        coCode = (String) user.getCountryUsr().getAcronymIdCo();
        coCode = (String) ActionContext.getContext().getSession().get(APConstants.COUNTRY_CODE);
        usrDao = new UsersDao();
        String lanTemp = (String) this.getSession().get(APConstants.SESSION_LANG);
        lanSel  = lanTemp.replace(coCode.toLowerCase(), "");
        prodCon = new ArrayList<ProductsControls>();
    }
    
    
    /**
     * Metodo encargado de validar el formulario de un control
     */
    @Override
    public void validate() {       
        /*
         * Se evalua dependiendo a la accion realizada:
         * 1) create: Al momento de guardar un registro por primera ves
         * 2) modify: Al momento de modificar un registro
         * 3) delete: Al momento de borrar un registro
         */
        if (actExe.equals("create") || actExe.equals("modify")) {
            boolean enter = false;
            sowing = sowDao.objectById(this.getIdCrop());
            HashMap required = new HashMap();
            required.put("con.dateCon", con.getDateCon());                  
            required.put("con.controlsTypes.idConTyp", con.getControlsTypes().getIdConTyp());    
		
            if (con.getTargetsTypes()!=null) {
                required.put("con.targetsTypes.idTarTyp", con.getTargetsTypes().getIdTarTyp());        
                if (con.getTargetsTypes().getIdTarTyp()==1) {
                    required.put("con.pests.idPes", con.getPests().getIdPes());
                    if (con.getPests().getIdPes() == 1000000) {
                        required.put("con.otherPestCon", con.getOtherPestCon());
                    }
                } else if (con.getTargetsTypes().getIdTarTyp()==2) {
                    required.put("con.weeds.idWee", con.getWeeds().getIdWee());
                    if (con.getWeeds().getIdWee() == 1000000) {
                        required.put("con.otroWeedCon", con.getOtroWeedCon());
                    }
                } else if (con.getTargetsTypes().getIdTarTyp()==3) {
                    required.put("con.diseases.idDis", con.getDiseases().getIdDis());
                    if (con.getDiseases().getIdDis() == 1000000) {
                        required.put("con.otherDiseaseCon", con.getOtherDiseaseCon());
                    }
                }
            }
            
            if (con.getControlsTypes()!=null) {
                if (con.getControlsTypes().getIdConTyp() == 2) {
                    required.put("con.chemicalsControls.idCheCon", con.getChemicalsControls().getIdCheCon());
    //                required.put("dosisConChe", dosisConChe);
    //                required.put("doseUnitsChe", doseUnitsChe);
                    if (con.getChemicalsControls().getIdCheCon() == 1000000) {
                        required.put("con.otherChemicalProductCon", con.getOtherChemicalProductCon());
                    }
                } else if (con.getControlsTypes().getIdConTyp() == 1) {
                    required.put("con.organicControls.idOrgCon", con.getOrganicControls().getIdOrgCon());
    //                required.put("dosisConOrg", dosisConOrg);
    //                required.put("doseUnitsOrg", doseUnitsOrg);
                    if (con.getOrganicControls().getIdOrgCon() == 1000000) {
                        required.put("con.otherOrganicProductCon", con.getOtherOrganicProductCon());
                    }
                } else if (con.getControlsTypes().getIdConTyp() == 3) {
        //			$fields[] = 'realiza_limpias';
                }	
            }
                                 			       	               
            
            for (Iterator it = required.keySet().iterator(); it.hasNext();) {
                String sK = (String) it.next();
                String sV = String.valueOf(required.get(sK));
//                System.out.println(sK + " : " + sV);
                if (StringUtils.trim(sV).equals("null") || StringUtils.trim(sV)==null || StringUtils.trim(sV).equals("") || sV.equals("-1")) {
                    addFieldError(sK, getText("message.fieldsrequired.control"));
                    enter = true;
                }
            }
            
            if (enter) {
                addActionError(getText("message.missingfields.control"));
            }	
            
            HashMap prod  = cropDao.findById(idCrop);
            Integer tyCro = Integer.parseInt(String.valueOf(prod.get("typeCrop")));
            Date dateSowing = null;
//            if (sowing.getDateSow()!=null) {
            if (sowing != null) {
                dateSowing = sowing.getDateSow();
                String dmySow  = new SimpleDateFormat("dd/MM/yyyy").format(sowing.getDateSow());
		
                if (!dmySow.equals("") && con.getDateCon()!=null) {

                    Integer valDiffBef = GlobalFunctions.compareDateBeforeSowingByAction(con.getDateCon(), sowing.getDateSow(), tyCro, 3);
                    Integer valDiffAff = GlobalFunctions.compareDateAfterSowingByAction(con.getDateCon(), sowing.getDateSow(), tyCro, 3);
                    if (valDiffBef==2 && valDiffAff==2) {
                        addFieldError("con.dateCon", getText("message.controldateinvalidrank.control"));       
                        if (tyCro==1) {
                            addActionError(getText("desc.controldateinvalidrankmaize.control")+" ("+dmySow+")");
                        } else if (tyCro==2) {
                            addActionError(getText("desc.controldateinvalidrankbeans.control")+" ("+dmySow+")");
                        } else if (tyCro==4) {
                            addActionError(getText("desc.controldateinvalidrankrice.control")+" ("+dmySow+")");
                        }
                    }				

                }	
            }
            
            if (dosisConChe!=null && (dosisConChe<0.1 || dosisConChe>1000)) {
                addFieldError("dosisConChe", getText("message.datainvalidrankchem.control"));                
                addActionError(getText("desc.datainvalidrankchem.control"));
            }

            if (dosisConOrg!=null && (dosisConOrg<0.1 || dosisConOrg>1000)) {
                addFieldError("dosisConOrg", getText("message.datainvalidrankorg.control"));                
                addActionError(getText("desc.datainvalidrankorg.control"));
            }
            
            if (dosisConMec!=null && (dosisConMec<0.1 || dosisConMec>1000)) {
                addFieldError("dosisConMec", getText("message.datainvalidrankmec.control"));                
                addActionError(getText("desc.datainvalidrankmec.control"));
            }
            
            if (dosisConMan!=null && (dosisConMan<0.1 || dosisConMan>1000)) {
                addFieldError("dosisConMan", getText("message.datainvalidrankman.control"));                
                addActionError(getText("desc.datainvalidrankman.control"));
            }

            sowing=null;            
        }
    }     
    
    /**
     * Se obtiene la lista de controles a partir de un tipo de objetivo seleccionado previamente
     * @param idTarget: Identificacion del tipo de objetivo
     * @param typeCrop: Identificacion del tipo de cultivo
     * @return lista de materiales geneticos
     */
    public String comboControls() {
        String chain = "<option value=\"\">---</option>";
        if(!this.getRequest().getParameter("idTarget").equals("-1")) {
            int idTarget = 0;
            try {
                idTarget   = Integer.parseInt(this.getRequest().getParameter("idTarget"));
            } catch (NumberFormatException e) {
                idTarget   = 0;
            }
            int typeCon    = Integer.parseInt(this.getRequest().getParameter("typeCon"));
            int typeCropId = Integer.parseInt(this.getRequest().getParameter("typeCrop"));
            
            if (idTarget != 0) {
                if (typeCon==1) {
                    type_prod_org_con = new OrganicControlsDao().findAllByTargetType(idTarget, typeCropId);
                } else if (typeCon==2 || typeCon==6) {
                    type_prod_che_con = new ChemicalsControlsDao().findAllByTargetType(idTarget, typeCropId, coCode);
                }
            }
            
            if (type_prod_org_con!=null) {
                for (OrganicControls data : type_prod_org_con) {
        //            System.out.println(data.toString());
                    chain += "<option value=\"" + data.getIdOrgCon()+ "\">" + data.getNameOrgCon()+ "</option>";
                }
            }
            
            if (type_prod_che_con!=null) {
                for (ChemicalsControls data : type_prod_che_con) {
//                    System.out.println(data.toString());
                    chain += "<option value=\"" + data.getIdCheCon()+ "\">" + data.getNameCheCon()+ "</option>";
                }
            }
        }
        type_prod_org_con = null;
        type_prod_che_con = null;
        state = "success";
        info  = chain;
        return "combo";
    }
    
    /**
     * Encargado de buscar las coincidencias de un formulario de busqueda, para cada uno de los
     * controles registrados a un usuario
     * @param valName:  Nombre del valor a buscar
     * @param valId:    Identificacion del valor a buscar
     * @param selected: Valor seleccionado
     * @return lista de controles
     */
    public String search() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        try {
            this.setIdCrop(Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            this.setIdCrop(-1);
        }
        
        HashMap findParams = new HashMap();        
        findParams.put("idEntUser", idEntSystem);
        findParams.put("idEvent", this.getIdCrop());
        findParams.put("coCode", coCode);
        listCont = conDao.findByParams(findParams);
        return SUCCESS;
    }
    

    /**
     * Encargado de mostrar en un formulario la informacion de un control de la identificacion
     * @param idCon:  Identificacion del control
     * @return Informacion del control
     */
    public String show() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/create") || !usrDao.getPrivilegeUser(idUsrSystem, "crop/modify")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        actExe = (String)(this.getRequest().getParameter("action"));
        try {
            this.setIdCrop(Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            this.setIdCrop(-1);
        }
        
        HashMap prod  = cropDao.findById(idCrop);
        Integer tyCro = Integer.parseInt(String.valueOf(prod.get("typeCrop")));
        this.setTypeCrop(tyCro);
        Boolean costRes = Boolean.valueOf(String.valueOf(prod.get("costCrop")));
        if (costRes) setCostCrop(1);
        else setCostCrop(2);
//        System.out.println("tyCro=>"+tyCro);
        
        try {
            this.setIdCon(Integer.parseInt(this.getRequest().getParameter("idCon")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            this.setIdCon(-1);
        }
        
        HashMap findParams = new HashMap();        
        findParams.put("idEntUser", idEntSystem);
        findParams.put("idEvent", this.getIdCrop());
        findParams.put("coCode", coCode);
        

        type_prod_org_con = new OrganicControlsDao().findAllByTargetType(0, tyCro);
        type_prod_che_con = new ChemicalsControlsDao().findAllByTargetType(0, tyCro, coCode);
        this.setType_tar_typ(new TargetsTypesDao().findAll(coCode));
        this.setType_dose_units(new DoseUnitsDao().findByParams("2,3,5", coCode));
        this.setType_con_typ(new ControlsTypesDao().findAllByTypeCrop(tyCro, coCode));
        this.setType_dis_con(new DiseasesDao().findAllByTypeCrop(tyCro, coCode));
        this.setType_pest_con(new PestsDao().findAllByTypeCrop(tyCro, coCode));
        this.setType_weeds_con(new WeedsDao().findAllByTypeCrop(tyCro, coCode));
        if (this.getIdCon()!= -1) {
            con    = conDao.objectById(this.getIdCon());     
            /*if (con.getDosisCon()!=null) {
                dosisConChe  = con.getDosisCon();
                dosisConOrg  = con.getDosisCon(); 
                dosisConMec  = con.getDosisCon(); 
                dosisConMan  = con.getDosisCon();                
            }*/
            
            if (con.getCostAppCon()!=null){            
                costAppCon=con.getCostAppCon();
            }
            
            if (con.getCostFormAppCon() !=null){            
                costFormAppCon=con.getCostFormAppCon();
            }
              
            if (con.getCostInputCon()!=null){            
                costInputCon=con.getCostInputCon();
            }
            
            prodCon = new ProductsControlsDao().getListProducts(this.getIdCon(), coCode);
            
            /*if (con.getDoseUnits()!=null) {
                doseUnitsChe = con.getDoseUnits().getIdDosUni();            
                doseUnitsOrg = con.getDoseUnits().getIdDosUni();
                doseUnitsMec = con.getDoseUnits().getIdDosUni();
                doseUnitsMan = con.getDoseUnits().getIdDosUni();
                
                if (coCode.equals("NI")) {
                    if(doseUnitsOrg==12) dosisConOrg = dosisConOrg*0.01522;
                    if(doseUnitsChe==12) dosisConChe = dosisConChe*0.01522;
                    if(doseUnitsMec==12) dosisConMec = dosisConMec*0.01522;
                    if(doseUnitsMan==12) dosisConMan = dosisConMan*0.01522;
                } 
            }*/            
            
//            if (con.getControlsTypes().getIdConTyp()==1) {
//                this.setType_prod_org_con(new OrganicControlsDao().findAllByTargetType(con.getTargetsTypes().getIdTarTyp(), tyCro));
//            } else if (con.getControlsTypes().getIdConTyp()==2) {
//                this.setType_prod_che_con(new ChemicalsControlsDao().findAllByTargetType(con.getTargetsTypes().getIdTarTyp(), tyCro, coCode));
//            }
//            if (con.getOtherPestCon()!=null && !con.getOtherPestCon().equals("")) con.setPests(new Pests(1000000, "Otro"));
//            if (con.getOtherDiseaseCon()!=null && !con.getOtherDiseaseCon().equals("")) con.setDiseases(new Diseases(1000000, "Otro"));
//            if (con.getOtroWeedCon()!=null && !con.getOtroWeedCon().equals("")) con.setWeeds(new Weeds(1000000, "Otro"));
//            if (con.getOtherChemicalProductCon()!=null && !con.getOtherChemicalProductCon().equals("")) con.setChemicalsControls(new ChemicalsControls(1000000, "Otro"));
//            if (con.getOtherOrganicProductCon()!=null && !con.getOtherOrganicProductCon().equals("")) con.setOrganicControls(new OrganicControls(1000000, "Otro"));
            
        } 
        return SUCCESS;
    }

    /**
     * Encargado de guardar la informacion suministrada por el usuario para un control
     * @return Estado del proceso
     */
    public String saveData() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/create") || !usrDao.getPrivilegeUser(idUsrSystem, "crop/modify")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        String action = "";
//        System.out.println("Entre a guardar la info");
        /*
         * Se evalua dependiendo a la accion realizada:
         * 1) create: Al momento de guardar un registro por primera ves
         * 2) modify: Al momento de modificar un registro
         * 3) delete: Al momento de borrar un registro
         */
        if (actExe.equals("create")) {
            action = "C";
        } else if (actExe.equals("modify")) {
            action = "M";
        }
        
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        Transaction tx = null;        

        try {
            tx = session.beginTransaction();           
            
            String dmy   = new SimpleDateFormat("yyyy-MM-dd").format(con.getDateCon());
            Date dateCon = new SimpleDateFormat("yyyy-MM-dd").parse(dmy);           
            con.setProductionEvents(new ProductionEvents(idCrop));
            con.setDateCon(dateCon);    
            
            if (action.equals("M")) {
                if (con.getIdCon()>0) {
                    List<ProductsControls> prodsOld = new ProductsControlsDao().getListProducts(con.getIdCon(), coCode);
                    for (ProductsControls prOld : prodsOld) {
                        session.delete(prOld);
                    }
                }
            }
            
            if (prodCon!=null) {
                for (ProductsControls prodNew : prodCon) {
                    if (prodNew!=null) {
                        prodNew.setIdProCon(null);
                        prodNew.setControls(con);
                        prodNew.setStatus(true);
                        if (coCode.equals("NI")) {                
                            prodNew.setDosisProCon(prodNew.getDosisProCon()*65.7143);
                        }
                        /*if (coCode.equals("NI")) {                
                            if(doseUnitsOrg==12) dosisConOrg = dosisConOrg*65.7143;
                            if(doseUnitsChe==12) dosisConChe = dosisConChe*65.7143;
                            if(doseUnitsMec==12) dosisConMec = dosisConMec*65.7143;
                            if(doseUnitsMan==12) dosisConMan = dosisConMan*65.7143;
                        }*/ 
                        if (prodNew.getControlsTypes().getIdConTyp()==1) {
                            prodNew.setChemicalsControls(null);
                            if (prodNew.getDoseUnits()==null) {
                                prodNew.setDoseUnits(null);
                            }             
                        } else if (prodNew.getControlsTypes().getIdConTyp()==2 || prodNew.getControlsTypes().getIdConTyp()==6) {
                            prodNew.setOrganicControls(null);
                            if (prodNew.getDoseUnits()==null ) { 
                                prodNew.setDoseUnits(null);
                            }              
                        } else if (prodNew.getControlsTypes().getIdConTyp()==4 || prodNew.getControlsTypes().getIdConTyp()==8) {
                            prodNew.setChemicalsControls(null);
                            prodNew.setOrganicControls(null);
                            if (prodNew.getDoseUnits()==null) { 
                                prodNew.setDoseUnits(null);
                            }              
                        } else if (prodNew.getControlsTypes().getIdConTyp()==5 || prodNew.getControlsTypes().getIdConTyp()==9) {
                            prodNew.setChemicalsControls(null);
                            prodNew.setOrganicControls(null);
                            if (prodNew.getDoseUnits()==null) { 
                                prodNew.setDoseUnits(null);
                            }                
                        }  

                        if (prodNew.getPests().getIdPes()==1000000 && prodNew.getOtherPestProCon()!=null && !prodNew.getOtherPestProCon().equals("")) {
                            prodNew.setPests(null);
                            prodNew.setOtherDiseaseProCon("");
                            prodNew.setOtroWeedProCon("");
                        } else {
                            prodNew.setOtherPestProCon("");
                        }

                        if (prodNew.getDiseases().getIdDis()==1000000 && prodNew.getOtherDiseaseProCon()!=null && !prodNew.getOtherDiseaseProCon().equals("")) {
            //                System.out.println("disease");
                            prodNew.setDiseases(null);
                            prodNew.setOtherPestProCon("");
                            prodNew.setOtroWeedProCon("");
                        } else {
                            prodNew.setOtherDiseaseProCon("");
                        }

                        if (prodNew.getWeeds().getIdWee()==1000000 && prodNew.getOtroWeedProCon()!=null && !prodNew.getOtroWeedProCon().equals("")) {
            //                System.out.println("weed");
                            prodNew.setWeeds(null);
                            prodNew.setOtherDiseaseProCon("");
                            prodNew.setOtherPestProCon("");
                        } else {
                            prodNew.setOtroWeedProCon("");
                        }

                        if (prodNew.getChemicalsControls()!=null && prodNew.getChemicalsControls().getIdCheCon()==1000000 && prodNew.getOtherChemicalProductProCon()!=null && !prodNew.getOtherChemicalProductProCon().equals("")) {
            //                System.out.println("chemical");
                            prodNew.setChemicalsControls(null);
                            prodNew.setOtherOrganicProductProCon("");
                        } else {
                            prodNew.setOtherChemicalProductProCon("");
                        }

                        if (prodNew.getOrganicControls()!=null && prodNew.getOrganicControls().getIdOrgCon()==1000000 && prodNew.getOtherOrganicProductProCon()!=null && !prodNew.getOtherOrganicProductProCon().equals("")) {
            //                System.out.println("organic");
                            prodNew.setOrganicControls(null);
                            prodNew.setOtherChemicalProductProCon("");
                        } else {
                            prodNew.setOtherOrganicProductProCon("");
                        }

                        if (prodNew.getTargetsTypes().getIdTarTyp()==1) {
                            prodNew.setWeeds(null);
                            prodNew.setDiseases(null);
                        } else if (prodNew.getTargetsTypes().getIdTarTyp()==2) {
                            prodNew.setPests(null);
                            prodNew.setDiseases(null);
                        } else if (prodNew.getTargetsTypes().getIdTarTyp()==3) {
                            prodNew.setWeeds(null);
                            prodNew.setPests(null);
                        }
                        
                        session.saveOrUpdate(prodNew);    
                    }
                }
            }   
            
            con.setStatus(true);
            session.saveOrUpdate(con);
            
            LogEntities log = null;            
            log = LogEntitiesDao.getData(idEntSystem, con.getIdCon(), "controls", action);
            if ((log==null && action.equals("C")) || action.equals("M")) {
                log = new LogEntities();
                log.setIdLogEnt(null);
                log.setIdEntityLogEnt(idEntSystem);
                log.setIdObjectLogEnt(con.getIdCon());
                log.setTableLogEnt("controls");
                log.setDateLogEnt(new Date());
                log.setActionTypeLogEnt(action);
                session.saveOrUpdate(log);
            }            
            tx.commit();           
            state = "success";            
            if (action.equals("C")) {
                info  = getText("message.successadd.control");
//                return "list";
            } else if (action.equals("M")) {
                info  = getText("message.successedit.control");
//                return "list";
            }
            HashMap prod  = cropDao.findById(idCrop);
            Integer tyCro = Integer.parseInt(String.valueOf(prod.get("typeCrop")));
            SfGuardUserDao sfDao = new SfGuardUserDao();
            SfGuardUser sfUser   = sfDao.getUserByLogin(user.getCreatedBy(), user.getNameUserUsr(), ""); 
//            GlobalFunctions.sendInformationCrop(idCrop, tyCro, sfUser.getId());
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
//            System.out.println("error->"+e.getMessage());
            state = "failure";
            if (action.equals("C")) {
                info  = getText("message.failadd.control");
            } else if (action.equals("M")) {
                info  = getText("message.failedit.control");
            }
        } catch (ParseException ex) {
            Logger.getLogger(ActionCon.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            session.close();
        }  
        
//        return ERROR;
        return "states";
    }
    
    /**
     * Encargado de borrar la informacion de un control apartir de su identificacion
     * @param idCon:  Identificacion del control
     * @return Estado del proceso
     */
    public String delete() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/delete")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        Integer idCon = 0;
        try {
            idCon = Integer.parseInt(this.getRequest().getParameter("idCon"));
        } catch (NumberFormatException e) {
            idCon = -1;
        }
        
        if (idCon==-1) {
            state = "failure";
            info  = getText("message.failgetinfo.control");
            return "states";
        }
        
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();            
            Controls pr = conDao.objectById(idCon);      
            pr.setStatus(false);
//            session.delete(pro);        
            session.saveOrUpdate(pr);
            
            LogEntities log = new LogEntities();
            log.setIdLogEnt(null);
            log.setIdEntityLogEnt(idEntSystem);
            log.setIdObjectLogEnt(pr.getIdCon());
            log.setTableLogEnt("controls");
            log.setDateLogEnt(new Date());
            log.setActionTypeLogEnt("D");
            session.saveOrUpdate(log);
//            logDao.save(log);
            tx.commit();         
            state = "success";
            info  = getText("message.successdelete.control");
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            state = "failure";
            info  = getText("message.faildelete.control");
        } finally {
            session.close();
        }      
        
        return "states";
    }
    
}
