//ActionFer.java


package org.aepscolombia.platform.controllers;

import com.opensymphony.xwork2.ActionContext;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.aepscolombia.platform.models.dao.AmendmentsFertilizationsDao;
import org.aepscolombia.platform.models.dao.AmendmentsFertilizersDao;
import org.aepscolombia.platform.models.dao.ApplicationTypesDao;
import org.aepscolombia.platform.models.dao.ChemicalElementsDao;
import org.aepscolombia.platform.models.dao.ChemicalFertilizationsDao;
import org.aepscolombia.platform.models.dao.ChemicalFertilizationsObj;
import org.aepscolombia.platform.models.dao.ChemicalFertilizersDao;
import org.aepscolombia.platform.models.dao.FertilizationsDao;
import org.aepscolombia.platform.models.dao.FertilizationsTypesDao;

import org.aepscolombia.platform.models.dao.LogEntitiesDao;
import org.aepscolombia.platform.models.dao.OrganicFertilizationsDao;
import org.aepscolombia.platform.models.dao.OrganicFertilizersDao;
import org.aepscolombia.platform.models.dao.ProductionEventsDao;
import org.aepscolombia.platform.models.dao.SfGuardUserDao;
import org.aepscolombia.platform.models.dao.SowingDao;
import org.aepscolombia.platform.models.dao.UsersDao;
import org.aepscolombia.platform.models.dao.WetSoilsDao;
import org.aepscolombia.platform.models.entity.AmendmentsFertilizations;
import org.aepscolombia.platform.models.entity.AmendmentsFertilizers;
import org.aepscolombia.platform.models.entity.ApplicationTypes;
import org.aepscolombia.platform.models.entity.ChemicalElements;
import org.aepscolombia.platform.models.entity.ChemicalFertilizations;
import org.aepscolombia.platform.models.entity.ChemicalFertilizerComposition;
import org.aepscolombia.platform.models.entity.ChemicalFertilizers;
import org.aepscolombia.platform.models.entity.ChemicalFertilizersCountry;
import org.aepscolombia.platform.models.entity.Fertilizations;
import org.aepscolombia.platform.models.entity.FertilizationsTypes;
import org.aepscolombia.platform.models.entity.IdiomCountry;

