
package org.aepscolombia.platform.controllers;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.WriteResult;
import com.opensymphony.xwork2.ActionContext;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.aepscolombia.platform.models.dao.AssociationDao;
import org.aepscolombia.platform.models.dao.BeansDao;
import org.aepscolombia.platform.models.dao.CassavasDao;
import org.aepscolombia.platform.models.dao.ChemicalsSowingDao;
import org.aepscolombia.platform.models.dao.ControlsDao;
import org.aepscolombia.platform.models.dao.CropsTypesDao;
import org.aepscolombia.platform.models.dao.DepartmentsDao;
import org.aepscolombia.platform.models.dao.DescriptionsProductionEventDao;
import org.aepscolombia.platform.models.dao.DocumentsTypesDao;
import org.aepscolombia.platform.models.dao.DoseUnitsDao;
import org.aepscolombia.platform.models.dao.EntitiesDao;
import org.aepscolombia.platform.models.dao.FertilizationsDao;

import org.aepscolombia.platform.models.dao.LogEntitiesDao;
import org.aepscolombia.platform.models.dao.FieldsDao;
import org.aepscolombia.platform.models.dao.GenotypesDao;
import org.aepscolombia.platform.models.dao.GenotypesSowingDao;
import org.aepscolombia.platform.models.dao.GrowingEnvironmentDao;
import org.aepscolombia.platform.models.dao.HarvestMethodsDao;
import org.aepscolombia.platform.models.dao.HarvestsDao;
import org.aepscolombia.platform.models.dao.CostIndirectProductionEventDao;
import org.aepscolombia.platform.models.dao.IrrigationDao;
import org.aepscolombia.platform.models.dao.MaizeDao;
import org.aepscolombia.platform.models.dao.MonitoringDao;
import org.aepscolombia.platform.models.dao.PhysiologicalMonitoringDao;
import org.aepscolombia.platform.models.dao.PreparationsDao;
import org.aepscolombia.platform.models.dao.ProductionEventsDao;
import org.aepscolombia.platform.models.dao.ResidualsManagementDao;
import org.aepscolombia.platform.models.dao.ResultingProductsDao;
import org.aepscolombia.platform.models.dao.RiceDao;
import org.aepscolombia.platform.models.dao.RiceSystemDao;
import org.aepscolombia.platform.models.dao.SeedsColorsDao;
import org.aepscolombia.platform.models.dao.SeedsInoculationsDao;
import org.aepscolombia.platform.models.dao.SeedsOriginsDao;
import org.aepscolombia.platform.models.dao.SeedsTypesDao;
import org.aepscolombia.platform.models.dao.SfGuardUserDao;
import org.aepscolombia.platform.models.dao.SowingDao;
import org.aepscolombia.platform.models.dao.SowingTypesDao;
import org.aepscolombia.platform.models.dao.UsersDao;
import org.aepscolombia.platform.models.entity.Beans;
import org.aepscolombia.platform.models.entity.Cassavas;
import org.aepscolombia.platform.models.entity.ChemicalsSowing;
import org.aepscolombia.platform.models.entity.CropsTypes;
import org.aepscolombia.platform.models.entity.Departments;
import org.aepscolombia.platform.models.entity.DocumentsTypes;
import org.aepscolombia.platform.models.entity.DoseUnits;
import org.aepscolombia.platform.models.entity.Entities;
import org.aepscolombia.platform.models.entity.Fields;
import org.aepscolombia.platform.models.entity.Genotypes;
import org.aepscolombia.platform.models.entity.GenotypesSowing;
import org.aepscolombia.platform.models.entity.GrowingEnvironment;
import org.aepscolombia.platform.models.entity.HarvestMethods;
import org.aepscolombia.platform.models.entity.Harvests;
import org.aepscolombia.platform.models.entity.CostIndirectProductionEvent;
import org.aepscolombia.platform.models.entity.LogEntities;
import org.aepscolombia.platform.models.entity.Maize;
import org.aepscolombia.platform.models.entity.PhysiologicalMonitoring;
import org.aepscolombia.platform.models.entity.ProductionEvents;
import org.aepscolombia.platform.models.entity.ResultingProducts;
import org.aepscolombia.platform.models.entity.Rice;
import org.aepscolombia.platform.models.entity.RiceSystem;
import org.aepscolombia.platform.models.entity.SeedsColors;
import org.aepscolombia.platform.models.entity.SeedsInoculations;
import org.aepscolombia.platform.models.entity.SeedsOrigins;
import org.aepscolombia.platform.models.entity.SeedsTypes;
import org.aepscolombia.platform.models.entity.Sowing;
import org.aepscolombia.platform.models.entity.SowingTypes;
import org.aepscolombia.platform.models.entity.Users;
import org.aepscolombia.platform.models.entityservices.SfGuardUser;
import org.aepscolombia.platform.util.APConstants;
import org.aepscolombia.platform.util.GlobalFunctions;
import org.aepscolombia.platform.util.HibernateUtil;

import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.simple.JSONObject;

