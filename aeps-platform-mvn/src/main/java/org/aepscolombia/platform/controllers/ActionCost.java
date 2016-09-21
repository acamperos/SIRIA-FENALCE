
package org.aepscolombia.platform.controllers;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.aepscolombia.platform.models.dao.AssociationDao;
import org.aepscolombia.platform.models.dao.BeansDao;
import org.aepscolombia.platform.models.dao.CassavasDao;
import org.aepscolombia.platform.models.dao.ControlsDao;
import org.aepscolombia.platform.models.dao.CostIndirectProductionEventDao;
import org.aepscolombia.platform.models.dao.CropsTypesDao;
import org.aepscolombia.platform.models.dao.DepartmentsDao;
import org.aepscolombia.platform.models.dao.DescriptionsProductionEventDao;
import org.aepscolombia.platform.models.dao.DocumentsTypesDao;
import org.aepscolombia.platform.models.dao.EntitiesDao;
import org.aepscolombia.platform.models.dao.FertilizationsDao;
import org.aepscolombia.platform.models.dao.FieldsDao;
import org.aepscolombia.platform.models.dao.HarvestsDao;
import org.aepscolombia.platform.models.dao.IrrigationDao;

import org.aepscolombia.platform.models.dao.LogEntitiesDao;
import org.aepscolombia.platform.models.dao.MaizeDao;
import org.aepscolombia.platform.models.dao.MonitoringDao;
import org.aepscolombia.platform.models.dao.PhysiologicalMonitoringDao;
import org.aepscolombia.platform.models.dao.PreparationsDao;
import org.aepscolombia.platform.models.dao.ProductionEventsDao;
import org.aepscolombia.platform.models.dao.ResidualsManagementDao;
import org.aepscolombia.platform.models.dao.RiceDao;
import org.aepscolombia.platform.models.dao.SfGuardUserDao;
import org.aepscolombia.platform.models.dao.SojaDao;
import org.aepscolombia.platform.models.dao.SowingDao;
import org.aepscolombia.platform.models.dao.UsersDao;
import org.aepscolombia.platform.models.entity.Beans;
import org.aepscolombia.platform.models.entity.Cassavas;
import org.aepscolombia.platform.models.entity.ChemicalsSowing;
import org.aepscolombia.platform.models.entity.CostIndirectProductionEvent;
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
import org.aepscolombia.platform.models.entity.Soja;
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

