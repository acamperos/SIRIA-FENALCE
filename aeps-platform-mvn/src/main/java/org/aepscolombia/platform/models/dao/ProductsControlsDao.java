package org.aepscolombia.platform.models.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.aepscolombia.platform.models.entity.ChemicalsControls;
import org.aepscolombia.platform.models.entity.Diseases;
import org.aepscolombia.platform.models.entity.OrganicControls;
import org.aepscolombia.platform.models.entity.Pests;
//import org.aepscolombia.plataforma.models.dao.IEventoDao;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.aepscolombia.platform.models.entity.ProductsControls;
import org.aepscolombia.platform.models.entity.Weeds;
import org.aepscolombia.platform.util.HibernateUtil;
import org.hibernate.Criteria;

/**
 * Clase ProductsControlsDao
 *
 * Contiene los metodos para interactuar con la tabla ProductsControls de la base de datos (BD)
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ProductsControlsDao 
{    
    
    public HashMap findById(Integer id) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        HashMap result = new HashMap();
        return result;
    }
    
    public List<ProductsControls> findAll() {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<ProductsControls> events = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from ProductsControls");
            events = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return events;
    }

    public List findByParams(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<HashMap> result = new ArrayList<HashMap>();
        return result;
    }    
    
    public List getProductsControls(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> resultProd = new ArrayList<HashMap>();

        String sql = "";
        String sqlAdd = "";

        sql += "select p.target_type_pro_con, pl.name_pes, mal.name_wee, enf.name_dis, tp.name_che_con, p.other_chemical_product_pro_con, cr.name_org_con,";
        sql += " p.other_organic_product_pro_con, tob.name_tar_typ, p.dosis_pro_con, ud.name_dos_uni,";
        sql += " p.other_pest_pro_con, p.otro_weed_pro_con, p.other_disease_pro_con, p.control_type_pro_con, p.id_pro_con, p.id_control_pro_con, count(p.id_pro_con)";
        sql += " from products_controls p";
        sql += " inner join controls con on p.id_control_pro_con=con.id_con";
        sql += " inner join dose_units dose on p.dose_units_pro_con=dose.id_dos_uni";
        sql += " inner join targets_types tar on p.target_type_pro_con=tar.id_tar_typ";
        sql += " inner join controls_types ct on p.control_type_pro_con=ct.id_con_typ";
        sql += " left join diseases enf on enf.id_dis=p.id_disease_pro_con and enf.status_dis=1";
        sql += " left join pests pl on pl.id_pes=p.id_pest_pro_con and pl.status_pes=1";
        sql += " left join weeds mal on mal.id_wee=p.id_weed_pro_con and mal.status_wee=1";
        sql += " left join chemicals_controls tp on tp.id_che_con=p.chemical_product_used_pro_con";
        sql += " left join organic_controls cr on cr.id_org_con=p.organic_product_used_pro_con";
        sql += " left join dose_units ud on ud.id_dos_uni=p.dose_units_pro_con and ud.status_dos_uni=1";
        sql += " where con.status=1";
        if (args.containsKey("idCon")) {
            sql += " and p.id_control_pro_con=" + args.get("idCon");
        }
        sqlAdd += " order by p.id_pro_con ASC";
        sql += sqlAdd;
//        System.out.println("sql->"+sql);
        try {
            tx = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            events = query.list();

            for (Object[] data : events) {

                String nameObj = "";
                int targetTy = Integer.parseInt(String.valueOf(data[0]));

                if (targetTy == 1) {
                    nameObj = (!String.valueOf(data[1]).equals("null") ? String.valueOf(data[1]) : String.valueOf(data[11]));
                } else if (targetTy == 2) {
                    nameObj = (!String.valueOf(data[2]).equals("null") ? String.valueOf(data[2]) : String.valueOf(data[12]));
                } else if (targetTy == 3) {
                    nameObj = (!String.valueOf(data[3]).equals("null") ? String.valueOf(data[3]) : String.valueOf(data[13]));
                }
                String nameChe = (!String.valueOf(data[4]).equals("null") ? String.valueOf(data[4]) : String.valueOf(data[5]));
                String nameOrg = (!String.valueOf(data[6]).equals("null") ? String.valueOf(data[6]) : String.valueOf(data[7]));
                HashMap temp = new HashMap();
                temp.put("idCon", data[16]);
                temp.put("idTarTyp", targetTy);
                temp.put("nameTarTyp", data[8]);
                temp.put("nameConTyp", nameObj);
                temp.put("conType", data[14]);

                HashMap tempInfo = new HashMap();
                tempInfo.put("chemCon", nameChe);
                tempInfo.put("orgCon", nameOrg);
                String valUnit = "";
                String unit = String.valueOf(data[10]);
                if (data[10] != null) {
                    valUnit = "-" + unit;
                }
                String doseInfo = String.valueOf(data[9]);
                Double doseVal = null;
                if (doseInfo != null && !doseInfo.equals("null")) {
                    doseVal = Double.parseDouble(doseInfo);
                }
                Double doseCon = null;
                if (args.containsKey("coCode")) {
                    String coCode = String.valueOf(args.get("coCode"));
                    if (coCode.equals("NI") && unit.equals("q/mz")) {
                        doseCon = doseVal * 0.01522;
                    } else {
                        doseCon = doseVal;
                    }
                }
                tempInfo.put("doseCon", doseCon + valUnit);
                tempInfo.put("contControls", Integer.parseInt(String.valueOf(data[17])));
                temp.put("infoControl", tempInfo);
                resultProd.add(temp);
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return resultProd;
    }
    
    public int deleteProducts(Integer idCon) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        int numDelete = 0;
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            String sql  = "delete from products_controls where id_control_pro_con="+idCon;
            Query query = session.createSQLQuery(sql);
            numDelete   = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return numDelete;
    }
       
    public List<ProductsControls> getListProducts(Integer idCon, String coCode) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<ProductsControls> eventsTemp = null;
        List<ProductsControls> result     = new ArrayList<ProductsControls>();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String sql = "select p.id_pro_con, p.id_control_pro_con, p.control_type_pro_con,";
            sql += " p.target_type_pro_con, p.chemical_product_used_pro_con, p.organic_product_used_pro_con, p.dosis_pro_con, p.dose_units_pro_con, p.id_pest_pro_con, p.id_disease_pro_con,"; 
            sql += " p.id_weed_pro_con, p.other_pest_pro_con, p.other_disease_pro_con, p.otro_weed_pro_con, p.other_chemical_product_pro_con, c.cleanings_con, c.cleanings_frequence_con, c.id_production_event_con,"; 
            sql += " c.date_con, c.dosis_con, c.cost_app_con, c.comment_con, c.cost_input_con, c.cost_form_app_con, c.status, c.created_by,";
            sql += " t.id_tar_typ, t.name_tar_typ, t.country_tar_typ, t.status_tar_typ,";
            sql += " ct.id_con_typ, ct.name_con_type, ct.country_con_typ, ct.status_con_typ,";
            sql += " du.id_dos_uni, du.name_dos_uni, du.country_dos_uni, du.status_dos_uni,";
            sql += " oc.id_org_con, oc.name_org_con, oc.target_type_org_con, oc.country_org_con,";
            sql += " cc.id_che_con, cc.name_che_con, cc.comer_name_che_con, cc.target_name_che_con,";
            sql += " d.id_dis, d.name_dis, d.status_dis,";
            sql += " pes.id_pes, pes.name_pes, pes.status_pes,";
            sql += " w.id_wee, w.name_wee, w.status_wee,";
            sql += " p.other_organic_product_pro_con, p.status, p.created_by, c.id_con";             
            sql += " from products_controls p";
            sql += " inner join controls c on c.id_con = p.id_control_pro_con";
            sql += " inner join targets_types t on t.id_tar_typ = p.target_type_pro_con";
            sql += " inner join controls_types ct on ct.id_con_typ = p.control_type_pro_con";
            sql += " inner join dose_units du on du.id_dos_uni = p.dose_units_pro_con";
            sql += " left join organic_controls oc on oc.id_org_con = p.organic_product_used_pro_con";
            sql += " left join chemicals_controls cc on cc.id_che_con = p.chemical_product_used_pro_con";
            sql += " left join diseases d on p.id_disease_pro_con = d.id_dis";
            sql += " left join pests pes on p.id_pest_pro_con = pes.id_pes";
            sql += " left join weeds w on p.id_weed_pro_con = w.id_wee";
            sql += " where p.status=1 and p.id_control_pro_con="+idCon;
//            System.out.println("sql=>"+sql);
            Query query = session.createSQLQuery(sql).addEntity("p", ProductsControls.class).addJoin("c", "p.controls").addJoin("t", "p.targetsTypes")
                    .addJoin("ct", "p.controlsTypes").addJoin("du", "p.doseUnits")
                    .addJoin("cc", "p.chemicalsControls").addJoin("oc", "p.organicControls")
                    .addJoin("pes", "p.pests").addJoin("d", "p.diseases").addJoin("w", "p.weeds")
                    .addEntity("p", ProductsControls.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            eventsTemp = query.list();            
            tx.commit();
            for (ProductsControls data : eventsTemp) {
                /*PestsDao pestDao = new PestsDao();
                WeedsDao weedDao = new WeedsDao();
                DiseasesDao disDao = new DiseasesDao();
                if (data.getTargetsTypes().getIdTarTyp()==1) {
                    data.setPests(pestDao.objectById(data.getPests().getIdPes()));                    
                } else if (data.getTargetsTypes().getIdTarTyp()==2) {
                    data.setWeeds(weedDao.objectById(data.getWeeds().getIdWee()));                    
                } else if (data.getTargetsTypes().getIdTarTyp()==3) {
                    data.setDiseases(disDao.objectById(data.getDiseases().getIdDis()));                    
                }
                
                ChemicalsControlsDao cheDao = new ChemicalsControlsDao();
                OrganicControlsDao orgDao = new OrganicControlsDao();
                if (data.getControlsTypes().getIdConTyp()==1) {
                    data.setOrganicControls(orgDao.objectById(data.getOrganicControls().getIdOrgCon()));                    
                } else if (data.getControlsTypes().getIdConTyp()==2 || data.getControlsTypes().getIdConTyp()==6) {
                    data.setChemicalsControls(cheDao.objectById(data.getChemicalsControls().getIdCheCon()));                    
                }*/