/**
 * Clase ActionCrop
 *
 * Contiene los metodos para interactuar con el modulo de Cultivo
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ActionCrop extends BaseAction {
    
    /**
     * Atributos provenientes del formulario
     */
    private int idField;
    private Integer idCrop;
    private String nameField;
    private int typeCrop;
    private int lastCrop;  
    
    private String nameTypeCrop;
    private String lastTypeCrop;
    private String nameDrainPlot;
    private Double areaCrop;
    private Double areaCropHec;
    private Integer typeArea;
    private Boolean costCrop; 
    private Double availableArea;
    private Boolean totallyArea;
    private Double areaField;
    
    private String name_producer;
    private String type_doc;
    private String date_sowing;
    private String date_harvest;
    private String num_doc;
    private Integer num_farm;
    private String name_farm;
    private Integer num_field;
    private String name_field;
    private String otherCrop;
    
    private String search_crop; 
    private List<HashMap> listCrops;
    
    private List<HashMap> listPrep;
    private List<HashMap> listResMan;
    private List<HashMap> listDesPro;
    private List<HashMap> listIrr;
    private List<HashMap> listFert;
    private List<HashMap> listCont;
    private List<HashMap> listMont;
    
    
    private List<DocumentsTypes> type_ident_producer;
    
    private List<ChemicalsSowing> type_chem_sow;
    private List<DoseUnits> type_dose_units;
    private List<Genotypes> type_genotypes;
    private List<GenotypesSowing> type_genotypes_sow;
    private List<GrowingEnvironment> type_grow_env;
    private List<SeedsInoculations> type_seed_in;
    private List<HarvestMethods> type_harv_meth;
    private List<ResultingProducts> type_res_pro;
    private List<SeedsColors> type_seed_color;
    private List<RiceSystem> type_rice_system;
    private List<SeedsOrigins> type_seed_org;
    private List<SeedsTypes> type_seed_type;   
    private List<SowingTypes> type_sow_types;   
    private List<Departments> list_departments;
    
    private List<CropsTypes> type_crops;
    private Integer searchFromCrop;
    
    private Users user;
    private Integer idEntSystem;    
    private Integer idUsrSystem;    

    private Beans beans   = new Beans();
    private Cassavas cass = new Cassavas();
    private Harvests harv = new Harvests();
    private CostIndirectProductionEvent costo = new CostIndirectProductionEvent();
    private Maize maize   = new Maize();
    private Rice rice     = new Rice();
    private PhysiologicalMonitoring phys = new PhysiologicalMonitoring();
    private Sowing sowing = new Sowing();
    private ProductionEvents event = new ProductionEvents();
    private UsersDao usrDao;
    private List<Entities> list_agronomist;
    private AssociationDao assDao;
    private String coCode;

    /**
     * Metodos getter y setter por cada variable del formulario
     */
    public Beans getBeans() {
        return beans;
    }

    public void setBeans(Beans beans) {
        this.beans = beans;
    }

    public ProductionEvents getEvent() {
        return event;
    }

    public void setEvent(ProductionEvents event) {
        this.event = event;
    }
    
    public Cassavas getCass() {
        return cass;
    }

    public void setCass(Cassavas cass) {
        this.cass = cass;
    }

    public Harvests getHarv() {
        return harv;
    }

    public void setHarv(Harvests harv) {
        this.harv = harv;
    }

     public CostIndirectProductionEvent getCosto() {
        return costo;
    }

    public void setCosto(CostIndirectProductionEvent costo) {
        this.costo = costo;
    }

    public Maize getMaize() {
        return maize;
    }

    public void setMaize(Maize maize) {
        this.maize = maize;
    }

    public Rice getRice() {
        return rice;
    }

    public void setRice(Rice rice) {
        this.rice = rice;
    }    

    public PhysiologicalMonitoring getPhys() {
        return phys;
    }

    public void setPhys(PhysiologicalMonitoring phys) {
        this.phys = phys;
    }

    public Sowing getSowing() {
        return sowing;
    }

    public void setSowing(Sowing sowing) {
        this.sowing = sowing;
    } 

    public String getDate_sowing() {
        return date_sowing;
    }

    public void setDate_sowing(String date_sowing) {
        this.date_sowing = date_sowing;
    }

    public String getDate_harvest() {
        return date_harvest;
    }

    public void setDate_harvest(String date_harvest) {
        this.date_harvest = date_harvest;
    }

    public List<Entities> getList_agronomist() {
        return list_agronomist;
    }

    public void setList_agronomist(List<Entities> list_agronomist) {
        this.list_agronomist = list_agronomist;
    }

    public AssociationDao getAssDao() {
        return assDao;
    }

    public void setAssDao(AssociationDao assDao) {
        this.assDao = assDao;
    }   

    public String getNameField() {
        return nameField;
    }

    public void setNameField(String nameField) {
        this.nameField = nameField;
    } 

    public List<Departments> getList_departments() {
        return list_departments;
    }

    public void setList_departments(List<Departments> list_departments) {
        this.list_departments = list_departments;
    } 
    
    public String getOtherCrop() {
        return otherCrop;
    }

    public void setOtherCrop(String otherCrop) {
        this.otherCrop = otherCrop;
    } 

    public Integer getSearchFromCrop() {
        return searchFromCrop;
    }

    public void setSearchFromCrop(Integer searchFromCrop) {
        this.searchFromCrop = searchFromCrop;
    }   
        
    public int getIdField() {
        return idField;
    }

    public void setIdField(int idField) {
        this.idField = idField;
    }

    public Integer getIdCrop() {
        return idCrop;
    }

    public void setIdCrop(Integer idCrop) {
        this.idCrop = idCrop;
    }

    public String getNameTypeCrop() {
        return nameTypeCrop;
    }

    public void setNameTypeCrop(String nameTypeCrop) {
        this.nameTypeCrop = nameTypeCrop;
    }   

    public String getNameDrainPlot() {
        return nameDrainPlot;
    }   

    public String getLastTypeCrop() {
        return lastTypeCrop;
    }   

    public int getTypeCrop() {
        return typeCrop;
    }

    public void setTypeCrop(int typeCrop) {
        this.typeCrop = typeCrop;
    }

    public int getLastCrop() {
        return lastCrop;
    }

    public void setLastCrop(int lastCrop) {
        this.lastCrop = lastCrop;
    }

    public String getSearch_crop() {
        return search_crop;
    }

    public void setSearch_crop(String search_crop) {
        this.search_crop = search_crop;
    }    
    
    public void setType_ident_producer(List<DocumentsTypes> type_ident_producer) {
        this.type_ident_producer = type_ident_producer;
    }

    public List<DocumentsTypes> getType_ident_producer() {
        return type_ident_producer;
    }

    public List<ChemicalsSowing> getType_chem_sow() {
        return type_chem_sow;
    }

    public void setType_chem_sow(List<ChemicalsSowing> type_chem_sow) {
        this.type_chem_sow = type_chem_sow;
    }

    public List<DoseUnits> getType_dose_units() {
        return type_dose_units;
    }

    public void setType_dose_units(List<DoseUnits> type_dose_units) {
        this.type_dose_units = type_dose_units;
    }

    public List<Genotypes> getType_genotypes() {
        return type_genotypes;
    }

    public void setType_genotypes(List<Genotypes> type_genotypes) {
        this.type_genotypes = type_genotypes;
    }

    public List<GenotypesSowing> getType_genotypes_sow() {
        return type_genotypes_sow;
    }

    public void setType_genotypes_sow(List<GenotypesSowing> type_genotypes_sow) {
        this.type_genotypes_sow = type_genotypes_sow;
    }

    public List<SeedsInoculations> getType_seed_in() {
        return type_seed_in;
    }

    public void setType_seed_in(List<SeedsInoculations> type_seed_in) {
        this.type_seed_in = type_seed_in;
    }   

    public List<GrowingEnvironment> getType_grow_env() {
        return type_grow_env;
    }

    public void setType_grow_env(List<GrowingEnvironment> type_grow_env) {
        this.type_grow_env = type_grow_env;
    }

    public List<HarvestMethods> getType_harv_meth() {
        return type_harv_meth;
    }

    public void setType_harv_meth(List<HarvestMethods> type_harv_meth) {
        this.type_harv_meth = type_harv_meth;
    }

    public List<ResultingProducts> getType_res_pro() {
        return type_res_pro;
    }

    public void setType_res_pro(List<ResultingProducts> type_res_pro) {
        this.type_res_pro = type_res_pro;
    }

    public List<RiceSystem> getType_rice_system() {
        return type_rice_system;
    }

    public void setType_rice_system(List<RiceSystem> type_rice_system) {
        this.type_rice_system = type_rice_system;
    }
        
    public List<SeedsColors> getType_seed_color() {
        return type_seed_color;
    }

    public void setType_seed_color(List<SeedsColors> type_seed_color) {
        this.type_seed_color = type_seed_color;
    }

    public List<SeedsOrigins> getType_seed_org() {
        return type_seed_org;
    }

    public void setType_seed_org(List<SeedsOrigins> type_seed_org) {
        this.type_seed_org = type_seed_org;
    }

    public List<SeedsTypes> getType_seed_type() {
        return type_seed_type;
    }

    public void setType_seed_type(List<SeedsTypes> type_seed_type) {
        this.type_seed_type = type_seed_type;
    }   

    public List<SowingTypes> getType_sow_types() {
        return type_sow_types;
    }

    public void setType_sow_types(List<SowingTypes> type_sow_types) {
        this.type_sow_types = type_sow_types;
    }    

    public List<CropsTypes> getType_crops() {
        return type_crops;
    }

    public void setType_crops(List<CropsTypes> type_crops) {
        this.type_crops = type_crops;
    }   

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }    

    public List<HashMap> getListResMan() {
        return listResMan;
    }

    public List<HashMap> getListDesPro() {
        return listDesPro;
    }   

    public List<HashMap> getListPrep() {
        return listPrep;
    }

    public List<HashMap> getListIrr() {
        return listIrr;
    }

    public List<HashMap> getListFert() {
        return listFert;
    }

    public List<HashMap> getListCont() {
        return listCont;
    }

    public List<HashMap> getListMont() {
        return listMont;
    }   

    public List<HashMap> getListCrops() {
        return listCrops;
    }    

    public String getName_producer() {
        return name_producer;
    }

    public void setName_producer(String name_producer) {
        this.name_producer = name_producer;
    }

    public String getType_doc() {
        return type_doc;
    }

    public void setType_doc(String type_doc) {
        this.type_doc = type_doc;
    }

    public String getNum_doc() {
        return num_doc;
    }

    public void setNum_doc(String num_doc) {
        this.num_doc = num_doc;
    }

    public Integer getNum_farm() {
        return num_farm;
    }

    public void setNum_farm(Integer num_farm) {
        this.num_farm = num_farm;
    }

    public String getName_farm() {
        return name_farm;
    }

    public void setName_farm(String name_farm) {
        this.name_farm = name_farm;
    }

    public Integer getNum_field() {
        return num_field;
    }

    public void setNum_field(Integer num_field) {
        this.num_field = num_field;
    }

    public String getName_field() {
        return name_field;
    }

    public void setName_field(String name_field) {
        this.name_field = name_field;
    }
    
    public Double getAreaCrop() {
        return areaCrop;
    }
    
    public void setAreaCrop(Double areaCrop) {
        this.areaCrop = areaCrop;
    }   

    public Double getAreaCropHec() {
        return areaCropHec;
    }    
    
    public Double getAvailableArea() {
        return availableArea;
    }
    
    public void setAvailableArea(Double availableArea) {
        this.availableArea = availableArea;
    }   

    public Double getAreaField() {
        return areaField;
    }

    public void setAreaField(Double areaField) {
        this.areaField = areaField;
    }   

    public Boolean getTotallyArea() {
        return totallyArea;
    }

    public void setTotallyArea(Boolean totallyArea) {
        this.totallyArea = totallyArea;
    }    

    public Integer getTypeArea() {
        return typeArea;
    }

    public void setTypeArea(Integer typeArea) {
        this.typeArea = typeArea;
    }   
    
    public Boolean getCostCrop() {
        return costCrop;
    }

    public void setCostCrop(Boolean costCrop) {
        this.costCrop = costCrop;
    }   
    
    
    private boolean checkSowing;

    public boolean getCheckSowing() {
        return checkSowing;
    }

    public void setCheckSowing(boolean checkSowing) {
        this.checkSowing = checkSowing;
    } 
    
    
    //Atributos generales de clase
    /**
     * Atributos generales de clase
     */
    private HashMap additionals;
    private int page = 1, countTotal, maxResults = 10;
    private int option_geo_lot;
    
    private FieldsDao lotDao      = new FieldsDao();
    private ProductionEventsDao cropDao    = new ProductionEventsDao();
    private BeansDao beansDao     = new BeansDao();
    private CassavasDao cassDao   = new CassavasDao();
    private ControlsDao conDao    = new ControlsDao();
    private FertilizationsDao fertDao     = new FertilizationsDao();
    private HarvestsDao harDao    = new HarvestsDao();
    private CostIndirectProductionEventDao costDao    = new CostIndirectProductionEventDao();
    private IrrigationDao irrDao  = new IrrigationDao();
    private MaizeDao maizeDao     = new MaizeDao();
    private RiceDao riceDao       = new RiceDao();
    private MonitoringDao monDao     = new MonitoringDao();
    private PhysiologicalMonitoringDao physDao     = new PhysiologicalMonitoringDao();
    private PreparationsDao prepDao     = new PreparationsDao();
    private ResidualsManagementDao resDao          = new ResidualsManagementDao();
    private DescriptionsProductionEventDao desDao  = new DescriptionsProductionEventDao();
    private SowingDao sowDao      = new SowingDao();
    private LogEntitiesDao logDao = new LogEntitiesDao();
    
    private String state = "";
    private String info  = "";
    private String valId = "", valName="", selected="";
    
    /**
     * Metodos getter y setter por cada variable general de la clase
     */
    public String getValId() {
        return valId;
    }

    public String getValName() {
        return valName;
    }

    public String getSelected() {
        return selected;
    }

    public String getState() {
        return state;
    }

    public String getInfo() {
        return info;
    }
    