/**
 * Clase ActionHarvest
 *
 * Contiene los metodos para interactuar con el modulo de Cosecha
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ActionCost extends BaseAction {
    
    /**
     * Atributos provenientes del formulario
     */
    private Integer idCrop;    
    private Integer typeCrop;
    private int lastCrop;  
    private String nameTypeCrop;
    private String lastTypeCrop;
    private String otherCrop;
    private Users user;
    private Integer idEntSystem;    
    private Integer idUsrSystem;    
    private int idField;
    private CostIndirectProductionEvent costo  = new CostIndirectProductionEvent();
    private Sowing sowing = new Sowing();
    private UsersDao usrDao;
    private String coCode;
    private ProductionEvents event = new ProductionEvents();

    /**
     * Metodos getter y setter por cada variable del formulario
     */
    
    
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
    
    public int getIdField() {
        return idField;
    }

    public void setIdField(int idField) {
        this.idField = idField;
    }
    
    public CostIndirectProductionEvent getCosto() {
        return costo;
    }

    public void setCosto(CostIndirectProductionEvent costo) {
        this.costo = costo;
    }   
    
      public ProductionEvents getEvent() {
        return event;
    }
    
    public void setEvent(ProductionEvents event) {
        this.event = event;
    }

    public Sowing getSowing() {
        return sowing;
    }

    public void setSowing(Sowing sowing) {
        this.sowing = sowing;
    }      

     public Integer getIdCrop() {
        return idCrop;
    }

    public void setIdCrop(Integer idCrop) {
        this.idCrop = idCrop;
    }   
    
     public String getOtherCrop() {
        return otherCrop;
    }

    public void setOtherCrop(String otherCrop) {
        this.otherCrop = otherCrop;
    } 
    
    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }       
    
    /**
     * Atributos generales de clase
     */
    
    private ProductionEventsDao cropDao    = new ProductionEventsDao();    
    private CostIndirectProductionEventDao costDao    = new CostIndirectProductionEventDao();
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
    
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }       
    
 
    private String nameField;
   
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
    
        

    private Beans beans   = new Beans();
    private Cassavas cass = new Cassavas();
    private Harvests harv = new Harvests();
   
    private Maize maize     = new Maize();
    private Soja soja       = new Soja();
    private Rice rice     = new Rice();
    private PhysiologicalMonitoring phys = new PhysiologicalMonitoring();
   
    private List<Entities> list_agronomist;
    private AssociationDao assDao;
    
    /**
     * Metodos getter y setter por cada variable del formulario
     */
    public Beans getBeans() {
        return beans;
    }

    public void setBeans(Beans beans) {
        this.beans = beans;
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

  
    public Maize getMaize() {
        return maize;
    }

    public void setMaize(Maize maize) {
        this.maize = maize;
    }
    
    public Soja getSoja() {
        return soja;
    }

    public void setSoja(Soja soja) {
        this.soja = soja;
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
    
   

    public Integer getSearchFromCrop() {
        return searchFromCrop;
    }

    public void setSearchFromCrop(Integer searchFromCrop) {
        this.searchFromCrop = searchFromCrop;
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
    
    private String date_ini;
    
    public String getDate_ini() {
        return date_ini;
    }

    public void setDate_ini(String date_ini) {
        this.date_ini = date_ini;
    }
    
    private String date_end;
    
    public String getDate_end() {
        return date_end;
    }

    public void setDate_end(String date_end) {
        this.date_end = date_end;
    }
    
    
    //Atributos generales de clase
    /**
     * Atributos generales de clase
     */
    private HashMap additionals;
    private int page = 1, countTotal, maxResults = 10;
    private int option_geo_lot;
    
    private FieldsDao lotDao      = new FieldsDao();
    
    private BeansDao beansDao     = new BeansDao();
    private CassavasDao cassDao   = new CassavasDao();
    private ControlsDao conDao    = new ControlsDao();
    private FertilizationsDao fertDao     = new FertilizationsDao();
    private HarvestsDao harDao    = new HarvestsDao();
   
    private IrrigationDao irrDao  = new IrrigationDao();
    private MaizeDao maizeDao     = new MaizeDao();
    private SojaDao sojaDao     = new SojaDao();
    private RiceDao riceDao       = new RiceDao();
    private MonitoringDao monDao     = new MonitoringDao();
    private PhysiologicalMonitoringDao physDao     = new PhysiologicalMonitoringDao();
    private PreparationsDao prepDao     = new PreparationsDao();
    private ResidualsManagementDao resDao          = new ResidualsManagementDao();
    private DescriptionsProductionEventDao desDao  = new DescriptionsProductionEventDao();
    
    private String valId = "", valName="", selected="";
    
    /**
     * Metodos getter y setter por cada variable general de la clase
     */
    public String getValId() {
        return valId;
    }

    /**
     * 
     * @return 
     */
    public String getValName() {
        return valName;
    }

    public String getSelected() {
        return selected;
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
        usrDao = new UsersDao();
        idUsrSystem = user.getIdUsr();
        coCode = (String) this.getSession().get(APConstants.COUNTRY_CODE);
        
        this.setType_ident_producer(new DocumentsTypesDao().findAll(coCode));
        this.setList_departments(new DepartmentsDao().findAll(coCode));
        
        EntitiesDao entDao = new EntitiesDao();
        Entities entTemp = entDao.findById(idEntSystem);
        typeEnt = entTemp.getEntitiesTypes().getIdEntTyp();
        assDao = new AssociationDao();
        String lanTemp = (String) this.getSession().get(APConstants.SESSION_LANG);
        lanSel = lanTemp.replace(coCode.toLowerCase(), "");
    }
    
    private void setValuesCrop(Integer idCrop) {
        HashMap cropInfo = cropDao.findById(idCrop);
        this.setIdField(Integer.parseInt(String.valueOf(cropInfo.get("idField"))));
        this.setTypeCrop(Integer.parseInt(String.valueOf(cropInfo.get("typeCrop"))));
        this.setLastCrop(Integer.parseInt(String.valueOf(cropInfo.get("lastCrop"))));
        this.setOtherCrop(String.valueOf(cropInfo.get("otherCrop"))); 
               
        this.setNameField(String.valueOf(cropInfo.get("nameField")));      
      
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
    
    /**
     * Metodo encargado de validar el formulario de Cosecha
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
//        if (false && (actExe.equals("create") || actExe.equals("modify"))) {
        if (actExe.equals("create") || actExe.equals("modify")) {
            boolean enter = false;
            sowing = sowDao.objectById(this.getIdCrop());
            
            HashMap required = new HashMap();
            //required.put("harv.dateHar", harv.getDateHar());
            //required.put("harv.harvestMethods.idHarMet", harv.getHarvestMethods().getIdHarMet());                     
//            required.put("harv.commentHar", harv.getCommentHar());
            if (typeCrop==1 || typeCrop==2) {
                //required.put("harv.resultingProducts.idResPro", harv.getResultingProducts().getIdResPro());
            }
            
           /* if (harv.getResultingProducts().getIdResPro()!=0) {
                if (harv.getResultingProducts().getIdResPro()==1 || harv.getResultingProducts().getIdResPro()==2 || harv.getResultingProducts().getIdResPro()==5) {
                    required.put("harv.yieldHar", harv.getYieldHar());   
                    required.put("harv.humidityPercentageHar", harv.getHumidityPercentageHar());
                } else if (harv.getResultingProducts().getIdResPro()==3) {
                    required.put("harv.numberSacksSow", harv.getNumberSacksSow());
                } else if (harv.getResultingProducts().getIdResPro()==4) {
                    required.put("harv.yieldHar", harv.getYieldHar());   
                    required.put("harv.numberSacksSow", harv.getNumberSacksSow());
                }
                
//                if (harv.getResultingProducts().getIdResPro()==1 || harv.getResultingProducts().getIdResPro()==4) {
//                    required.put("harv.humidityPercentageHar", harv.getHumidityPercentageHar());
//                }
            } */
            
//            System.out.println("value=>"+harv.getYieldHar());
            
//            if (harv.getProductionHar()==0) {
//                addFieldError("harv.productionHar", "El campo es requerido");
//            }
            
//            if (harv.getYieldHar()==0) {
//                addFieldError("harv.yieldHar", "El campo es requerido");
//            }
            
            for (Iterator it = required.keySet().iterator(); it.hasNext();) {
                String sK = (String) it.next();
                String sV = String.valueOf(required.get(sK));
//                System.out.println(sK + " : " + sV);
                if (StringUtils.trim(sV).equals("null") || StringUtils.trim(sV)==null || StringUtils.trim(sV).equals("") || sV.equals("-1")) {
                    addFieldError(sK, getText("message.fieldsrequired.cost"));
                    enter = true;
                }
            }
            
            if (enter) {
                addActionError(getText("message.missingfields.cost"));
            }
            
            Date dateSowing = null;
//            if (sowing.getDateSow()!=null) {
            if (sowing != null) {
                dateSowing = sowing.getDateSow();
                String dmySow  = new SimpleDateFormat("dd/MM/yyyy").format(sowing.getDateSow());
//                $fechaSiembra = date('m-d-Y', strtotime($params['fecha_siembra']));
//                try {
//                    String dateAsign = new SimpleDateFormat("yyyy-MM-dd").format(new Date(fechaSiembra));
//                } catch (IllegalArgumentException ex) {
//                }
//            }

//                if (sowing.getDateSow()!=null && harv.getDateHar()!=null) {
              /* if (!dmySow.equals("") && harv.getDateHar()!=null) {

                    Integer valDiffAff = GlobalFunctions.compareDateAfterSowingByAction(harv.getDateHar(), sowing.getDateSow(), typeCrop, 7);
                    if (valDiffAff==2) {
        //				$fails[]  = $prefix.'date_harvest_crop';
                        addFieldError("harv.dateHar", getText("message.harvestdateinvalidrank.harvest"));                
                        if (typeCrop==3) {
                            addActionError(getText("desc.harvestdateinvalidrankcassava.harvest")+" ("+dmySow+")");
                        } else {
                            addActionError(getText("desc.harvestdateinvalidrankother.harvest")+" ("+dmySow+")");
                        }
                    }

                }*/
            }

           /* if (harv.getProductionHar()!=null && harv.getProductionHar()!=0) {
                if (harv.getProductionHar()<0) {
                    addFieldError("harv.productionHar", getText("message.invaliddataproduction.harvest"));
                    addActionError(getText("desc.invaliddataproduction.harvest"));
                }
            }*/
            
          /*  if (harv.getResultingProducts().getIdResPro()!=0 && (harv.getYieldHar()!=null && harv.getYieldHar()!=0)) {
//            1 Grano seco a min 100 max 20000
//            4 Ensilaje min 1000 max 60000
//            3 Fresco min 1000 max 60000 
                if (harv.getResultingProducts().getIdResPro()==1 || harv.getResultingProducts().getIdResPro()==2 || harv.getResultingProducts().getIdResPro()==5) {
                    if (harv.getYieldHar()<100 || harv.getYieldHar()>20000) {
                        addFieldError("harv.yieldHar", getText("message.invaliddatayielddry.harvest"));
                        addActionError(getText("desc.invaliddatayielddry.harvest"));
                    }
                } else if (harv.getResultingProducts().getIdResPro()==3 || harv.getResultingProducts().getIdResPro()==4) {
                    if (harv.getYieldHar()<1000 || harv.getYieldHar()>60000) {
                        addFieldError("harv.yieldHar", getText("message.invaliddatayieldsilage.harvest"));
                        addActionError(getText("desc.invaliddatayieldsilage.harvest"));
                    }
                }
                
            } */

//            if (harv.getYieldHar()!=null && harv.getYieldHar()!=0) {
//                if (harv.getYieldHar()<0 || harv.getYieldHar()>30000) {
//                    addFieldError("harv.yieldHar", getText("message.invaliddatayield.harvest"));
//                    addActionError(getText("desc.invaliddatayield.harvest"));
//                }
//            }
          /*  
            if (harv.getHumidityPercentageHar() != null) {
                if (harv.getHumidityPercentageHar()<0 || harv.getHumidityPercentageHar()>100) {
                    addFieldError("harv.humidityPercentageHar", getText("message.invaliddatahumidity.harvest"));
                    addActionError(getText("desc.invaliddatahumidity.harvest"));
                }
            }*/
            sowing=null;
        }
    }     

    /**
     * Encargado de guardar la informacion suministrada por el usuario 
     * @return Estado del proceso
     */
    public String saveData() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/create") || !usrDao.getPrivilegeUser(idUsrSystem, "crop/modify")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        String action = "";
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

            if (costo.getIdCostIndPro()==null) {
                CostIndirectProductionEvent costTemp = costDao.objectById(idCrop);
                if (costTemp!=null) {
                    costo.setIdCostIndPro(costTemp.getIdCostIndPro());
                }
            }  
            costo.setProductionEvents(new ProductionEvents(idCrop));  
            costo.setStatus(true);
            session.saveOrUpdate(costo);
            
            LogEntities log = null;            
            log = LogEntitiesDao.getData(idEntSystem, costo.getIdCostIndPro(), "cost_indirect_production_event", action);
            if ((log==null && action.equals("C")) || action.equals("M")) {
                log = new LogEntities();
                log.setIdLogEnt(null);
                log.setIdEntityLogEnt(idEntSystem);
                log.setIdObjectLogEnt(costo.getIdCostIndPro());
                log.setTableLogEnt("cost_indirect_production_event");
                log.setDateLogEnt(new Date());
                log.setActionTypeLogEnt(action);
                session.saveOrUpdate(log);
            }                        
            
            tx.commit();           
            state = "success";            
            if (action.equals("C")) {
                info  = getText("message.successadd.cost");
//                return "list";
            } else if (action.equals("M")) {
                info  = getText("message.successedit.cost");
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
                info  = getText("message.failadd.cost");
            } else if (action.equals("M")) {
                info  = getText("message.failedit.cost");
            }
        } finally {
            session.close();
        }  
        
//        return ERROR;
        return "states";
    }
    
    
     /**
     * Encargado de guardar la informacion suministrada
     * @return Estado del proceso
     */
    public String saveDataPerformance() {
        
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
         if (this.getIdCrop()!= -1) {
            setValuesCrop(this.getIdCrop());
        }

        try {
            tx = session.beginTransaction();
            
                        
             if (event.getIdProEve()==null) {
                ProductionEvents eventTemp = cropDao.objectById(idCrop);
                if (eventTemp!=null) {
                    event.setIdProEve(eventTemp.getIdProEve());
                }
            }   
            event.setFields(new Fields(idField));
            event.setCropsTypes(new CropsTypes(typeCrop));
            event.setIdProjectProEve(1);            
            if (lastCrop==1000000) {
                event.setFormerCropProEve(null);
                event.setOtherFormerCropProEve(otherCrop);
            } else {
                event.setFormerCropProEve(lastCrop);
            }
           // event.setStatus(true); 
           // session.saveOrUpdate(event);  
           // tx.commit();           
       
            
            ////////////////v2            
            double areaCropSel = 0.0;
            areaCropSel = (event.getQuantAreaProEve()!=null) ? event.getQuantAreaProEve() : 0.0;
                                  
            Fields lot = lotDao.objectById(this.getIdField()); 
//            double areaOld = lot.getAreaFie();
            double areaAvaOld = lot.getAvailableAreaFie();
            /* 
             1-Porcentaje ((Area del lote * porcentaje/100)) = Area)
             2-Hectarea   ((Area/Area del lote)*100=porcentaje)
             */
//            System.out.println("areaCrop=>"+areaCrop);
            if (areaCrop == null) areaCrop = 0.0;
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
            
            event.setQuantAreaProEve(areaCrop);
            event.setTypeAreaProEve(typeArea);           
            event.setFields(new Fields(idField));
            event.setCropsTypes(new CropsTypes(typeCrop));
            event.setIdProjectProEve(1);  
            if (coCode.equals("NI")) {this.setCostCrop(false);}
            event.setCostProEve(this.getCostCrop());
//            System.out.println("cost=>"+this.getCostCrop());
//            throw new HibernateException("Prueba de Costo");
            if (lastCrop==1000000) {
                event.setFormerCropProEve(null);
                event.setOtherFormerCropProEve(otherCrop);
            } else {
                event.setFormerCropProEve(lastCrop);
            }
            event.setStatus(true);
            session.saveOrUpdate(event);
            
//            entDao.save(ent);          
//            System.out.println("pruebaCrea");      
                        
           
            
            LogEntities log = null;            
            log = LogEntitiesDao.getData(idEntSystem, event.getIdProEve(), "production_events", action);
            if ((log==null && action.equals("C")) || action.equals("M")) {
                log = new LogEntities();
                log.setIdLogEnt(null);
                log.setIdEntityLogEnt(idEntSystem);
                log.setIdObjectLogEnt(event.getIdProEve());
                log.setTableLogEnt("production_events");
                log.setDateLogEnt(new Date());
                log.setActionTypeLogEnt(action);
                session.saveOrUpdate(log);
            }
            idCrop = event.getIdProEve();            
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

}