//                System.out.println("data.weed=>"+data.getWeeds().getNameWee());
                if (data.getOtherPestProCon()!=null && !data.getOtherPestProCon().equals("")) data.setPests(new Pests(1000000, "Otro"));
                if (data.getOtherDiseaseProCon()!=null && !data.getOtherDiseaseProCon().equals("")) data.setDiseases(new Diseases(1000000, "Otro"));
                if (data.getOtroWeedProCon()!=null && !data.getOtroWeedProCon().equals("")) data.setWeeds(new Weeds(1000000, "Otro"));
                if (data.getOtherChemicalProductProCon()!=null && !data.getOtherChemicalProductProCon().equals("")) data.setChemicalsControls(new ChemicalsControls(1000000, "Otro"));
                if (data.getOtherOrganicProductProCon()!=null && !data.getOtherOrganicProductProCon().equals("")) data.setOrganicControls(new OrganicControls(1000000, "Otro"));
                if (coCode.equals("NI")) {
                    double res = Double.parseDouble(data.getDosisProCon())*0.01522;
                    data.setDosisProCon(""+res);
                }
                result.add(data);
            }
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
//            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    
//    public Integer getTotalControlsByTarget(String idFert, String targetType) {
//        SessionFactory sessions = HibernateUtil.getSessionFactory();
//        Session session = sessions.openSession();
//        int total = 0;
//        Transaction tx = null;
//        
//        String sql = "";             
//        HashMap temp = new HashMap();
//        try {
//            tx = session.beginTransaction();
//            sql = "select count(fq.id_che_fer)";
//            sql += " from chemical_fertilizations fq"; 
//            sql += " where fq.id_fertilization_che_fer="+idFert;
//            Query query  = session.createSQLQuery(sql);
//            total += Integer.parseInt(String.valueOf(query.uniqueResult()));
//            
//            sql = "select count(fq.id_org_fer)";
//            sql += " from organic_fertilizations fq"; 
//            sql += " where fq.id_fertilization_org_fer="+idFert;
//            query  = session.createSQLQuery(sql);
//            total += Integer.parseInt(String.valueOf(query.uniqueResult()));
//            
//            sql = "select count(fq.id_ame_fer)";
//            sql += " from amendments_fertilizations fq"; 
//            sql += " where fq.id_fertilization_ame_fer="+idFert;
//            query  = session.createSQLQuery(sql);
//            total += Integer.parseInt(String.valueOf(query.uniqueResult()));
//            
//            tx.commit();
//		} catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//		} finally {
//            session.close();
//		}
//        return total;
//    }

    public void save(ProductsControls event) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(event);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void delete(ProductsControls event) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();

        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(event);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