//    public void setInfo(String info) {
//        this.info = info;
//    }

    public LogEntitiesDao getLogDao() {
        return logDao;
    }

    public void setLogDao(LogEntitiesDao logDao) {
        this.logDao = logDao;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setCountTotal(int countTotal) {
        this.countTotal = countTotal;
    }

    public void setMaxResults(int maxResults) {
        this.maxResults = maxResults;
    }

    public int getPage() {
        return page;
    }

    public int getCountTotal() {
        return countTotal;
    }

    public int getMaxResults() {
        return maxResults;
    }

    public HashMap getAdditionals() {
        return additionals;
    }

    public int getOption_geo_lot() {
        return option_geo_lot;
    }

    public void setOption_geo_lot(int option_geo_lot) {
        this.option_geo_lot = option_geo_lot;
    }        
    
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }   
    
    
    private Integer typeEnt;

    public Integer getTypeEnt() {
        return typeEnt;
    }

    public void setTypeEnt(Integer typeEnt) {
        this.typeEnt = typeEnt;
    }
    
    private String lanSel;

    public String getLanSel() {
        return lanSel;
    }

    public void setLanSel(String lanSel) {
        this.lanSel = lanSel;
    }
    
    @Override
    public void prepare() throws Exception {
        user = (Users) this.getSession().get(APConstants.SESSION_USER);
        idEntSystem = UsersDao.getEntitySystem(user.getIdUsr());
//        coCode = user.getCountryUsr().getAcronymIdCo();
        coCode = (String) this.getSession().get(APConstants.COUNTRY_CODE);
        this.setType_ident_producer(new DocumentsTypesDao().findAll(coCode));
        this.setList_departments(new DepartmentsDao().findAll(coCode));
        usrDao = new UsersDao();
        idUsrSystem = user.getIdUsr();
        EntitiesDao entDao = new EntitiesDao();
        Entities entTemp = entDao.findById(idEntSystem);
        typeEnt = entTemp.getEntitiesTypes().getIdEntTyp();
        assDao = new AssociationDao();
        String lanTemp = (String) this.getSession().get(APConstants.SESSION_LANG);
        lanSel = lanTemp.replace(coCode.toLowerCase(), "");
//        if (user.getIdUsr()!=null) idEntSystem = UsersDao.getEntitySystem(user.getIdUsr());
    }
    
    
    /**
     * Metodo encargado de validar el formulario de Cultivo
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
            HashMap required = new HashMap();
            required.put("nameField", nameField);
            required.put("typeCrop", typeCrop);
            required.put("lastCrop", lastCrop);
            required.put("totallyArea", totallyArea);
            required.put("costCrop", costCrop);
            if (totallyArea!=null && !totallyArea) {
                required.put("typeArea", typeArea);
                required.put("areaCrop", areaCrop);
            }
//            required.put("drainPlot", drainPlot);    
            boolean enter = false;
            
            if (lastCrop==1000000) {
                required.put("otherCrop", otherCrop);
            }
            
            for (Iterator it = required.keySet().iterator(); it.hasNext();) {
                String sK = (String) it.next();
                String sV = String.valueOf(required.get(sK));
//                System.out.println(sK + " : " + sV);
                if (StringUtils.trim(sV).equals("null") || StringUtils.trim(sV)==null || StringUtils.trim(sV).equals("") || sV.equals("-1")) {
                    addFieldError(sK, getText("message.fieldsrequired.crop"));
                    enter = true;
                }
            }
            
            if (enter) {
                addActionError(getText("message.missingfields.crop"));
            }
            
            HashMap fieldInfo = lotDao.findById(this.getIdField());
            double availableArea = 0.0;
            double areaOld       = 0.0;
            if (totallyArea!=null) {
                availableArea = (fieldInfo.get("available_area")!=null) ? Double.parseDouble(String.valueOf(fieldInfo.get("available_area"))) : 0.0;                
                areaOld = (fieldInfo.get("area_lot")!=null) ? Double.parseDouble(String.valueOf(fieldInfo.get("area_lot"))) : 0.0;
            }
            
            if (totallyArea!=null && !totallyArea && typeArea!=null && areaCrop!=null) {                
                if (idCrop!=null && idCrop>0) {
                    HashMap temp  = cropDao.findById(idCrop);
                    Double areaCropTemp  = Double.parseDouble(String.valueOf(temp.get("quant_area")));
//                    Integer typeAreaTemp = Integer.parseInt(String.valueOf(temp.get("type_area")));
//                    if (typeAreaTemp==1) areaCropTemp = (areaCropTemp*areaOld)/100;
                    if (areaCropTemp>0) availableArea = availableArea + areaCropTemp;
                }
                if (typeArea==1) {
                    areaCrop = ((areaCrop*availableArea)/100);
                }
                /* 
                1-Porcentaje ((Area seleccionada * porcentaje/100)) = Area en Hectarea)
                2-Hectarea	 ((Area seleccionada/Area del lote)*100=porcentaje)
                */
                if (areaCrop>availableArea) {
                    if (typeArea==1) {
                        addFieldError("areaCrop", "Dato invalido, valor entre 1 y "+availableArea+" ha");
                    } else if (typeArea==2) {
                        addFieldError("areaCrop", "Dato invalido, valor entre 1 y "+availableArea+" ha");
                    }                
                    addActionError("Se ingreso un area a sembrar por fuera del area del lote disponible");
                }
            } else {
//                areaCrop = areaOld;
//                areaCrop = availableArea;
            }
        }
    }
    
    private int numRows=0;

    public Integer getNumRows() {
        return numRows;
    }

    public void setNumRows(Integer numRows) {
        this.numRows = numRows;
    }       
    
    private int pageReq;

    public int getPageReq() {
        return pageReq;
    }
    
    
    private void setValuesCrop(Integer idCrop) {
        HashMap cropInfo = cropDao.findById(idCrop);
        this.setNameField(String.valueOf(cropInfo.get("nameField")));
        this.setIdField(Integer.parseInt(String.valueOf(cropInfo.get("idField"))));
        this.setTypeCrop(Integer.parseInt(String.valueOf(cropInfo.get("typeCrop"))));
//        this.setPerformObj(Double.parseDouble(String.valueOf(cropInfo.get("performObj"))));
        this.setLastCrop(Integer.parseInt(String.valueOf(cropInfo.get("lastCrop"))));
        this.setOtherCrop(String.valueOf(cropInfo.get("otherCrop")));
      
        String areaTemp = String.valueOf(cropInfo.get("quant_area"));
        String typeTemp = String.valueOf(cropInfo.get("type_area"));
        String costEvenTemp = String.valueOf(cropInfo.get("costCrop"));
        //Boolean costE=false;
        //if (costEvenTemp=="1") costE=true; 
        if (!areaTemp.equals("null")) this.setAreaCrop(Double.parseDouble(areaTemp));
        if (!typeTemp.equals("null")) this.setTypeArea(Integer.parseInt(typeTemp));
        if (!costEvenTemp.equals("null")) 
        {
             this.setCostCrop(Boolean.valueOf(costEvenTemp));
            
        }
        HashMap fieldInfo = lotDao.findById(this.getIdField());
        double areaOld  = Double.parseDouble(String.valueOf(fieldInfo.get("area_lot")));
        double avaArea  = Double.parseDouble(String.valueOf(fieldInfo.get("available_area")));
        Boolean totArea = (Boolean)(fieldInfo.get("totally_area"));
        if (this.getTypeArea()!=null && this.getTypeArea()==1) {
            areaCropHec = this.getAreaCrop();
            this.setAreaCrop((this.getAreaCrop()/(avaArea+this.getAreaCrop()))*100);            
        } 
        this.setAreaField(areaOld);
        this.setAvailableArea(avaArea);
        this.setTotallyArea(totArea);
        this.setNameTypeCrop(new CropsTypesDao().objectById(typeCrop).getNameCroTyp());
        if (this.getLastCrop()==1000000) {
            lastTypeCrop = this.getOtherCrop();
        } else {
            lastTypeCrop = new CropsTypesDao().objectById(this.getLastCrop()).getNameCroTyp();
        }
        if (this.getLastCrop()==1) {
            nameDrainPlot = "Si";
        } else {
            nameDrainPlot = "No";
        }
    }
    
    public String showDataCrop() 
    {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        try {
            this.setIdCrop(Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
            this.setIdCrop(-1);
        }
        if (this.getIdCrop()!= -1) {
            setValuesCrop(this.getIdCrop());
        }
        return SUCCESS;
    }
  
    
    /**
    * Accion que permite visualizar la informacion general de un cultivo
    *
    */
    public String view()
    {     
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
//        actExe = (String)(this.getRequest().getParameter("action"));
        actExe = "modify";
        
        if (this.getRequest().getParameter("page") == null) {
            pageReq = this.getPage();
        } else {
            pageReq = Integer.parseInt(StringUtils.trim(this.getRequest().getParameter("page")));
        }
        this.getRequest().getParameterNames();
        try {
            this.setIdCrop(Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
            this.setIdCrop(-1);
        }
//        System.out.println("idCropReq->"+this.getRequest().);
//        System.out.println("idCrop->"+idCrop);
//        System.out.println("page->"+this.getRequest().getParameterNames().toString());        
        if (this.getIdCrop()!= -1) {
            
//            LogEntities log = LogEntitiesDao.getData(null, this.getIdCrop(), "production_events", "C");
//            boolean verify  = ExtensionAgentsDao.verifyAssociation(idEntSystem, log.getIdEntityLogEnt());
//            if (!verify) {
//                return BaseAction.NOT_AUTHORIZED;
//            }           
            
            setValuesCrop(this.getIdCrop());
            
            HashMap findParams = new HashMap();       
            findParams.put("idEvent", this.getIdCrop());       
            findParams.put("idEntUser", idEntSystem);       
            findParams.put("coCode", coCode);       
            listDesPro = desDao.findByParams(findParams);
            listResMan = resDao.findByParams(findParams);
            listPrep = prepDao.findByParams(findParams);
            listIrr  = irrDao.findByParams(findParams);
            listFert = fertDao.findByParams(findParams);
            listCont = conDao.findByParams(findParams);
            listMont = monDao.findByParams(findParams);            
            checkSowing = prepDao.haveDirectSowing(findParams);
                        
            beans  = beansDao.objectById(this.getIdCrop());
            cass   = cassDao.objectById(this.getIdCrop());
            harv   = harDao.objectById(this.getIdCrop());
            costo  = costDao.objectById(this.getIdCrop());
            maize  = maizeDao.objectById(this.getIdCrop());
            rice   = riceDao.objectById(this.getIdCrop());
            phys   = physDao.objectById(this.getIdCrop());
            sowing = sowDao.objectById(this.getIdCrop());
            event  = cropDao.objectById(this.getIdCrop());
            typeCrop = event.getCropsTypes().getIdCroTyp();
            
            if (coCode.equals("NI")) {
                if (sowing!=null && sowing.getSeedsNumberSow()!=null) {
                    Double seedNum = sowing.getSeedsNumberSow()*0.01522;
                    sowing.setSeedsNumberSow(seedNum.intValue());
                }
                
                if (event!=null && event.getExpectedProductionProEve()!=null) {
                    Double expPro  = event.getExpectedProductionProEve()*0.01522;                            
                    event.setExpectedProductionProEve(expPro);
                }
                
                if (harv!=null && harv.getYieldHar()!=null) {
                    Double yieldHar = harv.getYieldHar()*0.01522;
                    harv.setYieldHar(yieldHar);
                }
                
                if (harv!=null && harv.getProductionHar()!=null) {
                    Double proHar   = harv.getProductionHar()*0.02174;                            
                    harv.setProductionHar(proHar.intValue());
                }
            }
            
            this.setType_genotypes(new GenotypesDao().findAllByTypeCrop(typeCrop, 0, coCode));
            if(sowing!=null && sowing.getIdSow()!=0) {
                if(typeCrop==1 && maize!=null && maize.getSeedsColors()!=null) {
                    this.setType_genotypes(new GenotypesDao().findAllByTypeCrop(typeCrop, maize.getSeedsColors().getIdSeeCol(), coCode));
                } else if(typeCrop==2 && beans!=null && beans.getGrowingEnvironment()!=null) {
                    this.setType_genotypes(new GenotypesDao().findAllByTypeCrop(typeCrop, beans.getGrowingEnvironment().getIdGroEnv(), coCode));
                } else if(typeCrop==3) {
                    this.setType_genotypes(new GenotypesDao().findAllByTypeCrop(typeCrop, 0, coCode));
                } else if(typeCrop==4) {
                    this.setType_genotypes(new GenotypesDao().findAllByTypeCrop(typeCrop, 0, coCode));
                }  
                 
            }
            
            HashMap fieldInfo = lotDao.findById(this.getIdField());
                        
            this.setName_producer(String.valueOf(fieldInfo.get("name_producer")));
            String numDocTemp = String.valueOf(fieldInfo.get("no_doc_pro"));
            if (!numDocTemp.equals("null")) this.setNum_doc(numDocTemp);
            this.setType_doc(String.valueOf(fieldInfo.get("type_doc_pro")));
            this.setName_farm(String.valueOf(fieldInfo.get("name_farm")));
            
            this.setType_chem_sow(new ChemicalsSowingDao().findAllByTypeCrop(typeCrop, coCode));
            this.setType_dose_units(new DoseUnitsDao().findAll(coCode));            
            this.setType_genotypes_sow(new GenotypesSowingDao().findAllByTypeCrop(typeCrop, coCode));
            this.setType_grow_env(new GrowingEnvironmentDao().findAll());
            this.setType_seed_in(new SeedsInoculationsDao().findAll(coCode));            
            this.setType_harv_meth(new HarvestMethodsDao().findAll(coCode));
            this.setType_res_pro(new ResultingProductsDao().findAllByTypeCrop(typeCrop, coCode));
            this.setType_seed_color(new SeedsColorsDao().findAll(coCode));
            this.setType_rice_system(new RiceSystemDao().findAll(coCode));
            this.setType_seed_org(new SeedsOriginsDao().findAllByTypeCrop(typeCrop));
            this.setType_seed_type(new SeedsTypesDao().findAll(coCode));           
            this.setType_sow_types(new SowingTypesDao().findAll(coCode));           
            
        }       
        return SUCCESS;
    }
    
    private JSONObject objInfo;

    public JSONObject getObjInfo() {
        return objInfo;
    }

    public void setObjInfo(JSONObject objInfo) {
        this.objInfo = objInfo;
    }   
    
    public String viewInfoTime() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/create") || !usrDao.getPrivilegeUser(idUsrSystem, "crop/modify")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        try {
            this.setIdCrop(Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            this.setIdCrop(-1);
        }  
        
        if (this.getIdCrop()!= -1) {      
            objInfo = new JSONObject();      
            phys   = physDao.objectById(this.getIdCrop());
            sowing = sowDao.objectById(this.getIdCrop());
            harv   = harDao.objectById(this.getIdCrop());  
            event  = cropDao.objectById(this.getIdCrop());
            typeCrop = event.getCropsTypes().getIdCroTyp();
            String showTimeline = "0";
            String result       = "";
            String beginning    = "";            
            if (sowing!=null) {
                state                = "success";
                showTimeline         = "1";
                String dateSowing    = new SimpleDateFormat("yyyy-MM-dd").format(sowing.getDateSow()); 
                String yearSowing    = new SimpleDateFormat("yyyy").format(sowing.getDateSow());
                String dateStart     = ""+yearSowing+"-01-01";
                String dateEnd       = ""+yearSowing+"-12-31";
                beginning            = "{\"start\": \""+dateStart+"\", \"end\": \""+dateEnd+"\", \"editable\": false}";
                result += "{\"content\": \"<div>Siembra</div><img src='../img/sowing.png' style='width:32px; height:32px;'>\", \"start\": \""+dateSowing+"\", \"className\": \"sowing\"},";     

                if (phys!=null && phys.getEmergencePhyMon()!=null) {
                    String dateEmergence = new SimpleDateFormat("yyyy-MM-dd").format(phys.getEmergencePhyMon());
                    long diffEmergence   = GlobalFunctions.daysBetween(sowing.getDateSow(), phys.getEmergencePhyMon());
                    result += "{\"content\": \"Emergencia\", \"start\": \""+dateEmergence+"\", \"className\": \"emergency\", \"title\": \"Se dio emergencia en "+diffEmergence+" dias despues de siembra\"},";
//                    result += "{\"content\": \"Se dio emergencia en "+diffEmergence+" dias <br> despues de siembra\", \"start\": \""+dateSowing+"\", \"end\": \""+dateEmergence+"\"},";
                }

                if (phys!=null && phys.getFloweringDatePhyMon()!=null) {
                    String dateFlowering = new SimpleDateFormat("yyyy-MM-dd").format(phys.getFloweringDatePhyMon());
                    long diffFlowering   = GlobalFunctions.daysBetween(sowing.getDateSow(), phys.getFloweringDatePhyMon());
                    result += "{\"content\": \"Floracion\", \"start\": \""+dateFlowering+"\", \"className\": \"flowering\", \"title\": \"Se dio floracion en "+diffFlowering+" dias despues de siembra\"},";
//                    result += "{\"content\": \"Se dio floracion en "+diffFlowering+" dias <br> despues de siembra\", \"start\": \""+dateSowing+"\", \"end\": \""+dateFlowering+"\"},";
                }
                
                result += prepDao.getPrep(this.getIdCrop());
                result += resDao.getResidualsInfo(this.getIdCrop());
                result += irrDao.getIrrigationsInfo(this.getIdCrop());
                result += fertDao.getFertilizationsInfo(this.getIdCrop());
                result += conDao.getControlsInfo(this.getIdCrop());
                result += monDao.getMonitoringsInfo(this.getIdCrop());
                
                if (harv!=null && harv.getDateHar()!=null) {
                    String dateHarvest   = new SimpleDateFormat("yyyy-MM-dd").format(harv.getDateHar());
                    long diffHarvest     = GlobalFunctions.daysBetween(sowing.getDateSow(), harv.getDateHar());
                    String classHar      = "";
                    String imageHar      = "";
                    if(typeCrop==1) {
                        classHar      = "maize";
                        imageHar      = "../img/maize.png";
                    } else if(typeCrop==2) {
                        classHar      = "beans";
                        imageHar      = "../img/beans.png";
                    } else if(typeCrop==4) {
                        classHar      = "rice";
                        imageHar      = "../img/rice.png";
                    }
//                    result += "{\"content\": \"Se hizo cosecha en "+diffHarvest+" dias <br> despues de siembra\", \"start\": \""+dateSowing+"\", \"end\": \""+dateHarvest+"\"},";
                    result += "{\"content\": \"<div>Cosecha</div><img src='"+imageHar+"' style='width:32px; height:32px;'>\", \"start\": \""+dateHarvest+"\", \"className\": \""+classHar+"\", \"title\": \"Se hizo cosecha en "+diffHarvest+" dias despues de siembra\"},";
                }
            }
            objInfo.put("timeline", showTimeline);
            objInfo.put("content", result);
            objInfo.put("beginning", beginning);
            phys   = null;
            sowing = null;
            harv   = null;
            event  = null;
            /*list_departments = null;
            type_ident_producer = null;
            rice = null;
            beans = null;
            maize = null;
            cass = null;
            assDao = null;
            user = null;*/
        } else {
            state = "failure";
        }
        return "states";
    }
    
    /**
     * Se obtiene la lista de materiales geneticos a partir de un color del endospermo seleccionado previamente
     * @param idColor: Identificacion de color del endospermo
     * @return lista de materiales geneticos
     */
    public String comboGetListGenByCol() {
        String chain = "<option value=\"\">---</option>";
        if(!this.getRequest().getParameter("idColor").equals("-1")) {
            int idColor    = Integer.parseInt(this.getRequest().getParameter("idColor"));
            int typeCropId = Integer.parseInt(this.getRequest().getParameter("typeCrop"));
            
            type_genotypes = new GenotypesDao().findAllByTypeCrop(typeCropId, idColor, coCode);
            for (Genotypes data : type_genotypes) {
    //            System.out.println(data.toString());
                chain += "<option value=\"" + data.getIdGen()+ "\">" + data.getNameGen()+ "</option>";
            }
        }
        type_genotypes = null;
        state = "success";
        info  = chain;
        return "combo";
    }
    
    /**
     * Se obtiene la lista de materiales geneticos a partir de un habito de crecimiento seleccionado previamente
     * @param idGrow: Identificacion del habito de crecimiento
     * @return lista de materiales geneticos
     */
    public String comboGetListGenByGrowing() {
        String chain = "<option value=\"\">---</option>";
        if(!this.getRequest().getParameter("idGrow").equals("-1")) {
            int idGrow     = Integer.parseInt(this.getRequest().getParameter("idGrow"));
            int typeCropId = Integer.parseInt(this.getRequest().getParameter("typeCrop"));
            
            type_genotypes = new GenotypesDao().findAllByTypeCrop(typeCropId, idGrow, coCode);
            for (Genotypes data : type_genotypes) {
    //            System.out.println(data.toString());
                chain += "<option value=\"" + data.getIdGen()+ "\">" + data.getNameGen()+ "</option>";
            }
        }
        type_genotypes = null;
        state = "success";
        info = chain;
        return "combo";
    }
    
    private String name_agronomist;
    private String selectAllname_agronomist;
    private String selectItemname_agronomist;      

    public String getName_agronomist() {
        return name_agronomist;
    }

    public void setName_agronomist(String name_agronomist) {
        this.name_agronomist = name_agronomist;
    }  

    public String getSelectAllname_agronomist() {
        return selectAllname_agronomist;
    }

    public void setSelectAllname_agronomist(String selectAllname_agronomist) {
        this.selectAllname_agronomist = selectAllname_agronomist;
    }

    public String getSelectItemname_agronomist() {
        return selectItemname_agronomist;
    }

    public void setSelectItemname_agronomist(String selectItemname_agronomist) {
        this.selectItemname_agronomist = selectItemname_agronomist;
    }

    /**
     * Encargado de buscar las coincidencias de un formulario de busqueda, para cada uno de los
     * cultivos registrados a un usuario
     * @param valName:  Nombre del valor a buscar
     * @param valId:    Identificacion del valor a buscar
     * @param selected: Valor seleccionado
     * @return lista de cultivos
     */
    public String search() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        valName     = (String)(this.getRequest().getParameter("valName"));
        valId       = (String)(this.getRequest().getParameter("valId"));
        selected    = (String)(this.getRequest().getParameter("selected"));
        String selAll = "false";
        if(selected==null) {
            selected="crop";
            selAll = "true";
        }       
        
        if (selectAllname_agronomist!=null) {
            selAll = "true";
        }
        
        additionals = new HashMap();
        additionals.put("selected", selected);
        HashMap findParams = new HashMap();
        findParams.put("selAll", selAll);
        findParams.put("selItem", selectItemname_agronomist);
        Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr());
        findParams.put("entType", entTypeId);
        list_agronomist   = assDao.gelAllAgronomist(idEntSystem);
        
        if(searchFromCrop!=null && searchFromCrop==2) {
            search_crop = "";
        } 
        
        findParams.put("idEntUser", idEntSystem);
        findParams.put("search_crop", search_crop);
        findParams.put("date_sowing", date_sowing);
        findParams.put("date_harvest", date_harvest);
        findParams.put("name_producer", name_producer);
        findParams.put("idCrop", idCrop);
        findParams.put("type_doc", type_doc);
        findParams.put("num_doc", num_doc);
        findParams.put("num_farm", num_farm);
        findParams.put("name_farm", name_farm);
        findParams.put("num_field", num_field);
        findParams.put("name_field", name_field);
        
        int pageReq;
        if (this.getRequest().getParameter("page") == null) {
            pageReq = this.getPage();
        } else {
            pageReq = Integer.parseInt(StringUtils.trim(this.getRequest().getParameter("page")));
        }
        findParams.put("pageNow", pageReq);
        findParams.put("maxResults", this.getMaxResults());
        listCrops = cropDao.findByParams(findParams);
        this.setCountTotal(Integer.parseInt(String.valueOf(listCrops.get(0).get("countTotal"))));
        this.setPage(page);
        listCrops.remove(0);
