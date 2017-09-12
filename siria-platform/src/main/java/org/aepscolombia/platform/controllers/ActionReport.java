
package org.aepscolombia.platform.controllers;

import java.io.FileNotFoundException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.script.ScriptException;
import org.aepscolombia.platform.models.dao.BeansDao;
import org.aepscolombia.platform.models.dao.ControlsDao;
import org.aepscolombia.platform.models.dao.CropsTypesDao;
import org.aepscolombia.platform.models.dao.DepartmentsDao;
import org.aepscolombia.platform.models.dao.DocumentsTypesDao;
import org.aepscolombia.platform.models.dao.EntitiesDao;
import org.aepscolombia.platform.models.dao.FertilizationsDao;

import org.aepscolombia.platform.models.dao.LogEntitiesDao;
import org.aepscolombia.platform.models.dao.FieldsDao;
import org.aepscolombia.platform.models.dao.GenotypesDao;
import org.aepscolombia.platform.models.dao.GenotypesSowingDao;
import org.aepscolombia.platform.models.dao.IrrigationDao;
import org.aepscolombia.platform.models.dao.MaizeDao;
import org.aepscolombia.platform.models.dao.MonitoringDao;
import org.aepscolombia.platform.models.dao.PhysiologicalMonitoringDao;
import org.aepscolombia.platform.models.dao.PreparationsDao;
import org.aepscolombia.platform.models.dao.ProductionEventsDao;
import org.aepscolombia.platform.models.dao.RastasDao;
import org.aepscolombia.platform.models.dao.ResidualsManagementDao;
import org.aepscolombia.platform.models.dao.SowingDao;
import org.aepscolombia.platform.models.dao.UsersDao;
import org.aepscolombia.platform.models.entity.Beans;
import org.aepscolombia.platform.models.entity.CropsTypes;
import org.aepscolombia.platform.models.entity.Departments;
import org.aepscolombia.platform.models.entity.DocumentsTypes;
import org.aepscolombia.platform.models.entity.Entities;
import org.aepscolombia.platform.models.entity.Genotypes;
import org.aepscolombia.platform.models.entity.GenotypesSowing;
import org.aepscolombia.platform.models.entity.HorizontesRasta;
import org.aepscolombia.platform.models.entity.Maize;
import org.aepscolombia.platform.models.entity.PhysiologicalMonitoring;
import org.aepscolombia.platform.models.entity.ProductionEvents;
import org.aepscolombia.platform.models.entity.Rastas;
import org.aepscolombia.platform.models.entity.Sowing;
import org.aepscolombia.platform.models.entity.Users;
import org.aepscolombia.platform.util.APConstants;
import org.aepscolombia.platform.util.GlobalFunctions;


