package org.aepscolombia.platform.models.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
//import org.aepscolombia.plataforma.models.dao.IEventoDao;
import org.hibernate.Transaction;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.aepscolombia.platform.models.entity.Fertilizations;
import org.aepscolombia.platform.util.HibernateUtil;

/**
 * Clase FertilizationsDao
 *
 * Contiene los metodos para interactuar con la tabla Fertilizations de la base de datos (BD)
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class FertilizationsDao 
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
        sql += " where l.status=1 and pe.status=1";
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
    
    public List<Fertilizations> findAll() {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Fertilizations> events = null;
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Fertilizations");
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
        List<HashMap> result = new ArrayList<HashMap>();        
        List<HashMap> resultChe = new ArrayList<HashMap>();        
        List<HashMap> resultOrg = new ArrayList<HashMap>();        
        List<HashMap> resultAme = new ArrayList<HashMap>();        
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        
        String sql = "";     
                      
        sql += "select p.id_fer, p.date_fer";
        sql += " from fertilizations p"; 
        sql += " inner join log_entities le on le.id_object_log_ent=p.id_fer and le.table_log_ent='fertilizations' and le.action_type_log_ent='C'";   
        sql += " where p.status=1";
        if (args.containsKey("idEvent")) { 
            sql += " and p.id_production_event_fer="+args.get("idEvent");
        }        
//        if (args.containsKey("idEntUser")) {
//			sql += " and le.id_entity_log_ent="+args.get("idEntUser");
//		}
        sql += " order by p.id_fer ASC";
//        System.out.println("sql=>"+sql);
        
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
//            System.out.println("sql->"+query.list().size());
            events = query.list(); 

            for (Object[] data : events) {
                HashMap temp = new HashMap();
                temp.put("idFer", data[0]);
//                temp.put("idEntUser", args.get("idEntUser"));
                temp.put("coCode", args.get("coCode"));
                resultChe = getChemicals(temp);
                resultOrg = getOrganics(temp);
                resultAme = getAmendments(temp);
                
                result.addAll(resultChe);
                result.addAll(resultOrg);
                result.addAll(resultAme);
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
    
    public String getFertilizationsInfo(Integer idEvent) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        String result  = "";
        
        String sql = "";     
        String sqlAdd = "";     
                      
        sql += "select p.id_fer, p.date_fer";
        sql += " from fertilizations p"; 
        sql += " where p.status=1";
        if (idEvent!=null && idEvent!=-1) {
            sql += " and p.id_production_event_fer="+idEvent;
        }
        sqlAdd += " order by p.id_fer ASC";
        sql += sqlAdd;
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events = query.list(); 
            int cont=1;

            for (Object[] data : events) {   
                String idFert    = String.valueOf(data[0]);
                String valIdent  = String.valueOf(data[1]);
                Integer contFer  = getTotalFertilizations(idFert);
                if (contFer>0) {
                    Date date        = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(valIdent);
                    String dateAsign = new SimpleDateFormat("yyyy-MM-dd").format(date);
                    result += "{\"content\": \"Fert. "+cont+"\", \"start\": \""+dateAsign+"\", \"className\": \"fertilizations\"},";
                    cont++;
                }
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
    
    public List getChemicals(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> result = new ArrayList<HashMap>();
        List<HashMap> resultChe = new ArrayList<HashMap>();
        
        String sql = "";     
        String sqlAdd = "";     
                      
        sql += "select p.id_fer, p.date_fer, p.fertilization_type_fer, ";
        sql += " tp.name_fer_typ, p.amount_product_used_fer, chfer.id_che_fer, ";
        sql += " chfer.application_type_che_fer, chfer.amount_product_used_che_fer, chfer.other_product_che_fer, chfer.unit_che_fer, p.comment_fer, chfer.id_product_che_fer";
        sql += " from fertilizations p"; 
        sql += " inner join chemical_fertilizations chfer on p.id_fer=chfer.id_fertilization_che_fer";    
        sql += " inner join production_events ep on ep.id_pro_eve=p.id_production_event_fer";    
        sql += " left join fertilizations_types tp on tp.id_fer_typ=p.fertilization_type_fer";    
        sql += " where ep.status=1";
        if (args.containsKey("idFer")) { 
            sql += " and p.id_fer="+args.get("idFer");
        }
		sqlAdd += " order by chfer.id_che_fer ASC";
		sql += sqlAdd;
        
        try {
            tx = session.beginTransaction();
            Query query = session.createSQLQuery(sql);
            //            System.out.println("sql->"+query.list().size());
            events = query.list();

            for (Object[] data : events) {
                    HashMap temp = new HashMap();
                    temp.put("idFer", data[0]);
                    temp.put("dateFer", data[1]);
                    temp.put("idFerTyp", data[2]);             
                    temp.put("idFerChe", data[5]);      
                    String appTyp = String.valueOf(data[6]);
                    String idFerChe = String.valueOf(data[5]);                    
                    if (!idFerChe.equals("") || idFerChe!=null) {
                        if (appTyp.equals("2")) {
                            HashMap tempFoliar = new HashMap();
                            tempFoliar.put("idFerChe", "");
                            tempFoliar.put("nameFerTyp", "");
                            tempFoliar.put("ferTyp", "Quimica");
                            tempFoliar.put("idFerApp", data[11]);
                            tempFoliar.put("appTyp", data[6]);
//                            tempFoliar.put("idFerTyp", null);             
                            tempFoliar.put("otherProduct", data[8]); 
                            String doseInfo = String.valueOf(data[7]);
                            String unit     = String.valueOf(data[9]);
                            Double doseVal  = Double.parseDouble(doseInfo);
                            Double amount   = null;
                            if (args.containsKey("coCode")) {
                                String coCode = String.valueOf(args.get("coCode"));
                                if (coCode.equals("NI") && unit.equals("12")) {
                                    amount = doseVal*0.01522;
                                } else {
                                    amount = doseVal;
                                }
                            }
                            tempFoliar.put("amountUsed", amount); 
                            temp.put("infoFert", tempFoliar);
                        } else {
                            temp.put("infoFert", getChemicalsElements(String.valueOf(temp.get("idFerChe")), 0.0, String.valueOf(args.get("coCode"))));	   
                        }         
                    }
                    temp.put("contFert", getTotalFertilizations(String.valueOf(temp.get("idFer"))));
                                     
                    resultChe.add(temp);
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
        return resultChe;
    }   
    
    public Integer getTotalFertilizations(String idFert) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        int total = 0;
        Transaction tx = null;
        
        String sql = "";             
        HashMap temp = new HashMap();
        try {
            tx = session.beginTransaction();
            sql = "select count(fq.id_che_fer)";
            sql += " from chemical_fertilizations fq"; 
            sql += " where fq.id_fertilization_che_fer="+idFert;
            Query query  = session.createSQLQuery(sql);
            total += Integer.parseInt(String.valueOf(query.uniqueResult()));
            
            sql = "select count(fq.id_org_fer)";
            sql += " from organic_fertilizations fq"; 
            sql += " where fq.id_fertilization_org_fer="+idFert;
            query  = session.createSQLQuery(sql);
            total += Integer.parseInt(String.valueOf(query.uniqueResult()));
            
            sql = "select count(fq.id_ame_fer)";
            sql += " from amendments_fertilizations fq"; 
            sql += " where fq.id_fertilization_ame_fer="+idFert;
            query  = session.createSQLQuery(sql);
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
    
    public HashMap getChemicalsElements(String idFert, Double quantPro, String coCode) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> result = new ArrayList<HashMap>();
        
        
        String sql = "";     
        String sqlAdd = "";     		
        
        sql += "select fq.id_che_fer, fq.name_che_fer, ep.id_product_che_fer, ep.other_product_che_fer,";
        sql += " eq.name_che_ele, p.percentage_che_fer_com, ep.amount_product_used_che_fer, ep.unit_che_fer";
        sql += " from chemical_fertilizer_composition p"; 
        sql += " inner join chemical_fertilizers fq on fq.id_che_fer=p.id_chemical_fertilizer_che_fer_com";
        sql += " inner join chemical_fertilizations ep on ep.id_product_che_fer=fq.id_che_fer";    
        sql += " inner join chemical_elements eq on eq.id_che_ele=p.id_elements_che_fer_com and eq.status_che_ele=1";    
//		sql += " inner join fertilizations fer on ep.id_fertilization_che_fer=fer.id_fer"; 
//        sql += " inner join production_events prod on prod.id_pro_eve=fer.id_production_event_fer";    
//        sql += " left join fertilizations_types tp on tp.id_fer_typ=fer.fertilization_type_fer";    
//        sql += " inner join log_entities le on le.id_object_log_ent=fer.id_fer and le.table_log_ent='fertilizations' and le.action_type_log_ent='C'";        
        sql += " where ep.id_che_fer="+idFert;
//        if (args.containsKey("idEvent")) { 
//            sql += " where fer.id_production_event_fer="+args.get("idEvent");
//        }
//        if (args.containsKey("idEntUser")) {
//			sqlAdd += " and le.id_entity_log_ent="+args.get("idEntUser");
//		}
        sqlAdd += " order by fq.id_che_fer ASC";
        sql += sqlAdd;
//        args.get("countTotal");
//        events.toArray();
        HashMap temp = new HashMap();
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
//            System.out.println("sql->"+query.list().size());
            events = query.list();

            // HashMap temp = new HashMap();
            // temp.put("composition", "");
            // temp.put("value", "");
            // result.add(temp);

            int i=1;
            int numElem = query.list().size();            
            String composition = "";
            String value = "";
            for (Object[] data : events) {
                temp.put("idFerChe", data[0]);
                temp.put("nameFerTyp", data[1]);
                temp.put("ferTyp", "Quimica");
//                temp.put("idFerTyp", data[2]);             
                temp.put("idFerApp", data[2]);
                temp.put("otherProduct", data[3]); 
                String doseInfo = String.valueOf(data[6]);
                String unit     = String.valueOf(data[7]);                
                Double doseVal  = null;
                if(doseInfo!=null && !doseInfo.equals("null")) doseVal  = Double.parseDouble(doseInfo);
                Double amount   = null;
                if (coCode.equals("NI") && unit.equals("12")) {
                    amount = doseVal*0.01522;
                } else {
                    amount = doseVal;
                }
                
                temp.put("amountUsed", amount); 
                if (data[6]!=null) {
                    Double quantProTemp = Double.parseDouble(String.valueOf(data[6]));

    //                String idCoFer = String.valueOf(data[4]);
                    String nameComTyp = String.valueOf(data[4]);
                    Double perCom  = Double.parseDouble(String.valueOf(data[5]));
                    Double amountCom = ((perCom*quantProTemp)/100);
                    if (i == numElem) {
                        composition += nameComTyp+": "+perCom;
                        value += nameComTyp+": "+amountCom;
    //                    temp.put("composition", nameComTyp+": "+perCom);
    //                    temp.put("value", nameComTyp+": "+amountCom);
                    } else {
                        composition += nameComTyp+": "+perCom+", ";
                        value += nameComTyp+": "+amountCom+", ";
    //                    temp.put("composition", nameComTyp+": "+perCom+", ");
    //                    temp.put("value", nameComTyp+": "+amountCom+", ");
                    }
                }
                result.add(temp);
                i++;
            }
            temp.put("composition", composition);
            temp.put("value", value);
//            System.out.println("values=>"+temp);
//            for (HashMap data : result) {
//                System.out.println(data.get("id_productor")+" "+data.get("id_entidad")+" "+data.get("cedula"));
//                System.out.println("values=>"+data);
//            }
            tx.commit();
		} catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
		} finally {
            session.close();
		}
        return temp;
    }
    
    public List getOrganics(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> resultOrg = new ArrayList<HashMap>();        
        
        String sql = "";     
        String sqlAdd = "";           
        
        sql += "select p.id_fer, p.date_fer, p.fertilization_type_fer, ";
        sql += " tp.name_fer_typ, p.amount_product_used_fer,";
        sql += " ferorg.id_org_fer, eq.name_org_fer, ferorg.id_product_org_fer, ferorg.other_product_org_fer, ferorg.amount_product_used_org_fer";
        sql += " from fertilizations p"; 
        sql += " inner join organic_fertilizations ferorg on p.id_fer=ferorg.id_fertilization_org_fer";  
        sql += " left join organic_fertilizers eq on eq.id_org_fer=ferorg.id_product_org_fer and eq.status_org_fer=1";
        sql += " inner join production_events ep on ep.id_pro_eve=p.id_production_event_fer";    
        sql += " left join fertilizations_types tp on tp.id_fer_typ=p.fertilization_type_fer";    
        sql += " inner join log_entities le on le.id_object_log_ent=p.id_fer and le.table_log_ent='fertilizations' and le.action_type_log_ent='C'";   
		sql += " where ep.status=1";
        if (args.containsKey("idFer")) { 
            sql += " and p.id_fer="+args.get("idFer");
        }
        if (args.containsKey("idEntUser")) {
			sqlAdd += " and le.id_entity_log_ent="+args.get("idEntUser");
		}
        
        sqlAdd += " order by ferorg.id_org_fer ASC";
        sql += sqlAdd;
//        System.out.println("sql->"+sql);
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events = query.list();				
				
            for (Object[] data : events) {
                HashMap temp = new HashMap();
                temp.put("idFer", data[0]);
                temp.put("dateFer", data[1]);
                temp.put("idFerTyp", data[2]); 
                
                temp.put("contFert", getTotalFertilizations(String.valueOf(temp.get("idFer"))));                
                HashMap tempInfo = new HashMap();
                tempInfo.put("idFerOrg", data[5]);
                tempInfo.put("ferTyp", "Organica");
                tempInfo.put("nameFerTyp", data[6]);        
                tempInfo.put("idFerApp", data[7]);             
                tempInfo.put("otherProduct", data[8]);  
                String doseInfo = String.valueOf(data[9]);
                Double doseVal  = null;
                if(doseInfo!=null && !doseInfo.equals("null")) doseVal  = Double.parseDouble(doseInfo);
                Double amount   = null;
                if (args.containsKey("coCode")) {
                    String coCode = String.valueOf(args.get("coCode"));
                    if (coCode.equals("NI")) {
                        amount = doseVal*0.01522;
                    } else {
                        amount = doseVal;
                    }
                }
                tempInfo.put("amountUsed", amount); 
                temp.put("infoFert",tempInfo);
                resultOrg.add(temp);
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
        return resultOrg;
    }
    
    public List getAmendments(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> resultAme = new ArrayList<HashMap>();        
        
        
        String sql = "";     
        String sqlAdd = "";   
        
        sql += "select p.id_fer, p.date_fer, p.fertilization_type_fer, ";
		sql += " tp.name_fer_typ, p.amount_product_used_fer,";
		sql += " ferame.id_ame_fer, eq.name_ame_fer, ferame.id_product_ame_fer, ferame.other_product_ame_fer, ferame.amount_product_used_ame_fer";
        sql += " from fertilizations p"; 
        sql += " inner join amendments_fertilizations ferame on p.id_fer=ferame.id_fertilization_ame_fer";  
        sql += " left join amendments_fertilizers eq on eq.id_ame_fer=ferame.id_product_ame_fer and eq.status_ame_fer=1";
        sql += " inner join production_events ep on ep.id_pro_eve=p.id_production_event_fer";    
        sql += " left join fertilizations_types tp on tp.id_fer_typ=p.fertilization_type_fer";    
        sql += " inner join log_entities le on le.id_object_log_ent=p.id_fer and le.table_log_ent='fertilizations' and le.action_type_log_ent='C'";   
		sql += " where ep.status=1";
        if (args.containsKey("idFer")) { 
            sql += " and p.id_fer="+args.get("idFer");
        }
        if (args.containsKey("idEntUser")) {
			sqlAdd += " and le.id_entity_log_ent="+args.get("idEntUser");
		}        
        
        sqlAdd += " order by ferame.id_ame_fer ASC";
        sql += sqlAdd;
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            events = query.list();				
				
				
            for (Object[] data : events) {
                HashMap temp = new HashMap();
                temp.put("idFer", data[0]);
                temp.put("dateFer", data[1]);
                temp.put("idFerTyp", data[2]);
                
                HashMap tempInfo = new HashMap();
                temp.put("contFert", getTotalFertilizations(String.valueOf(temp.get("idFer"))));                
                tempInfo.put("idFerAme", data[5]);
                tempInfo.put("ferTyp", "Enmienda");
                tempInfo.put("nameFerTyp", data[6]);
                tempInfo.put("idFerApp", data[7]);             
                tempInfo.put("otherProduct", data[8]);  
                String doseInfo = String.valueOf(data[9]);
                Double doseVal  = Double.parseDouble(doseInfo);
                Double amount   = null;
                if (args.containsKey("coCode")) {
                    String coCode = String.valueOf(args.get("coCode"));
                    if (coCode.equals("NI")) {
                        amount = doseVal*0.01522;
                    } else {
                        amount = doseVal;
                    }
                }
                tempInfo.put("amountUsed", amount);
                temp.put("infoFert",tempInfo);                
                resultAme.add(temp);
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
        return resultAme;
    }
    
    public Fertilizations objectById(Integer id) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();

        Fertilizations event = null;
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            String hql  = "FROM Fertilizations E WHERE E.idFer = :id_fer";
            Query query = session.createQuery(hql);
            query.setParameter("id_fer", id);
            event = (Fertilizations)query.uniqueResult();
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

    public void save(Fertilizations event) {
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

    public void delete(Fertilizations event) {
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
    
    public static String getFertilizations(Integer idCrop) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> eventsTotal = null;
        List<Object[]> events = null;
        Transaction tx = null;
        String result = "[";
        
        String sql = "";      
        sql += "select DATE_FORMAT(p.date_fer,'%Y-%m-%d') as dateFer, p.fertilization_type_fer, FORMAT(p.amount_product_used_fer,0)";
        sql += " from fertilizations p"; 
        sql += " where p.status=1";
        sql += " and p.id_production_event_fer="+idCrop;
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
                    result += "{\"survey_solution[216]\":\""+data[0]+"\","+
                           "\"survey_solution[217]\":\""+data[1]+"\","+ 
                           "\"survey_solution[218]\":\""+data[2]+"\","+ 
                           "\"subform_id\":\""+47+"\","+ 
                           "\"idx\":"+numCaj+"}"; 
                } else {
                    result += "{\"survey_solution[216]\":\""+data[0]+"\","+
                           "\"survey_solution[217]\":\""+data[1]+"\","+ 
                           "\"survey_solution[218]\":\""+data[2]+"\","+ 
                           "\"subform_id\":\""+47+"\","+ 
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
    
    public static String getFertilizationsBeans(Integer idCrop) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> eventsTotal = null;
        List<Object[]> events = null;
        Transaction tx = null;
        String result = "[";
        
        String sql = "";      
        sql += "select DATE_FORMAT(p.date_fer,'%Y-%m-%d') as dateFer, p.fertilization_type_fer, FORMAT(p.amount_product_used_fer,0)";
        sql += " from fertilizations p"; 
        sql += " where p.status=1";
        sql += " and p.id_production_event_fer="+idCrop;
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
                    result += "{\"survey_solution[432]\":\""+data[0]+"\","+
                           "\"survey_solution[433]\":\""+data[1]+"\","+ 
                           "\"survey_solution[434]\":\""+data[2]+"\","+ 
                           "\"subform_id\":\""+60+"\","+ 
                           "\"idx\":"+numCaj+"}"; 
                } else {
                    result += "{\"survey_solution[432]\":\""+data[0]+"\","+
                           "\"survey_solution[433]\":\""+data[1]+"\","+ 
                           "\"survey_solution[434]\":\""+data[2]+"\","+ 
                           "\"subform_id\":\""+60+"\","+ 
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
    
    public double[] getDistribution(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;
        List<HashMap> result = new ArrayList<HashMap>();
        
        
        String sql = "";       
        sql +=  " select eq.id_che_ele, eq.name_che_ele, SUM(p.percentage_che_fer_com), SUM(ep.amount_product_used_che_fer), SUM(p.percentage_che_fer_com*ep.amount_product_used_che_fer/100)";
        sql +=  " from chemical_fertilizer_composition p";
        sql +=  " inner join chemical_fertilizers fq on fq.id_che_fer=p.id_chemical_fertilizer_che_fer_com";
        sql +=  " inner join chemical_elements eq on eq.id_che_ele=p.id_elements_che_fer_com and eq.status_che_ele=1";  
        sql +=  " inner join chemical_fertilizations ep on ep.id_product_che_fer=fq.id_che_fer"; 
        sql +=  " inner join fertilizations fer on ep.id_fertilization_che_fer=fer.id_fer";
        sql +=  " where fer.status=1";
        if (args.containsKey("idEvent")) { 
            sql += " and fer.id_production_event_fer="+args.get("idEvent");
        }
        if (args.containsKey("dateIni") && args.containsKey("dateEnd")) { 
            String dateIni = String.valueOf(args.get("dateIni"));
            String dateEnd = String.valueOf(args.get("dateEnd"));
//            if (dateIni.equals(dateEnd)) {
                sql += " and fer.date_fer<='"+args.get("dateEnd")+"'";
//            } else {
//                sql += " and (fer.date_fer>='"+args.get("dateIni")+"' and fer.date_fer<='"+args.get("dateEnd")+"')";
//            }
            
        }
        sql +=  " group by eq.id_che_ele";        
//        System.out.println("sql=>"+sql);
        double[] valuesElements = new double[7];
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            
            events = query.list();
            if (events.size()<=0) {
                valuesElements = null;
            }
            /*String composition = "";
            String value = "";*/
            for (Object[] data : events) {
                int elem    = Integer.parseInt(String.valueOf(data[0]));
                double distrib = Double.parseDouble(String.valueOf(data[4]));
                if (elem==1) valuesElements[0]=distrib;
                else if (elem==2) valuesElements[1]=distrib;
                else if (elem==3) valuesElements[2]=distrib;
                else if (elem==6) valuesElements[3]=distrib;
                else if (elem==5) valuesElements[4]=distrib;
                else if (elem==8) valuesElements[5]=distrib;
                else if (elem==7) valuesElements[6]=distrib;
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
        return valuesElements;
    }
    
    public double[] getNutrients(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;        
        
        String sql = "";       
        sql += " select p.nitrogen_nu_val, p.phosphorus_nu_val, p.potassium_nu_val,";
        sql += " p.sulfur_nu_val, p.magnesium_nu_val, p.zinc_nu_val, p.boron_nu_val";
        sql += " from nutrients_values p";
        sql += " where p.id_nu_val is not null";
        if (args.containsKey("depId")) { 
            sql += " and p.departments_nu_val="+args.get("depId");
        }
        if (args.containsKey("cropType")) { 
            sql += " and p.crop_type_nu_val="+args.get("cropType");
        }    
//        System.out.println("sql=>"+sql);
        Double per = 1.0;
        if (args.containsKey("percentage")) { 
            per = Double.parseDouble(String.valueOf(args.get("percentage")));
        } 
        
        double[] valuesElements = {0.0,0.0,0.0,0.0,0.0,0.0,0.0};
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            
            events = query.list();                        
            for (Object[] data : events) {
                valuesElements[0]=Integer.parseInt(String.valueOf(data[0]))*per;
                valuesElements[1]=Integer.parseInt(String.valueOf(data[1]))*per;
                valuesElements[2]=Integer.parseInt(String.valueOf(data[2]))*per;
                valuesElements[3]=Integer.parseInt(String.valueOf(data[3]))*per;
                valuesElements[4]=Integer.parseInt(String.valueOf(data[4]))*per;
                valuesElements[5]=Integer.parseInt(String.valueOf(data[5]))*per;
                valuesElements[6]=Integer.parseInt(String.valueOf(data[6]))*per;
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
        return valuesElements;
    }
    
    public boolean compareNutrients(double[] distriUser, double[] distriStandard) {
        boolean result=true;
        
        if (distriUser!=null) {
            for (int i=0; i<distriUser.length; i++) {
                if(distriUser[i]<distriStandard[i]) {
                    result=false;
                }
            }
        } else {
            result=false;
        }
        
        return result;
    }
    
    public boolean[] getDivisions(HashMap args) {
        SessionFactory sessions = HibernateUtil.getSessionFactory();
        Session session = sessions.openSession();
        List<Object[]> events = null;
        Transaction tx = null;        
        
        String sql = "";       
        sql += " select p.type_div, p.days_div, p.percentage_div,";
        sql += " p.element_div, p.pos_div, p.departments_div, p.crop_type_div, p.growing_env_div";
        sql += " from division p";
        sql += " where p.id_div is not null";
        if (args.containsKey("depId")) { 
            sql += " and p.departments_div="+args.get("depId");
        }
        if (args.containsKey("cropType")) { 
            sql += " and p.crop_type_div="+args.get("cropType");
        } 
        if (args.containsKey("growId")) { 
            sql += " and p.growing_env_div="+args.get("growId");
        } 
//        System.out.println("sql=>"+sql);
        Date dateSow = new Date();        
        
        boolean[] valuesElements = {true, true, true, true, true, true, true};
        double[] nutrientsA = {0,0,0,0,0,0,0};
        double[] nutrientsB = {0,0,0,0,0,0,0};
        double[] distribution = new double[7];
        int cont  = 0;
        int limit = 0;
        
        try {
            tx = session.beginTransaction();
            Query query  = session.createSQLQuery(sql);
            
            events = query.list();                        
//            for (Object[] data : events) {
            for (int i=0; i<events.size(); i++) {
                Object[] data  = events.get(i);
                Double perF    = 0.0;
                cont = cont+1;
                if (i!=events.size()-1 && limit!=2) {
                    Object[] dataF = events.get(cont);
                    perF  = Double.parseDouble(String.valueOf(dataF[2]));
//                    System.out.println("perF=>"+perF);
                    args.put("percentage", perF);
                    nutrientsB=getNutrients(args);
                }                
                
                int days = Integer.parseInt(String.valueOf(data[1]));
                Double per  = Double.parseDouble(String.valueOf(data[2]));   
                int pos  = Integer.parseInt(String.valueOf(data[4]));
//                System.out.println("per=>"+per);
                /*int type = Integer.parseInt(String.valueOf(data[0]));
                int elem = Integer.parseInt(String.valueOf(data[3]));
                int dep  = Integer.parseInt(String.valueOf(data[5]));
                int crop = Integer.parseInt(String.valueOf(data[6]));
                int grow = Integer.parseInt(String.valueOf(data[7]));*/
                
                args.put("percentage", per);
                nutrientsA=getNutrients(args);                
                
                String dateNew;
                if (args.containsKey("dateSow")) {
                    dateSow = (Date) args.get("dateSow");
                    dateNew = dateSow.toString();
                } else {
                    dateNew = "2015-11-19";
                }
                
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String dateSowAsign = sdf.format(dateSow);
                Calendar c = Calendar.getInstance();
                c.setTime(sdf.parse(dateNew));
                c.add(Calendar.DATE, days);
                dateNew = sdf.format(c.getTime());
                args.put("dateIni", dateSowAsign);
                args.put("dateEnd", dateNew);
                
                distribution=getDistribution(args);
                /*System.out.println("distribution[pos]=>"+distribution[pos]);
                System.out.println("nutrientsA[pos]=>"+nutrientsA[pos]);
                System.out.println("nutrientsB[pos]=>"+nutrientsB[pos]);*/
                if (distribution!=null) {
                    if (limit<2 && per!=0) {
                        if (perF!=0) {
                            if(distribution[pos]<nutrientsA[pos] || distribution[pos]>nutrientsB[pos]){
                                valuesElements[pos]=false;
                            }
                        } else {
                            if(distribution[pos]<nutrientsA[pos]){
                                valuesElements[pos]=false;
                            }
                        }

                    } else if (per!=0){
                        limit = -1;
                        if(distribution[pos]<nutrientsA[pos]){
                            valuesElements[pos]=false;
                        }
                    }
                } else {
                    valuesElements[pos]=false;
                }
                
                limit++;
//                for(boolean b : valuesElements) System.out.println("b=>"+b);
                
            }        
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(FertilizationsDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            session.close();
        }
        return valuesElements;
    }
    
    
}