//        System.out.println("countTotal->"+this.getCountTotal());
        return SUCCESS;
    }
    
    /**
     * Bloque correspondiente al tratamiento de creacion y lectura de archivos
     *
     */    
    private InputStream inputStream;   
    
    public InputStream getInputStream() {  
        return inputStream;  
    }  
  
    public void setInputStream(InputStream inputStream) {  
        this.inputStream = inputStream;  
    }
    
    private String fileName;

    public String getFileName() {
        return fileName;
    }   
    
    public String viewReport() throws Exception {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        
        String selAll = "false";        
        if (selectAllname_agronomist!=null) {
            selAll = "true";
        }
        
        HashMap findParams = new HashMap();
        findParams.put("selAll", selAll);
        findParams.put("selItem", selectItemname_agronomist);
//        System.out.println("selAll=>"+selAll);
//        System.out.println("selectAllname_agronomist=>"+selectAllname_agronomist);
//        System.out.println("selectItemname_agronomist=>"+selectItemname_agronomist);
        Integer entTypeId = new EntitiesDao().getEntityTypeId(user.getIdUsr());
        findParams.put("entType", entTypeId);
        findParams.put("idEntUser", idEntSystem);
        String OS = System.getProperty("os.name").toLowerCase();
        if (OS.indexOf("win") >= 0) {
            fileName  = ""+getText("file.doccropwin");
            findParams.put("fileName", ""+getText("file.tempcropwin"));
        } else {
            fileName  = ""+getText("file.doccropunix");
            findParams.put("fileName", ""+getText("file.tempcropunix"));
        }
//        String fileName  = ""+getText("file.doccrop");
//        String fileName  = "cropsInfo.csv";
        cropDao.getProductionEvents(findParams, fileName);  
        
        File f = new File(fileName);  
        inputStream = new FileInputStream(f);
//        f.delete();
        return "OUTPUTCSV"; 
    }
    

    /**
     * Encargado de mostrar en un formulario la informacion de un cultivo apartir de la identificacion
     * @param idCrop:  Identificacion del cultivo
     * @return Informacion del cultivo
     */
    public String show() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/create") || !usrDao.getPrivilegeUser(idUsrSystem, "crop/modify")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        actExe = (String)(this.getRequest().getParameter("action"));
        int pageReq;
        if (this.getRequest().getParameter("page") != null) {
            pageReq = Integer.parseInt(StringUtils.trim(this.getRequest().getParameter("page")));
            this.setPage(pageReq);
        } else {
//            this.setPage(1);
        }
        try {
            this.setIdCrop(Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
//            LOG.error("There was an error trying to parse the activityId parameter");
            this.setIdCrop(-1);
        }

        this.setType_ident_producer(new DocumentsTypesDao().findAll(coCode));
        this.setType_crops(new CropsTypesDao().findAll(coCode));
        if (this.getIdCrop()!= -1) {
            setValuesCrop(this.getIdCrop());
                
//            Fields fie = lotDao.objectById(idField);
//            nameField  = fie.getNameFie();
        } 
        return SUCCESS;
    }    

    /**
     * Encargado de guardar la informacion suministrada por el usuario para un cultivo
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
//        info = "El cultivo ha sido modificado con exito";
        

        try {
            tx = session.beginTransaction();
            double areaCropSel = 0.0;
            ProductionEvents pro = null;
            if (idCrop==null || idCrop<=0) {
                pro = new ProductionEvents();
                pro.setIdProEve(null);
            } else {
                pro = cropDao.objectById(idCrop);
                areaCropSel = pro.getQuantAreaProEve();
            }                        
            Fields lot = lotDao.objectById(this.getIdField()); 
//            double areaOld = lot.getAreaFie();
            double areaAvaOld = lot.getAvailableAreaFie();
            /* 
             1-Porcentaje ((Area del lote * porcentaje/100)) = Area)
             2-Hectarea   ((Area/Area del lote)*100=porcentaje)
             */