import org.aepscolombia.platform.models.entity.LogEntities;
import org.aepscolombia.platform.models.entity.ProductionEvents;
import org.aepscolombia.platform.models.entity.OrganicFertilizations;
import org.aepscolombia.platform.models.entity.OrganicFertilizers;
import org.aepscolombia.platform.models.entity.Sowing;
import org.aepscolombia.platform.models.entity.Users;
import org.aepscolombia.platform.models.entity.WetSoils;
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
 * Contiene los metodos para interactuar con el modulo de fertilizacion
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ActionFer extends BaseAction {
    
    /**
     * Atributos provenientes del formulario
     */
    private int idCrop;    
    private int idFer;    
    private int typeCrop;
    private int costCrop;
    private List<HashMap> listFert;
    private Users user;
    private Integer idEntSystem;    
    private Integer idUsrSystem;    
    private ProductionEvents event = new ProductionEvents();
    private Fertilizations fer = new Fertilizations();
    private ChemicalFertilizations ferChe = new ChemicalFertilizations();
    private OrganicFertilizations ferOrg = new OrganicFertilizations();
    private AmendmentsFertilizations ferAme = new AmendmentsFertilizations();
    private Sowing sowing = new Sowing();
    private List<FertilizationsTypes> type_fer_typ;
    private List<WetSoils> type_wet_soils;
    private List<ApplicationTypes> list_app_typ;
    private List<ChemicalFertilizers> type_prod_che;
    private List<OrganicFertilizers> type_prod_org;
    private List<AmendmentsFertilizers> type_prod_ame;
    
    private Double amountProductUsedChe=null;
    private Double amountProductUsedOrg=null;
    private Double amountProductUsedAme=null;
    private UsersDao usrDao;
    private String coCode;

    /**
     * Metodos getter y setter por cada variable del formulario
     */
    public int getIdFer() {
        return idFer;
    }

    public void setIdFer(int idFer) {
        this.idFer = idFer;
    }  

    public Double getAmountProductUsedChe() {
        return amountProductUsedChe;
    }

    public void setAmountProductUsedChe(Double amountProductUsedChe) {
        this.amountProductUsedChe = amountProductUsedChe;
    }

    public Double getAmountProductUsedOrg() {
        return amountProductUsedOrg;
    }

    public void setAmountProductUsedOrg(Double amountProductUsedOrg) {
        this.amountProductUsedOrg = amountProductUsedOrg;
    }

    public Double getAmountProductUsedAme() {
        return amountProductUsedAme;
    }

    public void setAmountProductUsedAme(Double amountProductUsedAme) {
        this.amountProductUsedAme = amountProductUsedAme;
    }

    public Sowing getSowing() {
        return sowing;
    }

    public void setSowing(Sowing sowing) {
        this.sowing = sowing;
    }      

    public Fertilizations getFer() {
        return fer;
    }

    public void setFer(Fertilizations fer) {
        this.fer = fer;
    }

    public ChemicalFertilizations getFerChe() {
        return ferChe;
    }

    public void setFerChe(ChemicalFertilizations ferChe) {
        this.ferChe = ferChe;
    }

    public OrganicFertilizations getFerOrg() {
        return ferOrg;
    }

    public void setFerOrg(OrganicFertilizations ferOrg) {
        this.ferOrg = ferOrg;
    }

    public AmendmentsFertilizations getFerAme() {
        return ferAme;
    }

    public void setFerAme(AmendmentsFertilizations ferAme) {
        this.ferAme = ferAme;
    }

    public List<WetSoils> getType_wet_soils() {
        return type_wet_soils;
    }

    public void setType_wet_soils(List<WetSoils> type_wet_soils) {
        this.type_wet_soils = type_wet_soils;
    }  

    public List<FertilizationsTypes> getType_fer_typ() {
        return type_fer_typ;
    }

    public void setType_fer_typ(List<FertilizationsTypes> type_fer_typ) {
        this.type_fer_typ = type_fer_typ;
    }

    public List<ApplicationTypes> getList_app_typ() {
        return list_app_typ;
    }

    public void setList_app_typ(List<ApplicationTypes> list_app_typ) {
        this.list_app_typ = list_app_typ;
    }
    
    public List<ChemicalFertilizers> getType_prod_che() {
        return type_prod_che;
    }

    public void setType_prod_che(List<ChemicalFertilizers> type_prod_che) {
        this.type_prod_che = type_prod_che;
    }     

    public List<OrganicFertilizers> getType_prod_org() {
        return type_prod_org;
    }

    public void setType_prod_org(List<OrganicFertilizers> type_prod_org) {
        this.type_prod_org = type_prod_org;
    }

    public List<AmendmentsFertilizers> getType_prod_ame() {
        return type_prod_ame;
    }

    public void setType_prod_ame(List<AmendmentsFertilizers> type_prod_ame) {
        this.type_prod_ame = type_prod_ame;
    }   

    public int getIdCrop() {
        return idCrop;
    }

    public void setIdCrop(int idCrop) {
        this.idCrop = idCrop;
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

    public List<HashMap> getListFert() {
        return listFert;
    }   
    
    /**
     * Atributos generales de clase
     */
    
    private ProductionEventsDao cropDao    = new ProductionEventsDao();
    private FertilizationsDao ferDao       = new FertilizationsDao();
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
    
    private Integer appTyp;

    public Integer getAppTyp() {
        return appTyp;
    }

    public void setAppTyp(Integer appTyp) {
        this.appTyp = appTyp;
    }   
    
    public int getCostCrop() {
        return costCrop;
    }

    public void setCostCrop(int costCrop) {
        this.costCrop = costCrop;
    }
    
    private List<ChemicalFertilizationsObj> chemFert; 

    public List<ChemicalFertilizationsObj> getChemFert() {
        return chemFert;
    }

    public void setChemFert(List<ChemicalFertilizationsObj> chemFert) {
        this.chemFert = chemFert;
    }
    
    private List<OrganicFertilizations> orgFert; 

    public List<OrganicFertilizations> getOrgFert() {
        return orgFert;
    }

    public void setOrgFert(List<OrganicFertilizations> orgFert) {
        this.orgFert = orgFert;
    }
    
    private List<AmendmentsFertilizations> amenFert; 

    public List<AmendmentsFertilizations> getAmenFert() {
        return amenFert;
    }

    public void setAmenFert(List<AmendmentsFertilizations> amenFert) {
        this.amenFert = amenFert;
    }
    
    private Integer numRows=0;

    public Integer getNumRows() {
        return numRows;
    }

    public void setNumRows(Integer numRows) {
        this.numRows = numRows;
    }    
    
    private List<ChemicalElements> additionalsElem;

    public List<ChemicalElements> getAdditionalsElem() {
        return additionalsElem;
    }

    public void setAdditionalsElem(List<ChemicalElements> additionalsElem) {
        this.additionalsElem = additionalsElem;
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

    public ProductionEvents getEvent() {
        return event;
    }

    public void setEvent(ProductionEvents event) {
        this.event = event;
    }
    
    
    
    @Override
    public void prepare() throws Exception {
        user   = (Users) this.getSession().get(APConstants.SESSION_USER);
        chemFert    = new ArrayList<ChemicalFertilizationsObj>();
        orgFert     = new ArrayList<OrganicFertilizations>();
        amenFert    = new ArrayList<AmendmentsFertilizations>();
        idEntSystem = UsersDao.getEntitySystem(user.getIdUsr());  
//        coCode = (String) user.getCountryUsr().getAcronymIdCo();
        coCode = (String) this.getSession().get(APConstants.COUNTRY_CODE);
        usrDao =  new UsersDao();
        idUsrSystem = user.getIdUsr();
        String lanTemp = (String) this.getSession().get(APConstants.SESSION_LANG);
        lanSel = lanTemp.replace(coCode.toLowerCase(), "");
        
    }
    
    /**
    * Acción que permite cargar una nueva fila de fertilización sea quimica, organica o de enmiendas.
    */
    public String showRowAdditional()
    {     
        actExe = (String)(this.getRequest().getParameter("action"));
        appTyp =    Integer.parseInt(this.getRequest().getParameter("appTyp"));
        costCrop =  Integer.parseInt(this.getRequest().getParameter("costCrop"));
        this.setNumRows(Integer.parseInt((this.getRequest().getParameter("numRows")))+1);
        String resAdd = "";
        this.setType_fer_typ(new FertilizationsTypesDao().findAll(coCode));
        this.setType_wet_soils(new WetSoilsDao().findAll(coCode));
        this.setList_app_typ(new ApplicationTypesDao().findAll(coCode));
        this.setType_prod_che(new ChemicalFertilizersDao().findAllByStatus(coCode));
        this.setType_prod_org(new OrganicFertilizersDao().findAllByStatus());
        this.setType_prod_ame(new AmendmentsFertilizersDao().findAllByStatus(coCode));

        if (appTyp==1) {
            ChemicalFertilizationsObj ferCheTemp = new ChemicalFertilizationsObj();
            for (int i=0;i<this.getNumRows();i++) {
                if (i==this.getNumRows()-1)
                    ferCheTemp.setAdditionalsElem(new ChemicalElementsDao().findByParams(ferCheTemp.getIdCheFer()));
                chemFert.add(ferCheTemp);
            }
                           
//            System.out.println("tamaño=>"+chemFert.size());            
            resAdd = "chemical";
        } else if (appTyp==2) {
            OrganicFertilizations ferOrgTemp = new OrganicFertilizations();
            orgFert.add(ferOrgTemp);
            resAdd = "organic";
        } else if (appTyp==3) {
            AmendmentsFertilizations ferAmenTemp = new AmendmentsFertilizations();
            amenFert.add(ferAmenTemp);
            resAdd = "amendment";
        }
        
        return resAdd;
    }
    
    
    /**
     * Metodo encargado de validar el formulario de una fertilizacion
     */
    @Override
    public void validate() {       
        /*
         * Se evalua dependiendo a la accion realizada:
         * 1) create: Al momento de guardar un registro por primera ves
         * 2) modify: Al momento de modificar un registro
         * 3) delete: Al momento de borrar un registro
         */
//        numberFormatter = NumberFormat.getNumberInstance(new Locale("en_US"));
//        quantityOut = numberFormatter.format(rasta.getLatitudRas());
        if (actExe.equals("create") || actExe.equals("modify")) {
            boolean enter = false;
            sowing = sowDao.objectById(this.getIdCrop());
            HashMap required = new HashMap();
            required.put("fer.dateFer", fer.getDateFer());      
            if (coCode.equals("NI")) {
                required.put("fer.wetSoils.idWeSo", fer.getWetSoils().getIdWeSo());      
            }
//            required.put("fer.amountProductUsedFer", fer.getAmountProductUsedFer());      
//            required.put("fer.fertilizationsTypes.idFerTyp", fer.getFertilizationsTypes().getIdFerTyp());                  
            
            if (chemFert.size()<=0 && orgFert.size()<=0 && amenFert.size()<=0) {
                addActionError(getText("message.insertsomefert.fertilization"));
            }
             
            Double amountTotal = 0.0;
            
            int contFer = 0;
            for (ChemicalFertilizationsObj ferCheTemp : chemFert) {
                if (ferCheTemp!=null) {
                    if (ferCheTemp.getAmountProductUsedCheFer()!=null) amountTotal += ferCheTemp.getAmountProductUsedCheFer();
                    required.put("chemFert["+contFer+"].chemicalFertilizers.idCheFer", ferCheTemp.getChemicalFertilizers().getIdCheFer());
                    required.put("chemFert["+contFer+"].amountProductUsedCheFer", ferCheTemp.getAmountProductUsedCheFer());
                    required.put("chemFert["+contFer+"].unitCheFer", ferCheTemp.getUnitCheFer());
                    required.put("chemFert["+contFer+"].applicationTypes.idAppTyp", ferCheTemp.getApplicationTypes().getIdAppTyp());
                    if (ferCheTemp.getChemicalFertilizers().getIdCheFer() == 1000000) {
                        required.put("chemFert["+contFer+"].otherProductCheFer", ferCheTemp.getOtherProductCheFer());
                    }                    
                }
                contFer++;
            }

//            if (fer.getFertilizationsTypes().getIdFerTyp() == 2) {
            int contOrg = 0;
            for (OrganicFertilizations ferOrgTemp : orgFert) {
                if (ferOrgTemp!=null) {
                    if (ferOrgTemp.getAmountProductUsedOrgFer()!=null) amountTotal += ferOrgTemp.getAmountProductUsedOrgFer();
                    required.put("orgFert["+contOrg+"].organicFertilizers.idOrgFer", ferOrgTemp.getOrganicFertilizers().getIdOrgFer());
                    required.put("orgFert["+contOrg+"].amountProductUsedOrgFer", ferOrgTemp.getAmountProductUsedOrgFer());
                    if (ferOrgTemp.getOrganicFertilizers().getIdOrgFer() == 1000000) {
                      required.put("orgFert["+contOrg+"].otherProductOrgFer", ferOrgTemp.getOtherProductOrgFer());
                    }
                }
                contOrg++;
            }

//            if (fer.getFertilizationsTypes().getIdFerTyp() == 3) {
            int contAme = 0;
            for (AmendmentsFertilizations ferAmeTemp : amenFert) {
                if (ferAmeTemp!=null) {
                    if (ferAmeTemp.getAmountProductUsedAmeFer()!=null) amountTotal += ferAmeTemp.getAmountProductUsedAmeFer();
                    required.put("amenFert["+contAme+"].amendmentsFertilizers.idAmeFer", ferAmeTemp.getAmendmentsFertilizers().getIdAmeFer());
                    required.put("amenFert["+contAme+"].amountProductUsedAmeFer", ferAmeTemp.getAmountProductUsedAmeFer());
                    if (ferAmeTemp.getAmendmentsFertilizers().getIdAmeFer() == 1000000) {
                      required.put("amenFert["+contAme+"].otherProductAmeFer", ferAmeTemp.getOtherProductAmeFer());
                    }
                }
                contAme++;
            }               
            
//            System.out.println("amountTotal=>"+amountTotal);
//            System.out.println("fer.getAmountProductUsedFer()=>"+fer.getAmountProductUsedFer());
            /*double sumTotal = amountTotal.doubleValue();
            double sumUser  = fer.getAmountProductUsedFer().doubleValue();
            if (sumTotal!=sumUser) {
                addFieldError("fer.amountProductUsedFer", "Los valores no coinciden");      
                contFer = 0;
                for (ChemicalFertilizationsObj ferCheTemp : chemFert) {
                    addFieldError("chemFert["+contFer+"].amountProductUsedCheFer", "Los valores no coinciden");
                    contFer++;
                }
                contOrg = 0;
                for (OrganicFertilizations ferOrgTemp : orgFert) {
                    addFieldError("orgFert["+contOrg+"].amountProductUsedOrgFer", "Los valores no coinciden");
                    contOrg++;
                }
                contAme = 0;
                for (AmendmentsFertilizations ferAmeTemp : amenFert) {      
                    addFieldError("amenFert["+contAme+"].amountProductUsedAmeFer", "Los valores no coinciden");
                    contAme++;
                }  
                addActionError("La cantidad del producto total debe ser igual a la suma de todas las cantidades individuales");
            }*/
            
            for (Iterator it = required.keySet().iterator(); it.hasNext();) {
                String sK = (String) it.next();
                String sV = String.valueOf(required.get(sK));
//                System.out.println(sK + " : " + sV);
                if (StringUtils.trim(sV).equals("null") || StringUtils.trim(sV)==null || StringUtils.trim(sV).equals("") || sV.equals("-1")) {
                    addFieldError(sK, getText("message.fieldsrequired.fertilization"));
                    enter = true;
                }
            }
            
            if (enter) {
                addActionError(getText("message.missingfields.fertilization"));
            }
            
            Date dateSowing = null;
            HashMap prod  = cropDao.findById(idCrop);
            Integer tyCro = Integer.parseInt(String.valueOf(prod.get("typeCrop")));
           
//            if (sowing.getDateSow()!=null) {
            if (sowing != null) {
                dateSowing = sowing.getDateSow();
                String dmySow  = new SimpleDateFormat("dd/MM/yyyy").format(sowing.getDateSow());

                if (!dmySow.equals("") && fer.getDateFer()!=null) {

                    Integer valDiffBef = GlobalFunctions.compareDateBeforeSowingByAction(fer.getDateFer(), sowing.getDateSow(), tyCro, 2);
                    Integer valDiffAff = GlobalFunctions.compareDateAfterSowingByAction(fer.getDateFer(), sowing.getDateSow(), tyCro, 2);
                    if (valDiffBef==2 && valDiffAff==2) {
                        addFieldError("fer.dateFer", getText("message.fertilizationdateinvalidrank.fertilization"));    
                        if (tyCro==1) {
                            addActionError(getText("desc.fertilizationdateinvalidrankmaize.fertilization")+" ("+dmySow+")");
                        } else if (tyCro==2) {
                            addActionError(getText("desc.fertilizationdateinvalidrankbeans.fertilization")+" ("+dmySow+")");
                        } else if (tyCro==4) {
                            addActionError(getText("desc.fertilizationdateinvalidrankrice.fertilization")+" ("+dmySow+")");
                        }
                    }

                }
            }
            
            if (chemFert!=null) {
//                if (fer.getFertilizationsTypes().getIdFerTyp() == 1 && ferChe.getChemicalFertilizers().getIdCheFer() == 1000000 && ferChe.getApplicationTypes().getIdAppTyp()==1) {
                    
                    contFer = 0;
                    for (ChemicalFertilizationsObj ferCheTemp : chemFert) {
                        if (ferCheTemp!=null) {
                            if (ferCheTemp.getChemicalFertilizers().getIdCheFer() == 1000000 && ferCheTemp.getApplicationTypes().getIdAppTyp()==1) {
                                Boolean entry = false;
                                Boolean errorCom = false;
                                int cont = 0;
                                for (ChemicalElements chem : ferCheTemp.getAdditionalsElem()) {
                                    if (chem.getValueCheEle()!=null) {
                                        entry = true;
                                    }

                                    if (chem.getValueCheEle()!=null && (chem.getValueCheEle()<0 || chem.getValueCheEle()>100)) {
                                        addFieldError("chemFert["+contFer+"].additionalsElem["+cont+"].valueCheEle", getText("message.invalidcomposition.fertilization"));
                                        errorCom = true;
                                    }                                
                                }

                                if (errorCom) {
                                    addActionError(getText("desc.invalidcomposition.fertilization"));
                                }

                                if (!entry) {
                                    for (int i=0; i<ferCheTemp.getAdditionalsElem().size(); i++) {                      
                                        addFieldError("chemFert["+contFer+"].additionalsElem["+i+"].valueCheEle", ""); 
                                    }
                                    addActionError(getText("desc.insertsomecomposition.fertilization"));
                                }
                            }
                        }
                        contFer++;
                    }
//                }
            }           
            sowing=null;            
        }
    }     
    
    /**
     * Encargado de buscar las coincidencias de un formulario de busqueda, para cada uno de las
     * fertilizaciones registrados a un usuario
     * @param valName:  Nombre del valor a buscar
     * @param valId:    Identificacion del valor a buscar
     * @param selected: Valor seleccionado
     * @return lista de fertilizaciones
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
        listFert = ferDao.findByParams(findParams);
        return SUCCESS;
    }
    

    /**
     * Encargado de mostrar en un formulario la informacion de una fertilizacion de la identificacion
     * @param idFer:  Identificacion de la fertilizacion
     * @return Informacion de la fertilizacion
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
        //typeCrop = Integer.parseInt(String.valueOf(prod.get("typeCrop")));
        try {
            this.setTypeCrop(Integer.parseInt(this.getRequest().getParameter("typeCrop")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            //this.setIdCrop(-1);
        }
        //setTypeCrop(tyCro);
        //event  = cropDao.objectById(this.getIdCrop());
        //typeCrop = event.getCropsTypes().getIdCroTyp();
        
//        System.out.println("tyCro=>"+tyCro);
        
        try {
            this.setIdFer(Integer.parseInt(this.getRequest().getParameter("idFer")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            this.setIdFer(-1);
        }

        this.setType_fer_typ(new FertilizationsTypesDao().findAll(coCode));
        this.setType_wet_soils(new WetSoilsDao().findAll(coCode));
        this.setList_app_typ(new ApplicationTypesDao().findAll(coCode));
        this.setType_prod_che(new ChemicalFertilizersDao().findAllByStatus(coCode));
        this.setType_prod_org(new OrganicFertilizersDao().findAllByStatus());
        this.setType_prod_ame(new AmendmentsFertilizersDao().findAllByStatus(coCode));
        Boolean costRes = Boolean.valueOf(String.valueOf(prod.get("costCrop")));
        if (costRes) setCostCrop(1);
        else setCostCrop(2);
//        additionalsElem = new ChemicalElementsDao().findByParams(this.getIdFer());
        if (this.getIdFer()!= -1) {
            fer      = ferDao.objectById(this.getIdFer());
            chemFert = new ChemicalFertilizationsDao().getListChemFert(this.getIdFer(), coCode);
            orgFert  = new OrganicFertilizationsDao().getListOrgFert(this.getIdFer(), coCode);
            amenFert = new AmendmentsFertilizationsDao().getListAmeFert(this.getIdFer(), coCode);
            
//            ferChe = new ChemicalFertilizationsDao().objectById(this.getIdFer());            
//            ferOrg = new OrganicFertilizationsDao().objectById(this.getIdFer());            
//            ferAme = new AmendmentsFertilizationsDao().objectById(this.getIdFer());   
//            amountProductUsedChe = fer.getAmountProductUsedFer();
//            amountProductUsedOrg = fer.getAmountProductUsedFer();
//            amountProductUsedAme = fer.getAmountProductUsedFer(); 
        } 
        return SUCCESS;
    }

    /**
     * Encargado de guardar la informacion suministrada por el usuario para una fertilizacion
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
            
            String dmy   = new SimpleDateFormat("yyyy-MM-dd").format(fer.getDateFer());
            Date dateFer = new SimpleDateFormat("yyyy-MM-dd").parse(dmy);
            
            fer.setProductionEvents(new ProductionEvents(idCrop));
            fer.setDateFer(dateFer);          
            fer.setFertilizationsTypes(null);
            if (!coCode.equals("NI")) {
                fer.setWetSoils(null);
            } 
//            else {
//                fer.setWetSoils(new WetSoils());
//            }
            
//            if (fer.getFertilizationsTypes().getIdFerTyp()==1) {
//                fer.setAmountProductUsedFer(amountProductUsedChe);
//            } else if (fer.getFertilizationsTypes().getIdFerTyp()==2) {
//                fer.setAmountProductUsedFer(amountProductUsedOrg);
//            } else if (fer.getFertilizationsTypes().getIdFerTyp()==3) {
//                fer.setAmountProductUsedFer(amountProductUsedAme);
//            }            
            
//            if (sowing.getChemicalsSowing().getIdCheSow()==-1) {
//                sowing.setChemicalsSowing(null);
//            }            
//            if (sowing.getDoseUnits().getIdDosUni()==-1) {
//                sowing.setDoseUnits(null);
//            }        
            fer.setStatus(true);
            session.saveOrUpdate(fer);
            
            double amountProduct=0;
            
            if (action.equals("M")) {
                if (fer.getIdFer()>0) {
                    List<ChemicalFertilizations> chemFertOld = new ChemicalFertilizationsDao().getListChemFertOld(fer.getIdFer());
                    for (ChemicalFertilizations ferCheOld : chemFertOld) {
                        session.delete(ferCheOld);
                    }
                    
                    List<OrganicFertilizations> orgFertOld = new OrganicFertilizationsDao().getListOrgFert(fer.getIdFer(), coCode);
                    for (OrganicFertilizations ferOrgOld : orgFertOld) {
                        session.delete(ferOrgOld);
                    }
                    
                    List<AmendmentsFertilizations> ameFertOld = new AmendmentsFertilizationsDao().getListAmeFert(fer.getIdFer(), coCode);
                    for (AmendmentsFertilizations ferAmeOld : ameFertOld) {
                        session.delete(ferAmeOld);
                    }
                    
                    
//                    ChemicalFertilizations ferCheTemp  = new ChemicalFertilizationsDao().objectById(this.getIdFer());
//                    OrganicFertilizations ferOrgTemp  = new OrganicFertilizationsDao().objectById(this.getIdFer());
//                    AmendmentsFertilizations ferAmeTemp  = new AmendmentsFertilizationsDao().objectById(this.getIdFer());
//                    if (fer.getFertilizationsTypes().getIdFerTyp()==1) {
//                        if (ferOrgTemp!=null) session.delete(ferOrgTemp);
//                        if (ferAmeTemp!=null) session.delete(ferAmeTemp);                    
//                    } else if (fer.getFertilizationsTypes().getIdFerTyp()==2) {
//                        if (ferCheTemp!=null) session.delete(ferCheTemp);
//                        if (ferAmeTemp!=null) session.delete(ferAmeTemp);
//                    } else if (fer.getFertilizationsTypes().getIdFerTyp()==3) {
//                        if (ferCheTemp!=null) session.delete(ferCheTemp);
//                        if (ferOrgTemp!=null) session.delete(ferOrgTemp);
//                    }
                }
            }
            
//            throw new HibernateException("Fallo creado"); 
            
            if (chemFert!=null) {                
                for (ChemicalFertilizationsObj ferCheTemp : chemFert) {
                    ChemicalFertilizers cheFer = null;
                    ChemicalFertilizersCountry chemFerCountry = null;
                    if (ferCheTemp!=null) {
                        if (ferCheTemp.getOtherProductCheFer()!=null && !ferCheTemp.getOtherProductCheFer().equals("") && ferCheTemp.getApplicationTypes().getIdAppTyp()==1 && ferCheTemp.getChemicalFertilizers().getIdCheFer()==1000000) {
                            ChemicalFertilizations cheFerOld = new ChemicalFertilizationsDao().chemicalById(ferCheTemp.getIdCheFer());
                            if (cheFerOld!=null && !cheFerOld.getOtherProductCheFer().equals("")) cheFer  = new ChemicalFertilizersDao().objectById(ferCheTemp.getIdCheFer());
                            if (cheFer!=null) {
                                chemFerCountry = new ChemicalFertilizersDao().fertilizerByCountry(cheFer.getIdCheFer(), coCode);
                                if (chemFerCountry!=null) session.delete(chemFerCountry);     
                                session.delete(cheFer);
                            }

                            cheFer = new ChemicalFertilizers();
                            cheFer.setNameCheFer(ferCheTemp.getOtherProductCheFer());
                            cheFer.setStatusCheFer(false);
                            session.saveOrUpdate(cheFer);
                            
                            chemFerCountry = new ChemicalFertilizersCountry();
                            chemFerCountry.setChemicalFertilizers(cheFer);
                            chemFerCountry.setIdiomCountry(new IdiomCountry(coCode));
                            session.saveOrUpdate(chemFerCountry);

                            ferCheTemp.setChemicalFertilizers(cheFer);

                            for (ChemicalElements elem : ferCheTemp.getAdditionalsElem()) {
                                if (elem.getValueCheEle()!=null) {
                                    ChemicalFertilizerComposition chem = new ChemicalFertilizerComposition();
                                    chem.setChemicalElements(elem);
                                    chem.setChemicalFertilizers(cheFer);
                                    chem.setPercentageCheFerCom(elem.getValueCheEle());
                                    Double quant = (ferCheTemp.getAmountProductUsedCheFer()*elem.getValueCheEle())/100;

                                    chem.setRawElementQuantityCheFerCom(quant);
                                    session.saveOrUpdate(chem);
                                }
                            }
                        }             
                        
                        amountProduct += ferCheTemp.getAmountProductUsedCheFer();
                        ChemicalFertilizations chemFer = new ChemicalFertilizations();           
                        Integer idCheFer = ferCheTemp.getIdCheFer();
//                        System.out.println("idCheFer=>"+idCheFer);
//                        if (idCheFer!=null) {
//                            chemFer.setIdCheFer(idCheFer);
//                        } else {
//                            chemFer.setIdCheFer(null);
//                        }
                        
//                        chemFer.setIdCheFer(idCheFer);
//                        chemFer.setIdCheFer(null);
                        chemFer.setFertilizations(fer);
                        chemFer.setStatus(true);
                        chemFer.setCostAppCheFer(ferCheTemp.getCostAppCheFer());
                        chemFer.setCostFormAppCheFer(ferCheTemp.getCostFormAppCheFer());
                        chemFer.setCostProductCheFer(ferCheTemp.getCostProductCheFer());
                        if(ferCheTemp.getApplicationTypes().getIdAppTyp()==2){
                            chemFer.setChemicalFertilizers(null);
                            chemFer.setOtherProductCheFer(ferCheTemp.getOtherProductCheFer());
                        } else {
                            chemFer.setChemicalFertilizers(ferCheTemp.getChemicalFertilizers());
                            chemFer.setOtherProductCheFer(ferCheTemp.getOtherProductCheFer());
                        }                
                        chemFer.setApplicationTypes(ferCheTemp.getApplicationTypes());
                        if (coCode.equals("NI")) {                
                            if(ferCheTemp.getUnitCheFer()==12) ferCheTemp.setAmountProductUsedCheFer(ferCheTemp.getAmountProductUsedCheFer()*65.7143);
                        } 
                        chemFer.setAmountProductUsedCheFer(ferCheTemp.getAmountProductUsedCheFer());
                        chemFer.setUnitCheFer(ferCheTemp.getUnitCheFer());

//                        ferCheTemp.setAdditionalsElem(null);
//                        ferCheTemp.setFertilizations(fer);
//                        ferCheTemp.setStatus(true);
                        session.saveOrUpdate(chemFer);   
                    }
                }
            } 
            
            if (orgFert!=null) {
                for (OrganicFertilizations ferOrgNew : orgFert) {
                    if (ferOrgNew!=null) {
                        ferOrgNew.setIdOrgFer(null);
                        ferOrgNew.setFertilizations(fer);
                        ferOrgNew.setStatus(true);
//                        if (ferOrgNew.getOrganicFertilizers().getIdOrgFer()==1000000 && ferOrgNew.getOtherProductOrgFer()!=null && !ferOrgNew.getOtherProductOrgFer().equals("")) {
//                            ferOrgNew.setOrganicFertilizers(null);
//                        } 
                        ferOrgNew.setFertilizations(fer);
                        ferOrgNew.setStatus(true);
                        if (coCode.equals("NI")) {                
                            ferOrgNew.setAmountProductUsedOrgFer(ferOrgNew.getAmountProductUsedOrgFer()*65.7143);
                        }
                        amountProduct += ferOrgNew.getAmountProductUsedOrgFer();
                        session.saveOrUpdate(ferOrgNew);    
                    }
                }
            } 
            
            if (amenFert!=null) {
                for (AmendmentsFertilizations ferAmeNew : amenFert) {
                    if (ferAmeNew!=null) {
                        ferAmeNew.setIdAmeFer(null);
                        ferAmeNew.setFertilizations(fer);
                        ferAmeNew.setStatus(true);
//                        if (ferAmeNew.getAmendmentsFertilizers().getIdAmeFer()==1000000 && ferAmeNew.getOtherProductAmeFer()!=null && !ferAmeNew.getOtherProductAmeFer().equals("")) {
//                            ferAmeNew.setAmendmentsFertilizers(null);
//                        }
                        ferAmeNew.setFertilizations(fer);
                        ferAmeNew.setStatus(true);
                        if (coCode.equals("NI")) {                
                            ferAmeNew.setAmountProductUsedAmeFer(ferAmeNew.getAmountProductUsedAmeFer()*65.7143);
                        }
                        amountProduct += ferAmeNew.getAmountProductUsedAmeFer();
                        session.saveOrUpdate(ferAmeNew);  
                    }
                }
            }     
            
            fer.setAmountProductUsedFer(amountProduct);
            session.saveOrUpdate(fer);
            
            LogEntities log = null;            
            log = LogEntitiesDao.getData(idEntSystem, fer.getIdFer(), "fertilizations", action);
            if ((log==null && action.equals("C")) || action.equals("M")) {
                log = new LogEntities();
                log.setIdLogEnt(null);
                log.setIdEntityLogEnt(idEntSystem);
                log.setIdObjectLogEnt(fer.getIdFer());
                log.setTableLogEnt("fertilizations");
                log.setDateLogEnt(new Date());
                log.setActionTypeLogEnt(action);
                session.saveOrUpdate(log);
            }      
            tx.commit();           
            state = "success";            
            if (action.equals("C")) {
                info  = getText("message.successadd.fertilization");
//                return "list";
            } else if (action.equals("M")) {
                info  = getText("message.successedit.fertilization");
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
                info  = getText("message.failadd.fertilization");
            } else if (action.equals("M")) {
                info  = getText("message.failedit.fertilization");
            }
        } catch (Exception e) { 
            e.printStackTrace();
        } finally {
            session.close();
        }  
        
//        return ERROR;
        return "states";
    }
    
    /**
     * Encargado de borrar la informacion de una fertilizacion apartir de su identificacion
     * @param idFer:  Identificacion de la fertilizacion
     * @return Estado del proceso
     */
    public String delete() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/delete")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        Integer idFer = 0;
        try {
            idFer = Integer.parseInt(this.getRequest().getParameter("idFer"));
        } catch (NumberFormatException e) {
            idFer = -1;
        }
        
        if (idFer==-1) {
            state = "failure";
            info  = getText("message.failgetinfo.fertilization");
            return "states";
        }
        
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();            
            Fertilizations pr = ferDao.objectById(idFer);      
            pr.setStatus(false);
//            session.delete(pro);        
            session.saveOrUpdate(pr);
            
            LogEntities log = new LogEntities();
            log.setIdLogEnt(null);
            log.setIdEntityLogEnt(idEntSystem);
            log.setIdObjectLogEnt(pr.getIdFer());
            log.setTableLogEnt("fertilizations");
            log.setDateLogEnt(new Date());
            log.setActionTypeLogEnt("D");
            session.saveOrUpdate(log);
//            logDao.save(log);
            tx.commit();         
            state = "success";
            info  = getText("message.successdelete.fertilization");
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            state = "failure";
            info  = getText("message.faildelete.fertilization");
        } finally {
            session.close();
        }      
        
        return "states";
    }
    
}