/**
 * Clase ActionCrop
 *
 * Contiene los metodos para interactuar con el modulo de Cultivo
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ActionReport extends BaseAction {
    
    /**
     * Atributos provenientes del formulario
     */
    private Integer typeReport; 

    //Reporte Anual
    private Integer selYear;
    private Integer year_begin;
    private Integer year_end;
    private String name_producer;
    private String type_doc;
    private String num_doc;

    //Reporte Departamento
    private String depSel;
    private String nameProDep;
    private String typeDocDep;
    private String numDocDep;
    private List<DocumentsTypes> type_ident_producer;    
    private List<Departments> list_departments;
    private List<CropsTypes> type_crops;
    
    private Users user;
    private Integer idEntSystem;    
    private String coCode;    
    private Integer idUsrSystem;    
    private ProductionEvents event = new ProductionEvents();
    private UsersDao usrDao;
    private RastasDao rastaDao   = new RastasDao();;
    private Rastas rasta;
    private FieldsDao lotDao    = new FieldsDao();
    private HashMap fieldInfo;
    private HashMap cropInfo;
    private List<Genotypes> type_genotypes;
    private List<GenotypesSowing> type_genotypes_sow;
    private Sowing sowing = new Sowing();
    private Maize maize   = new Maize();
    private Beans beans   = new Beans();
    private PhysiologicalMonitoring phys = new PhysiologicalMonitoring();

    /**
     * Metodos getter y setter por cada variable del formulario
     */    

    public ProductionEvents getEvent() {
        return event;
    }

    public void setEvent(ProductionEvents event) {
        this.event = event;
    }  
    
    public void setType_ident_producer(List<DocumentsTypes> type_ident_producer) {
        this.type_ident_producer = type_ident_producer;
    }

    public List<DocumentsTypes> getType_ident_producer() {
        return type_ident_producer;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
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

    public Integer getTypeReport() {
        return typeReport;
    }

    public void setTypeReport(Integer typeReport) {
        this.typeReport = typeReport;
    }

    public Integer getSelYear() {
        return selYear;
    }

    public void setSelYear(Integer selYear) {
        this.selYear = selYear;
    }

    public Integer getYear_begin() {
        return year_begin;
    }

    public void setYear_begin(Integer year_begin) {
        this.year_begin = year_begin;
    }

    public Integer getYear_end() {
        return year_end;
    }

    public void setYear_end(Integer year_end) {
        this.year_end = year_end;
    }

    public String getDepSel() {
        return depSel;
    }

    public void setDepSel(String depSel) {
        this.depSel = depSel;
    }

    public String getNameProDep() {
        return nameProDep;
    }

    public void setNameProDep(String nameProDep) {
        this.nameProDep = nameProDep;
    }

    public String getTypeDocDep() {
        return typeDocDep;
    }

    public void setTypeDocDep(String typeDocDep) {
        this.typeDocDep = typeDocDep;
    }

    public String getNumDocDep() {
        return numDocDep;
    }

    public void setNumDocDep(String numDocDep) {
        this.numDocDep = numDocDep;
    }

    public List<Departments> getList_departments() {
        return list_departments;
    }

    public void setList_departments(List<Departments> list_departments) {
        this.list_departments = list_departments;
    }
    
    public List<CropsTypes> getType_crops() {
        return type_crops;
    }

    public void setType_crops(List<CropsTypes> type_crops) {
        this.type_crops = type_crops;
    } 

    public Rastas getRasta() {
        return rasta;
    }

    public void setRasta(Rastas rasta) {
        this.rasta = rasta;
    }

    public HashMap getFieldInfo() {
        return fieldInfo;
    }

    public void setFieldInfo(HashMap fieldInfo) {
        this.fieldInfo = fieldInfo;
    }   

    public HashMap getCropInfo() {
        return cropInfo;
    }

    public void setCropInfo(HashMap cropInfo) {
        this.cropInfo = cropInfo;
    }   
    
    private List<HorizontesRasta> additionalsAtrib; 

    public List<HorizontesRasta> getAdditionalsAtrib() {
        return additionalsAtrib;
    }

    public void setAdditionalsAtrib(List<HorizontesRasta> additionalsAtrib) {
        this.additionalsAtrib = additionalsAtrib;
    }
    
    private List<HashMap> lastCrops;

    public List<HashMap> getLastCrops() {
        return lastCrops;
    }

    public void setLastCrops(List<HashMap> lastCrops) {
        this.lastCrops = lastCrops;
    }   
    
    private List<HashMap> listPrep;

    public List<HashMap> getListPrep() {
        return listPrep;
    }

    public void setListPrep(List<HashMap> listPrep) {
        this.listPrep = listPrep;
    }   
    
    private List<HashMap> listIrr;

    public List<HashMap> getListIrr() {
        return listIrr;
    }

    public void setListIrr(List<HashMap> listIrr) {
        this.listIrr = listIrr;
    }   
    
    private List<HashMap> listFert;

    public List<HashMap> getListFert() {
        return listFert;
    }

    public void setListFert(List<HashMap> listFert) {
        this.listFert = listFert;
    }   
    
    private List<HashMap> listCont;

    public List<HashMap> getListCont() {
        return listCont;
    }

    public void setListCont(List<HashMap> listCont) {
        this.listCont = listCont;
    }   
    
    private List<HashMap> listMon;

    public List<HashMap> getListMon() {
        return listMon;
    }

    public void setListMon(List<HashMap> listMon) {
        this.listMon = listMon;
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
    
    public Sowing getSowing() {
        return sowing;
    }

    public void setSowing(Sowing sowing) {
        this.sowing = sowing;
    } 

    public Maize getMaize() {
        return maize;
    }

    public void setMaize(Maize maize) {
        this.maize = maize;
    }

    public Beans getBeans() {
        return beans;
    }

    public void setBeans(Beans beans) {
        this.beans = beans;
    }  

    public PhysiologicalMonitoring getPhys() {
        return phys;
    }

    public void setPhys(PhysiologicalMonitoring phys) {
        this.phys = phys;
    }   
    
    private ResidualsManagementDao resDao = new ResidualsManagementDao();
    private PreparationsDao prepDao = new PreparationsDao();
    private FertilizationsDao fertDao     = new FertilizationsDao();
    private ControlsDao conDao    = new ControlsDao();
    private SowingDao sowDao      = new SowingDao();
    private BeansDao beansDao     = new BeansDao();
    private MaizeDao maizeDao     = new MaizeDao();
    private PhysiologicalMonitoringDao physDao     = new PhysiologicalMonitoringDao();
    private IrrigationDao irrDao  = new IrrigationDao();
    private MonitoringDao monDao  = new MonitoringDao();
    
    private String lanSel;

    public String getLanSel() {
        return lanSel;
    }

    public void setLanSel(String lanSel) {
        this.lanSel = lanSel;
    }
    /**
     * Atributos generales de clase
     */
    private HashMap additionals;
    private int page = 1, countTotal, maxResults = 10;
    
    private ProductionEventsDao cropDao    = new ProductionEventsDao();    
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
    
    @Override
    public void prepare() throws Exception {
        user = (Users) this.getSession().get(APConstants.SESSION_USER);
//        coCode = user.getCountryUsr().getAcronymIdCo();
        coCode = (String) this.getSession().get(APConstants.COUNTRY_CODE);
        idEntSystem = UsersDao.getEntitySystem(user.getIdUsr());
        this.setType_ident_producer(new DocumentsTypesDao().findAll(coCode));
        this.setList_departments(new DepartmentsDao().findAll(coCode));
        this.setType_crops(new CropsTypesDao().findAll(coCode));
        usrDao = new UsersDao();
        idUsrSystem = user.getIdUsr();
        EntitiesDao entDao = new EntitiesDao();
        Entities entTemp = entDao.findById(idEntSystem);
        typeEnt = entTemp.getEntitiesTypes().getIdEntTyp();
        String lanTemp = (String) this.getSession().get(APConstants.SESSION_LANG);
        lanSel = lanTemp.replace(coCode.toLowerCase(), "");
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
        if (actExe.equals("cropcheck") || actExe.equals("modify")) {
            HashMap required = new HashMap();
//            required.put("nameField", nameField);
//            required.put("typeCrop", typeCrop);
//            required.put("lastCrop", lastCrop);
//            required.put("drainPlot", drainPlot);    
//            boolean enter = false;
//            
//            if (lastCrop==1000000) {
//                required.put("otherCrop", otherCrop);
//            }
//            
//            for (Iterator it = required.keySet().iterator(); it.hasNext();) {
//                String sK = (String) it.next();
//                String sV = String.valueOf(required.get(sK));
//                System.out.println(sK + " : " + sV);
//                if (StringUtils.trim(sV).equals("null") || StringUtils.trim(sV)==null || StringUtils.trim(sV).equals("") || sV.equals("-1")) {
//                    addFieldError(sK, "El campo es requerido");
//                    enter = true;
//                }
//            }
//            
            Integer idCrop;        
            try {
                idCrop = (Integer.parseInt(this.getRequest().getParameter("idCrop")));
            } catch (NumberFormatException e) {
                idCrop = (-1);
            } 
            System.out.println("entreeeeeeeee=>"+idCrop);

            if (idCrop==-1) {
                addActionError("Debe seleccionar un cultivo");
            }
//            
//            System.out.println("performObj->"+performObj);
        }
    }
    
    private int numRows=0;

    public Integer getNumRows() {
        return numRows;
    }

    public void setNumRows(Integer numRows) {
        this.numRows = numRows;
    }

    /**
     * Encargado de generar el reporte de productividad a partir de las condiciones dadas por el usuario
     * cultivos registrados a un usuario
     * @param valName:  Nombre del valor a buscar
     * @param valId:    Identificacion del valor a buscar
     * @param selected: Valor seleccionado
     * @return lista de cultivos
     */
    public String viewReport() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        
        additionals = new HashMap();
        HashMap findParams = new HashMap();
        
        findParams.put("idEntUser", idEntSystem);
        findParams.put("selYear", selYear);
        findParams.put("year_begin", year_begin);
        findParams.put("year_end", year_end);
        findParams.put("name_producer", name_producer);
        findParams.put("type_doc", type_doc);
        findParams.put("num_doc", num_doc);
        findParams.put("depSel", depSel);
        findParams.put("nameProDep", nameProDep);
        findParams.put("typeDocDep", typeDocDep);
        findParams.put("numDocDep", numDocDep);
        
        String semester = "";
        String semesterVal = "";
        String semesterOut = "";
        HashMap semA;
        HashMap semB;
        String categories = "";
        String outlier    = "";
        String values     = "";
        if (typeReport == 1) {
//            if (typeEnt==1) {            
            if (typeEnt==1 && (name_producer==null || name_producer.equals("")) && (num_doc==null || num_doc.equals(""))) {            
                if (selYear == 1) {
                    semester = "'"+year_begin+"-01-01' and '"+year_begin+"-06-30'";
                    semA = cropDao.getReportAnnualAgronomist(findParams, semester, 0);
                    semester = "'"+year_begin+"-07-01' and '"+year_begin+"-12-31'";
                    semB = cropDao.getReportAnnualAgronomist(findParams, semester, 1);
                    categories = "\"categories\" : \"['A ("+year_begin+")', 'B ("+year_begin+")']\"";
                    values     = "\"values\": \"["+semA.get("info")+","+semB.get("info")+"]\"";
                    outlier    = "\"outlier\": \"[";
                    semesterOut   = String.valueOf(semA.get("out"));
                    if (!semesterOut.isEmpty() && !semesterOut.equals("")) outlier  += semA.get("out")+",";
                    semesterOut   = String.valueOf(semB.get("out"));
                    if (!semesterOut.isEmpty() && !semesterOut.equals("")) outlier  += semB.get("out");
                    outlier    += "]\"";
                } else if (selYear == 2) { 
                    Integer diff = (year_end - year_begin)+1;
                    categories = "\"categories\" : \"[";
                    values     = "\"values\": \"[";
                    outlier    = "\"outlier\": \"[";
                    int cont   = 0;
                    int pos    = 0;
                    for (int i=1; i<=diff; i++) {
                        semester = "'"+(year_begin+cont)+"-01-01' and '"+(year_begin+cont)+"-06-30'";
                        semA = cropDao.getReportAnnualAgronomist(findParams, semester, (pos));
                        semester = "'"+(year_begin+cont)+"-07-01' and '"+(year_begin+cont)+"-12-31'";
                        semB = cropDao.getReportAnnualAgronomist(findParams, semester, (pos+1));                        
                        if (i!=diff) {
                            categories += "'A ("+(year_begin+cont)+")', 'B ("+(year_begin+cont)+")', ";
                            values   += semA.get("info")+","+semB.get("info")+",";
                            semesterOut  = String.valueOf(semA.get("out"));
                            if (!semesterOut.isEmpty() && !semesterOut.equals("")) outlier  += semA.get("out")+",";
                            semesterOut  = String.valueOf(semB.get("out"));
                            if (!semesterOut.isEmpty() && !semesterOut.equals("")) outlier  += semB.get("out")+",";
                        } else {
                            categories += "'A ("+(year_begin+cont)+")', 'B ("+(year_begin+cont)+")'";
                            values   += semA.get("info")+","+semB.get("info");
                            semesterOut  = String.valueOf(semA.get("out"));
                            if (!semesterOut.isEmpty() && !semesterOut.equals("")) outlier  += semA.get("out")+",";
                            semesterOut  = String.valueOf(semB.get("out"));
                            if (!semesterOut.isEmpty() && !semesterOut.equals("")) outlier  += semB.get("out");
                        }
                        cont++;
                        pos+=2;
                    }
                    categories += "]\"";
                    outlier    += "]\"";
                    values     += "]\"";
                }
                info    = "{"+categories+", "+outlier+", "+values+"}";
                return "reportBox";
            } else {
                semA    = cropDao.getReportAnnualProducer(findParams);
//                values  = "\"values\": "+cropDao.getReportAnnualProducer(findParams);
                info    = "{"+semA.get("info")+","+semA.get("format")+"}";
                return "reportDet";
            }
        } else if (typeReport == 2) {
        } 
        return SUCCESS;
    }    
    
    private Double maxDepth;
    private Boolean checkBurning;

    public Double getMaxDepth() {
        return maxDepth;
    }

    public void setMaxDepth(Double maxDepth) {
        this.maxDepth = maxDepth;
    }

    public Boolean getCheckBurning() {
        return checkBurning;
    }

    public void setCheckBurning(Boolean checkBurning) {
        this.checkBurning = checkBurning;
    }   
    
    private HashMap infoReport;

    public HashMap getInfoReport() {
        return infoReport;
    }

    public void setInfoReport(HashMap infoReport) {
        this.infoReport = infoReport;
    }    
    
    private boolean[] divisions;

    public boolean[] getDivisions() {
        return divisions;
    }    
    

    /**
     * Encargado de generar el reporte de cropcheck a partir de un lote determinado
     * @param idField: Id del Lote seleccionado
     * @return lista de informacion correspondiente de cropcheck
     */
    public String viewCropcheck() {
        if (!usrDao.getPrivilegeUser(idUsrSystem, "crop/list")) {
            return BaseAction.NOT_AUTHORIZED;
        }
        
        Integer idCrop;        
        try {
            idCrop = (Integer.parseInt(this.getRequest().getParameter("idCrop")));
        } catch (NumberFormatException e) {
            idCrop = (-1);
        } 

        if (idCrop!=-1) {
            cropInfo         = cropDao.findById(idCrop);
            Integer idField  = Integer.parseInt(String.valueOf(cropInfo.get("idField")));
            Integer typeCrop = Integer.parseInt(String.valueOf(cropInfo.get("typeCrop")));
            fieldInfo        = lotDao.findById(idField);
            rasta            = rastaDao.getRastaByField(idField);
            String info      = "";
            if (rasta!=null) {
                GlobalFunctions glo = new GlobalFunctions();
                try {   
//                    System.out.println("rasta.getIdRas()=>"+rasta.getIdRas());
                    if (rasta.getProfundidadEfectivaRas()==null || true) {
                        HashMap res = glo.getResultRasta(rasta.getIdRas());     
                        if (res.get("depth")!=null)
                            rasta.setProfundidadEfectivaRas(Double.parseDouble(String.valueOf(res.get("depth"))));
                        rastaDao.save(rasta);
                    }
                    
                } catch (ScriptException ex) {
                    info  = getText("message.failtoshowinfo.soil");
                } catch (FileNotFoundException ex) {
                    info  = getText("message.failtoloadscript.soil");
                }                
                additionalsAtrib = rastaDao.getHorizonRasta(rasta.getIdRas());
            }
                lastCrops        = lotDao.getLastCrops(idField);
                HashMap findParams = new HashMap();
                findParams.put("idEvent", idCrop);
                findParams.put("coCode", coCode);
                boolean checkDirect  = prepDao.haveDirectSowing(findParams);
                checkBurning = false;
                if (checkDirect) checkBurning = resDao.haveBurning(findParams);

                maxDepth = prepDao.getMaxDepth(findParams);
                listPrep = prepDao.findByParams(findParams);
                listFert = fertDao.findByParams(findParams);
                type_genotypes = new GenotypesDao().findAllByTypeCrop(typeCrop, 0, coCode);
                type_genotypes_sow = new GenotypesSowingDao().findAllByTypeCrop(typeCrop, coCode);
                sowing = sowDao.objectById(idCrop);
                beans  = beansDao.objectById(idCrop);
                maize  = maizeDao.objectById(idCrop);
                phys   = physDao.objectById(idCrop);
                listCont = conDao.findByParams(findParams);
                listIrr  = irrDao.findByParams(findParams);
//                listMon  = monDao.findByParams(findParams);
                boolean checkMonitoring = false;
                boolean checkControlsWeeds    = false;
                boolean checkControlsDiseases = false;
                infoReport      = new HashMap();
                checkMonitoring = monDao.checkMonitoring(findParams);
                checkControlsWeeds    = conDao.checkControlsWeeds(findParams);
                checkControlsDiseases = conDao.checkControlsDiseases(findParams);
                
                infoReport.put("monCheck", checkMonitoring);
                infoReport.put("conWeeds", checkControlsWeeds);
                infoReport.put("conDiseases", checkControlsDiseases);
//                fieldInfo.get("id_dep");
                
                if (sowing!=null) findParams.put("dateSow", sowing.getDateSow());
                findParams.put("depId", String.valueOf(fieldInfo.get("id_dep")));
                findParams.put("cropType", typeCrop);
                if (typeCrop==2){
                    if(beans.getGrowingEnvironment()!=null) findParams.put("growId", beans.getGrowingEnvironment().getIdGroEnv());
                }
                
                double[] distrib   = fertDao.getDistribution(findParams);
                double[] nutrients = fertDao.getNutrients(findParams);
                boolean resultCompare = fertDao.compareNutrients(distrib, nutrients);                
                infoReport.put("elements", resultCompare);
                
                divisions = fertDao.getDivisions(findParams);
        } else {
            return INPUT;
        }        
        
        return SUCCESS;
    }    
    
}