//            System.out.println("areaCrop=>"+areaCrop);
            double availableArea = areaAvaOld + areaCropSel;                        
            if (totallyArea) {
                typeArea = 2;
                areaCrop += areaAvaOld;
            }
            availableArea -= areaCrop;
            if (availableArea==0) {
                lot.setTotallyAreaFie(true);
            } else {
                lot.setTotallyAreaFie(false);
            }
            lot.setAvailableAreaFie(availableArea);
            session.saveOrUpdate(lot);            
//            throw new HibernateException("Perros");
            
            pro.setQuantAreaProEve(areaCrop);
            pro.setTypeAreaProEve(typeArea);           
            pro.setFields(new Fields(idField));
            pro.setCropsTypes(new CropsTypes(typeCrop));
            pro.setIdProjectProEve(1);  
            pro.setCostProEve(this.getCostCrop());
//            System.out.println("cost=>"+this.getCostCrop());
//            throw new HibernateException("Prueba de Costo");
            if (lastCrop==1000000) {
                pro.setFormerCropProEve(null);
                pro.setOtherFormerCropProEve(otherCrop);
            } else {
                pro.setFormerCropProEve(lastCrop);
            }
            pro.setStatus(true);
            session.saveOrUpdate(pro);
            
//            entDao.save(ent);          
//            System.out.println("pruebaCrea");      
                        
            beans  = beansDao.objectById(idCrop);
            cass   = cassDao.objectById(idCrop);
            maize  = maizeDao.objectById(idCrop);
            rice   = riceDao.objectById(idCrop);
            if (action.equals("M")) {
                if (idCrop>0) {                    
                    if (typeCrop==1) {
                        if (beans!=null) session.delete(beans);
                        if (cass!=null) session.delete(cass);                    
                        if (rice!=null) session.delete(rice);                    
                    } else if (typeCrop==2) {
                        if (cass!=null) session.delete(cass);
                        if (maize!=null) session.delete(maize);
                        if (rice!=null) session.delete(rice);
                    } else if (typeCrop==3) {
                        if (maize!=null) session.delete(maize);
                        if (beans!=null) session.delete(beans);
                        if (rice!=null) session.delete(rice);
                    } else if (typeCrop==4) {
                        if (maize!=null) session.delete(maize);
                        if (beans!=null) session.delete(beans);
                        if (cass!=null) session.delete(cass);
                    }
                }
            } 
            
            if (typeCrop==1 && maize==null) {
                Maize ma = new Maize();
                ma.setIdMai(null);
                ma.setProductionEvents(pro);
                session.saveOrUpdate(ma);            
            } else if (typeCrop==2 && beans==null) {
                Beans be = new Beans();
                be.setIdBea(null);
                be.setProductionEvents(pro);
                session.saveOrUpdate(be);
            } else if (typeCrop==3 && cass==null) {
                Cassavas ca = new Cassavas();
                ca.setIdCas(null);
                ca.setProductionEvents(pro);
                session.saveOrUpdate(ca);
            } else if (typeCrop==4 && rice==null) {
                Rice ri = new Rice();
                ri.setIdRi(null);
                ri.setProductionEvents(pro);
                session.saveOrUpdate(ri);            
            }
            
            beans = null;
            cass  = null;
            maize = null;
            rice  = null;
            
            LogEntities log = null;            
            log = LogEntitiesDao.getData(idEntSystem, pro.getIdProEve(), "production_events", action);
            if ((log==null && action.equals("C")) || action.equals("M")) {
                log = new LogEntities();
                log.setIdLogEnt(null);
                log.setIdEntityLogEnt(idEntSystem);
                log.setIdObjectLogEnt(pro.getIdProEve());
                log.setTableLogEnt("production_events");
                log.setDateLogEnt(new Date());
                log.setActionTypeLogEnt(action);
                session.saveOrUpdate(log);
            }
            idCrop = pro.getIdProEve();            
            tx.commit();           
            
            SfGuardUserDao sfDao = new SfGuardUserDao();
            SfGuardUser sfUser   = sfDao.getUserByLogin(user.getCreatedBy(), user.getNameUserUsr(), "");            
