
package org.aepscolombia.platform.controllers;

import com.opensymphony.xwork2.ActionContext;
import java.util.Locale;
import java.util.Map;
import org.aepscolombia.platform.models.dao.EntitiesDao;
import org.aepscolombia.platform.models.dao.UsersDao;
import org.aepscolombia.platform.models.entity.Entities;
import org.aepscolombia.platform.models.entity.Users;
import org.aepscolombia.platform.util.APConstants;
import org.aepscolombia.platform.util.GlobalFunctions;

/**
 * Clase LocaleAction
 *
 * Contiene los metodos necesarios para realizar el cambio de idiomas del proyecto
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class LocaleAction extends BaseAction 
{    
    
    private String lang="";
    private String lanSel;
    private String dataUser;

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }      

    public String getLanSel() {
        return lanSel;
    }

    public void setLanSel(String lanSel) {
        this.lanSel = lanSel;
    }

    public String getDataUser() {
        return dataUser;
    }

    public void setDataUser(String dataUser) {
        this.dataUser = dataUser;
    }   

    @Override
    public String execute() throws Exception {
//        if (!lang.equals("")) {            
    //        System.out.println("locale->"+ActionContext.getContext().getLocale());
//        Map<String, Object> userSession=this.getSession();
//        String langTemp    = "esco";//(String)userSession.get(APConstants.SESSION_LANG);
//        System.out.println("langTempNew=>"+langTemp);
//        if (langTemp == null || langTemp.equals("")) {
        String countryCode = "";
        try {
            countryCode = (String)this.getRequest().getParameter("countryCode");
        } catch(Exception e) {
            countryCode = "-1";
        } 
        Map<String, Object> userSession=ActionContext.getContext().getSession();
        String langTemp    = (String)userSession.get(APConstants.SESSION_LANG);
//        System.out.println("langAssign=>"+langTemp);
//        System.out.println("countryCode=>"+countryCode);
//        countryCode = "CO";
        if (countryCode!=null && countryCode.equals("CO")) {
            lang = "esco";
        } else if (countryCode!=null && countryCode.equals("NI")) {
            lang = "esni";
        } else if (countryCode!=null && (!countryCode.equals("CO") && !countryCode.equals("NI"))) {
            lang = "esco";
            countryCode = "CO";
        }
//        lang = "en";
        
        Users user = (Users) this.getSession().get(APConstants.SESSION_USER);
        if (user!=null) {        
            Integer idEntSystem = UsersDao.getEntitySystem(user.getIdUsr());
            Entities entTemp = new EntitiesDao().findById(idEntSystem);
            dataUser = "1";
            if (entTemp.getNameEnt()==null || entTemp.getNameEnt().equals("") || entTemp.getNameEnt().isEmpty()) {
                dataUser = "0";
            }
        }
        
        userSession.put(APConstants.COUNTRY_CODE, countryCode);
        Locale locale=null;
        if (langTemp!=null) locale = new Locale(langTemp);
//        ActionContext.getContext().setLocale(locale);
        
        if ((langTemp==null || langTemp.equals("")) || ((lang!=null && !lang.equals("")) && !lang.equals("en"))) {
            String language = GlobalFunctions.getLanguageByCountryCode(countryCode);
//            System.out.println("language=>"+language+"-lang=>"+lang);
            if ((lang==null || lang.equals("")) || language.equals(lang)) {
                lang = language+countryCode.toLowerCase();
            }                 
            locale      = new Locale(lang);            
    //            this.getSession().put(APConstants.SESSION_LANG, lang);
    //            Map<String, Object> userSession=ActionContext.getContext().getSession();
            userSession.put(APConstants.SESSION_LANG, lang);
            this.setSession(userSession);
        } else if ((lang!=null && !lang.equals("")) && !lang.equals("es")){
//            System.out.println("entreeee");
            locale      = new Locale(lang);
            userSession.put(APConstants.SESSION_LANG, lang);
            this.setSession(userSession);
//            lang = langTemp;
        }  
//        lanSel = locale.getLanguage();
        ActionContext.getContext().setLocale(locale);
        
        return SUCCESS;
    }
    
    private String countryVal;

    public String getCountryVal() {
        return countryVal;
    }

    public void setCountryVal(String countryVal) {
        this.countryVal = countryVal;
    }
    
    
    public String getCountry() throws Exception {
        String countryCode = "";
        try {
            countryCode = (String)this.getRequest().getParameter("countryCode");
        } catch(Exception e) {
            countryCode = "-1";
        } 
//        if (countryCode.equals("-1")) countryCode = (String) this.getSession().get(APConstants.COUNTRY_CODE);
        setCountryVal(countryCode);
        return SUCCESS;
    }
         
}
