package org.aepscolombia.platform.models.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
//import org.aepscolombia.plataforma.models.dao.IEventoDao;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.aepscolombia.platform.models.entity.ProductsControls;
import org.aepscolombia.platform.util.HibernateUtil;

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
            sql += " p.id_weed_pro_con, p.other_pest_pro_con, p.other_disease_pro_con, p.otro_weed_pro_con, p.other_chemical_product_pro_con,"; 
            sql += " p.other_organic_product_pro_con, p.status, p.created_by"; 
            sql += " from products_controls p";
            sql += " where p.status=1 and p.id_control_pro_con="+idCon;
//            System.out.println("sql=>"+sql);
            Query query = session.createSQLQuery(sql).addEntity("p", ProductsControls.class);
            eventsTemp = query.list();
            for (ProductsControls data : eventsTemp) {
                if (coCode.equals("NI")) {
                    data.setDosisProCon(data.getDosisProCon()*0.01522);
                }
                result.add(data);
            }
            tx.commit();
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