//            GlobalFunctions.sendInformationCrop(idCrop, typeCrop, sfUser.getId());
            
            state = "success";            
            if (action.equals("C")) {
                info  = getText("message.successadd.crop");
//                return "list";
            } else if (action.equals("M")) {
                info  = getText("message.successedit.crop");
//                return "list";
            }
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
//            System.out.println("error->"+e.getMessage());
            state = "failure";
            if (action.equals("C")) {
                info  = getText("message.failadd.crop");
            } else if (action.equals("M")) {
                info  = getText("message.failedit.crop");
            }
        } finally {
            session.close();
        }  
        
//        return ERROR;
        return "states";
    }

    
    
    /**
     * Encargado de borrar la informacion de un cultivo apartir de su identificacion
     * @param idCrop:  Identificacion del cultivo
     * @return Estado del proceso
     */
    public String delete() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/delete")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        Integer idCrop = 0;
        try {
            idCrop = Integer.parseInt(this.getRequest().getParameter("idCrop"));
        } catch (NumberFormatException e) {
            idCrop = -1;
        }
        
        if (idCrop==-1) {
            state = "failure";
            info  = getText("message.failgetinfo.crop");
            return "states";
        }
        
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();            
            ProductionEvents pro = cropDao.objectById(idCrop);      
            pro.setStatus(false);
