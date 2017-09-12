package org.aepscolombia.platform.controllers;

import com.opensymphony.xwork2.ActionContext;
import org.aepscolombia.platform.models.dao.EntitiesDao;
import org.aepscolombia.platform.models.dao.FarmsDao;
import org.aepscolombia.platform.models.dao.FieldsDao;
import org.aepscolombia.platform.models.dao.ProductionEventsDao;
import org.aepscolombia.platform.models.dao.RastasDao;
import org.aepscolombia.platform.util.APConstants;


/**
 * Clase ActionContact
 *
 * Contiene los metodos necesarios para enviar una solicitud por correo
 *
 * @author Juan Felipe Rodriguez
 * @version 1.0
 */
public class ActionContact extends BaseAction {
    
    private String lanSel;      

    public String getLanSel() {
        return lanSel;
    }

    public void setLanSel(String lanSel) {
        this.lanSel = lanSel;
    }
    
    public ActionContact() {
//        super();
    }

    /**
     * Metodo encargado de validar la información de un producto de control que se va
     * a adicionar a un control
     * @param prod Objeto de un producto
     * @return String Resultado de la validacion
     * @throws Exception
     */
    @Override
    public String execute() throws Exception {
        String coCode  = (String) ActionContext.getContext().getSession().get(APConstants.COUNTRY_CODE);
        String lanTemp = (String) ActionContext.getContext().getSession().get(APConstants.SESSION_LANG);
        lanSel = lanTemp.replace(coCode.toLowerCase(), "");
        return SUCCESS;
    }
    
    /**
     * Metodo encargado de cargar los valores de manera general en una base de datos de MongoDB
     * de todo la informacion respectiva de un usuario
     * @return String Estado del proceso
     */
    public String chargeValues() {
        EntitiesDao entDao = new EntitiesDao();
        FarmsDao farDao    = new FarmsDao();
        FieldsDao fieDao   = new FieldsDao();
        ProductionEventsDao cropDao = new ProductionEventsDao();
        RastasDao rasDao   = new RastasDao();
        
        entDao.setInfoMongo();
        farDao.setInfoMongo();
        fieDao.setInfoMongo();
        cropDao.setInfoMongo();
        rasDao.setInfoMongo();
        
        return "states";
    }
}
