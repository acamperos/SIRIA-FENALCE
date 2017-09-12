package org.aepscolombia.platform.models.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
//import org.aepscolombia.plataforma.models.dao.IEventoDao;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.aepscolombia.platform.models.entity.Controls;
import org.aepscolombia.platform.util.HibernateUtil;

/**
 * Clase ControlsDao
 *
 * Contiene los metodos para interactuar con la tabla Controls de la base de datos (BD)
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ControlsDao 
{    
    
    public HashMap findById(Integer id) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        
        List<Object[]> events = null;
        Transaction tx = null;
        HashMap result = new HashMap();
        
        String sql = "";
        String sqlAdd = "";    
        
        sql += "select pe.id_pro_eve, l.id_farm_fie, l.name_fie, pe.id_crop_type_pro_eve, pe.expected_production_pro_eve, pe.former_crop_pro_eve, pe.draining_pro_eve, pe.status";
        sql += " from production_events pe";
        sql += " inner join log_entities le on le.id_object_log_ent=pe.id_pro_eve and le.table_log_ent='production_events' and le.action_type_log_ent='C'";   
        sql += " inner join fields l on l.id_fie=pe.id_field_pro_eve";
        sql += " where l.status=1 and f.status=1 and pe.status=1";
        if (id!=null) {
            sql += " and pe.id_pro_eve="+id;
        }
//        args.get("countTotal");
//        events.toArray();
//        System.out.println("sql->"+sql);        
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);            
            events = query.list();         
            
            for (Object[] data : events) {
//                System.out.println(data);
                HashMap temp = new HashMap();
                temp.put("idCrop", data[0]);
                temp.put("idField", data[1]);
                temp.put("nameField", data[2]);             
                temp.put("typeCrop", data[3]);                
                temp.put("performObj", data[4]);
                temp.put("lastCrop", data[5]);
                temp.put("drainPlot", data[6]);                
                temp.put("status", data[8]);
                result = (temp);
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
        return result;
    }
    
    public List<Controls> findAll() {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Controls> events = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Controls");
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
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> result = new ArrayList<HashMap>();
        List<HashMap> resultProd = new ArrayList<HashMap>();        
        
        String sql = "";     
        String sqlAdd = "";     
                      
        sql += "select p.id_con, p.date_con, p.dosis_con, p.cleanings_con, p.cleanings_frequence_con,";
        sql += " p.cost_app_con, p.comment_con, p.cost_input_con, p.cost_form_app_con";
        sql += " from controls p";
        sql += " inner join production_events ep on ep.id_pro_eve=p.id_production_event_con";
        sql += " inner join log_entities le on le.id_object_log_ent=p.id_con and le.table_log_ent='controls' and le.action_type_log_ent='C'";
        sql += " where p.status=1 and ep.status=1";
        if (args.containsKey("idEvent")) {
            sql += " and p.id_production_event_con=" + args.get("idEvent");
        }
//		if (args.containsKey("idEntUser")) {
//			sqlAdd += " and le.id_entity_log_ent="+args.get("idEntUser");
//		}
        sqlAdd += " order by p.id_con ASC";
        sql += sqlAdd;
//        args.get("countTotal");
        
//        int valIni = Integer.parseInt(String.valueOf(args.get("pageNow")));
//        int maxResults = Integer.parseInt(String.valueOf(args.get("maxResults")));
//        if(valIni!=1){
//            valIni = (valIni-1)*maxResults+1;
//        }    
//        events.toArray();
//                System.out.println("sql->"+sql);
        try {
            tx = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
//            System.out.println("sql->"+query.list().size());
            events = query.list();

            for (Object[] data : events) {
                HashMap temp = new HashMap();
                temp.put("idCon", data[0]);
                temp.put("dateCon", data[1]);
                temp.put("coCode", args.get("coCode"));
                temp.put("cleaning", (String.valueOf(data[3]).equals("1")) ? "Si" : "No");
                temp.put("frequence", data[4]);

                resultProd = getProductsControls(temp);
                result.addAll(resultProd);
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
        sql += " p.other_organic_product_pro_con, tar.name_tar_typ, p.dosis_pro_con, ud.name_dos_uni,";
        sql += " p.other_pest_pro_con, p.otro_weed_pro_con, p.other_disease_pro_con, p.control_type_pro_con, p.id_pro_con, p.id_control_pro_con, con.date_con";
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
                temp.put("dateCon", data[17]);                                                

                HashMap tempInfo = new HashMap();
                tempInfo.put("idProCon", data[15]);
                tempInfo.put("chemCon", nameChe);
                tempInfo.put("orgCon", nameOrg);
                tempInfo.put("idTarTyp", targetTy);
                tempInfo.put("nameTarTyp", data[8]);
                tempInfo.put("nameConTyp", nameObj);
                tempInfo.put("conType", data[14]);
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
                temp.put("contControls", getTotalProductsCon(String.valueOf(temp.get("idCon"))));
                temp.put("infoControl", tempInfo);
//                System.out.println("tempInfo=>"+temp);
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
    
    public Integer getTotalProductsCon(String idCont) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        int total = 0;
        Transaction tx = null;
        
        String sql = "";             
        HashMap temp = new HashMap();
        try {
            tx = session.beginTransaction();
            sql = "select count(p.id_pro_con)";
            sql += " from products_controls p"; 
            sql += " where p.id_control_pro_con=" + idCont;
            Query query  = session.createSQLQuery(sql);
            total += Integer.parseInt(String.valueOf(query.uniqueResult()));
            
            tx.commit();
		} catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
		} finally {
            session.close();
		}
        return total;
    }
    
    public Boolean checkControlsWeeds(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session         = sessions.openSession();
        List<Object[]> events   = null;
        Transaction tx          = null;
//        List<HashMap> result = new ArrayList<HashMap>();
        
        String sql     = "";     
        Boolean result = false;
        
//        TIMEDIFF(s.date_sow, m.date_mon) * 24
        sql += "select DATEDIFF(m.date_con,s.date_sow) as time, m.id_con";    
        sql += " from controls m";    
        sql += " inner join production_events ep on m.id_production_event_con=ep.id_pro_eve"; 
        sql += " inner join sowing s on s.id_production_event_sow=ep.id_pro_eve"; 
        sql += " inner join products_controls ps on ps.id_control_pro_con=m.id_con"; 
        sql += " where m.status=1 and ep.status=1 and ps.target_type_pro_con=2";
        if (args.containsKey("idEvent")) {
            sql += " and m.id_production_event_con="+args.get("idEvent");
        }
        sql += " order by m.id_con ASC";
//        System.out.println("sql=>"+sql);
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events = query.list(); 			

            for (Object[] data : events) {    
                int diffDay = 0;
                if (data[0]!=null) diffDay = Integer.parseInt(String.valueOf(data[0]));
                if (diffDay>=-8 && diffDay<=2) result=true;
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
        return result;
    }    
    
    public Boolean checkControlsDiseases(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session         = sessions.openSession();
        List<Object[]> events   = null;
        Transaction tx          = null;
        
        String sql     = "";     
        Boolean result = false;
        
        sql += "select DATEDIFF(m.date_con,s.flowering_date_phy_mon) as time, m.id_con";    
        sql += " from controls m";    
        sql += " inner join production_events ep on m.id_production_event_con=ep.id_pro_eve"; 
        sql += " inner join physiological_monitoring s on s.id_production_event_phy_mon=ep.id_pro_eve";
        sql += " inner join products_controls ps on ps.id_control_pro_con=m.id_con"; 
        sql += " where m.status=1 and ep.status=1 and ps.target_type_pro_con=3";
        if (args.containsKey("idEvent")) {
            sql += " and m.id_production_event_con="+args.get("idEvent");
        }
        sql += " order by m.id_con ASC";
//        System.out.println("sql=>"+sql);
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events = query.list(); 			

            for (Object[] data : events) {           
                int diffDay = 0;
                if (data[0]!=null) diffDay = Integer.parseInt(String.valueOf(data[0]));
                if (diffDay>=-10 && diffDay<=0) result=true;
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
        return result;
    }
    
    public String getControlsInfo(Integer idEvent) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        String result  = "";
        
        String sql = "";     
        String sqlAdd = "";     
                      
        sql += "select p.id_con, p.date_con, p.dosis_con, p.cleanings_con, p.cleanings_frequence_con";
        sql += " from controls p"; 
        sql += " where p.status=1";
        if (idEvent!=null && idEvent!=-1) {
            sql += " and p.id_production_event_con="+idEvent;
        }
        sqlAdd += " order by p.id_con ASC";
        sql += sqlAdd;
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events = query.list(); 
            int cont=1;

            for (Object[] data : events) {
                String valIdent  = String.valueOf(data[1]);
                Date date        = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(valIdent);
                String dateAsign = new SimpleDateFormat("yyyy-MM-dd").format(date);
                result += "{\"content\": \"Control. "+cont+"\", \"start\": \""+dateAsign+"\", \"className\": \"controls\"},";
                cont++;
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    
    public Controls objectById(Integer id) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();

        Controls event = null;
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            String hql  = "FROM Controls E WHERE E.idCon = :id_con";
            Query query = session.createQuery(hql);
            query.setParameter("id_con", id);
            event = (Controls)query.uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return event;
    }    

    public void save(Controls event) {
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

    public void delete(Controls event) {
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
    
    public static String getControls(Integer idCrop) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> eventsTotal = null;
        List<Object[]> events = null;
        Transaction tx = null;
        String result = "[";
        
        String sql = "";      
        sql += "select DATE_FORMAT(c.date_con,'%Y-%m-%d') as dateCon, c.id_pest_con, c.id_weed_con,";
        sql += " c.id_disease_con, c.control_type_con";
        sql += " from controls c"; 
        sql += " where c.status=1";
        sql += " and c.id_production_event_con="+idCrop;
//        System.out.println("sql->"+sql);
        int numCaj    = 0;
        int totResult = 0;
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events    = query.list(); 
            totResult = events.size();

            for (Object[] data : events) {
                numCaj++;
                if (totResult==numCaj) {
                    result += "{\"survey_solution[236]\":\""+data[0]+"\","+
                           "\"survey_solution[237]\":\""+data[1]+"\","+ 
                           "\"survey_solution[383]\":\""+data[2]+"\","+ 
                           "\"survey_solution[384]\":\""+data[3]+"\","+ 
                           "\"survey_solution[385]\":\""+data[4]+"\","+ 
                           "\"survey_solution[239]\":\""+data[5]+"\","+ 
                           "\"subform_id\":\""+49+"\","+ 
                           "\"idx\":"+numCaj+"}"; 
                } else {
                    result += "{\"survey_solution[236]\":\""+data[0]+"\","+
                           "\"survey_solution[237]\":\""+data[1]+"\","+ 
                           "\"survey_solution[383]\":\""+data[2]+"\","+ 
                           "\"survey_solution[384]\":\""+data[3]+"\","+ 
                           "\"survey_solution[385]\":\""+data[4]+"\","+ 
                           "\"survey_solution[239]\":\""+data[5]+"\","+ 
                           "\"subform_id\":\""+49+"\","+ 
                           "\"idx\":"+numCaj+"},"; 
                }         
            }
            result += "]";
            tx.commit();
		} catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
		} finally {
            session.close();
		}
        return result;
    }
    
    public static String getControlsBeans(Integer idCrop) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> eventsTotal = null;
        List<Object[]> events = null;
        Transaction tx = null;
        String result = "[";
        
        String sql = "";      
        sql += "select DATE_FORMAT(c.date_con,'%Y-%m-%d') as dateCon, c.id_pest_con, c.id_weed_con,";
        sql += " c.id_disease_con, c.control_type_con";
        sql += " from controls c"; 
        sql += " where c.status=1";
        sql += " and c.id_production_event_con="+idCrop;
//        System.out.println("sql->"+sql);
        int numCaj    = 0;
        int totResult = 0;
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events    = query.list(); 
            totResult = events.size();

            for (Object[] data : events) {
                numCaj++;
                if (totResult==numCaj) {
                    result += "{\"survey_solution[436]\":\""+data[0]+"\","+
                           "\"survey_solution[437]\":\""+data[1]+"\","+ 
                           "\"survey_solution[438]\":\""+data[2]+"\","+ 
                           "\"survey_solution[439]\":\""+data[3]+"\","+ 
                           "\"survey_solution[440]\":\""+data[4]+"\","+ 
                           "\"survey_solution[441]\":\""+data[5]+"\","+ 
                           "\"subform_id\":\""+61+"\","+ 
                           "\"idx\":"+numCaj+"}"; 
                } else {
                    result += "{\"survey_solution[436]\":\""+data[0]+"\","+
                           "\"survey_solution[437]\":\""+data[1]+"\","+ 
                           "\"survey_solution[438]\":\""+data[2]+"\","+ 
                           "\"survey_solution[439]\":\""+data[3]+"\","+ 
                           "\"survey_solution[440]\":\""+data[4]+"\","+ 
                           "\"survey_solution[441]\":\""+data[5]+"\","+ 
                           "\"subform_id\":\""+61+"\","+ 
                           "\"idx\":"+numCaj+"},"; 
                }         
            }
            result += "]";
            tx.commit();
		} catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
		} finally {
            session.close();
		}
        return result;
    }
}