//            session.delete(pro);        
            session.saveOrUpdate(pro);
            
            /* 
             1-Porcentaje ((Area del lote * porcentaje/100)) = Area)
             2-Hectarea   ((Area/Area del lote)*100=porcentaje)
             */
            areaCrop = pro.getQuantAreaProEve();
            typeArea = pro.getTypeAreaProEve();
            Fields lot = lotDao.objectById(pro.getFields().getIdFie());   
            double areaOld = lot.getAreaFie();
            double availableArea = lot.getAvailableAreaFie();
            if (typeArea==1) {
                areaCrop = ((areaOld*areaCrop)/100);
            }  
            availableArea += areaCrop;
            lot.setAvailableAreaFie(availableArea);
            session.saveOrUpdate(lot);
            
            LogEntities log = new LogEntities();
            log.setIdLogEnt(null);
            log.setIdEntityLogEnt(idEntSystem);
            log.setIdObjectLogEnt(pro.getIdProEve());
            log.setTableLogEnt("production_events");
            log.setDateLogEnt(new Date());
            log.setActionTypeLogEnt("D");
            session.saveOrUpdate(log);
//            logDao.save(log);
            
            BasicDBObject query = new BasicDBObject();
            query.put("InsertedId", ""+idCrop);        
            typeCrop = pro.getCropsTypes().getIdCroTyp();
            if (typeCrop==1) {
                query.put("form_id", "16");
            } else if (typeCrop==2) {
                query.put("form_id", "39");
            }            

            /*MongoClient mongo = null;
            try {
                mongo = new MongoClient("localhost", 27017);
            } catch (UnknownHostException ex) {
                Logger.getLogger(ActionField.class.getName()).log(Level.SEVERE, null, ex);
            }
            DB db = mongo.getDB("ciat");
            DBCollection col = db.getCollection("log_form_records");
            WriteResult result = null;
            
            System.out.println("borro mongo");
            result = col.remove(query);

            if (result.getError()!=null) {
                throw new HibernateException("");
            }
            mongo.close();*/
                        
            tx.commit();         
            state = "success";
            info  = getText("message.successdelete.crop");
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            state = "failure";
            info  = getText("message.faildelete.crop");
        } finally {
            session.close();
        }      
        
        return "states";
    }
    
    /**
     * Encargado de borrar la informacion de los cultivos que se han seleccionado
     * @param valSel:  Valores que se han seleccionado para borrar
     * @return Estado del proceso
     */
    public String deleteAll() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/delete")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        String valSel = "";        
        try {
            valSel = String.valueOf(this.getRequest().getParameter("valSel"));
        } catch (NumberFormatException e) {
            valSel = "-1";
        }
        
        if (valSel.equals("-1")) {
            state = "failure";
            info  = getText("message.failgetinfo.crop");
            return "states";
        }
        
        state = cropDao.deleteAllCrops(valSel, idEntSystem);
        if (state.equals("success")) {
            info  = getText("message.successalldelete.crop");
        } else if (state.equals("failure")) {
            info  = getText("message.failalldelete.crop");
        }
        
        return "states";
    }
    
}
