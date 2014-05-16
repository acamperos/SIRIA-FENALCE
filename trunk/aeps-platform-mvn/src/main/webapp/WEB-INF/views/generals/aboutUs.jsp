<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div class="container">
            <div class="panel">
                <div class="panel-body">
                    <div class="row-fluid">
                        <div class="span12">
<!--                            <h3><s:property value="getText('text.mision.aboutus')" /></h3>
                            <hr>
                            <p><s:property value="getText('desc.mision.aboutus')" /></p>
                            
                            <h3><s:property value="getText('text.vision.aboutus')" /></h3>
                            <hr>
                            <p><s:property value="getText('desc.vision.aboutus')" /></p>-->
                            <div class="tabbable tabs-left tabbable-bordered">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tb3_a" data-toggle="tab"><s:property value="getText('text.mision.aboutus')" /></a></li>
                                    <li><a href="#tb3_b" data-toggle="tab"><s:property value="getText('text.vision.aboutus')" /></a></li>
                                    <li><a href="#tb3_c" data-toggle="tab">Proyectos</a></li>
                                    <li><a href="#tb3_d" data-toggle="tab">Nuestro Equipo</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tb3_a">
                                        <p><strong><s:property value="getText('text.mision.aboutus')" /></strong></p>
                                        <hr>
                                        <p><s:property value="getText('desc.mision.aboutus')" /></p>
                                    </div>
                                    <div class="tab-pane" id="tb3_b">
                                        <p><strong><s:property value="getText('text.vision.aboutus')" /></strong></p>
                                        <hr>
                                        <p><s:property value="getText('desc.vision.aboutus')" /></p>
                                    </div>
                                    <div class="tab-pane" id="tb3_c">
                                        <p><strong>Proyectos</strong></p>
                                        <hr>
                                        <!--<p><s:property value="getText('desc.vision.aboutus')" /></p>-->
                                        <p>
                                            Agricultura especifica por sitio compartiendo experiencias (AESCE) aplicada la producci�n de�frutales en Colombia.<br />
                                            <strong>Cofinanciado por:</strong> Fondo Nacional de Fomento Hortofrut�cola / Asohofrucol / CIAT<br />
                                            <strong>Socios:</strong> MADR - Secretarios Nacionales de Cadenas, FundaCIAT, comites departamentales de Asohofrucol. Proyecto ECAs - Asohofrucol.<br />
                                            <strong>Per�odo:</strong> junio 2010 a junio 2013.<br />
                                            <strong>Cultivos analizados:</strong> c�tricos (naranja, lim�n, mandarina), Mango, Aguacate (verdes y Hass) y Pl�tano.<br />
                                            <strong>Logros:</strong><br />
                                            * Identificaci�n de la situaci�n productiva de cuatro frutales en el pa�s.<br />
                                            * Generaci�n de zonas homog�neas de clima y grupos de suelo para cuatro cultivos.<br />
                                            * Identificaci�n de condiciones de clima y suelo determinantes para buenos rendimientos de cuatro cultivos.<br />
                                            * 45 profesionales y t�cnicos formados en Agricultura Espec�fica por sitio.<br />
                                            * Cerca de 4000 lotes caracterizados en el pa�s.<br />
                                            * Mas de 30.000 productores informados sobre Agricultura Espec�fica Por Sitio Compartiendo Experiencias.<br />
                                            * Generaci�n de una p�gina para el intercambio de informaci�n www.frutisitio.org.<br />
                                            * Generaci�n de una plataforma para administraci�n de informaci�n de productores de frutas del pa�s.<br />
                                            * Generaci�n de capacidades dentro del gremio para administrar el sistema.<br /> 
                                            
                                            An�lisis Integral De Sistemas Productivos En Colombia Para La Adaptaci�n Al Cambio Clim�tico - Componente 
                                            2: Contribuir al cierre de brechas productivas aplicando Agricultura Espec�fica por Sitio, para sub-sectores 
                                            priorizados.<br /><br />

                                            <strong>Cofinanciado por:</strong> Ministerio de Agricultura y Desarrollo Rural / CIAT<br />
                                            <strong>Socios:</strong> FENALCE, FEDEARROZ, Corporaci�n Biotec.<br />
                                            <strong>Per�odo:</strong> Diciembre 2012 a Junio 2014.<br />
                                            <strong>Cultivos analizados:</strong> Ma�z, Arroz, Yuca, Aguacate Hass y Pl�tano.<br />
                                            <strong>Logros:</strong><br /> 
                                            * Identificaci�n de la situaci�n productiva de los cultivos de estudio en el pa�s.<br />
                                            * Identificaci�n de factores de clima, suelo y manejo del cultivo determinantes del rendimientos.<br />
                                            * 25 profesionales y t�cnicos formados en Agricultura Espec�fica por sitio.<br />
                                            * Mas de 8000 eventos productivos analizados en el pa�s.<br />
                                            * Generaci�n de una plataforma web y m�vil para administraci�n de informaci�n de productores del pa�s.<br />
                                            * Generaci�n de capacidades dentro de los gremios para administrar el sistema.<br />
                                        </p>                                        
                                    </div>
                                    <div class="tab-pane" id="tb3_d">
                                        <p><strong>Nuestro Equipo</strong></p>
                                        <hr>
                                        <p>
                                            <strong>Daniel Jim�nez�Rodas</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA).</strong>�d.jimenez@cgiar.org<br />
                                            Ingeniero Agr�nomo. Bas� su doctorado en el tema de Agricultura Espec�fica por Sitio contextualizado a los pa�ses tropicales. Cuenta con m�s de 5 a�os de experiencia en este tema, con �nfasis en el an�lisis de la informaci�n de esta metodolog�a,� con la que ha realizado varias publicaciones y participado en congresos internacionales.<br />
                                            Durante su carrera, Daniel, ha trabajado como investigador en instituciones como Bioversity International, el CIAT,� 
                                            la Alta Escuela de Ingeniera y Gesti�n del Cant�n de Vaud en Suiza (HEIG-VD) y ha sido consultor para el Centro 
                                            Franc�s de Cooperaci�n Internacional en Investigaci�n en Agronom�a (CIRAD). En el 2010, su trabajo de investigaci�n 
                                            fue uno de los 40 seleccionados, entre m�s de 400 en todo el mundo, para participar en el primer seminario de j�venes 
                                            investigadores trabajando en pa�ses en v�a de desarrollo.<br />
                                            Daniel Jim�nez es el Coordinador de este Proyecto celebrado entre CIAT y Asohofrucol.<br />
                                            <strong>Algunas de sus publicaciones:</strong><br />
                                            A Survey of Artificial Neural Network-Based Modeling in Agroecology. (2008)<br />
                                            Analysis of Andean blackberry (Rubus glaucus) production models obtained by means of artificial neural
                                            networks exploiting information collected by small-scale growers in Colombia and publicly available meteorological data. (2009)<br />
                                            Interpretation of commercial production information: A case study of lulo (Solanum quitoense), an under-researched Andean fruit.� (2011)<br />
                                            Enhancing Decision-Making Processes of Small Farmers in Tropical Crops by Means of Machine Learning Models. (2012)<br /><br />
                                            
                                            <strong>Andrew Jarvis</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA)</strong><br />
                                            Es el l�der del Programa An�lisis de Pol�ticas (DAPA) �del Centro Internacional de Agricultura Tropical (CIAT). �Adem�s, es el l�der tem�tico en el�
                                            Programa Global de Cambio Clim�tico, Agricultura y Seguridad Alimentaria�(CCAFS).� Andy tiene m�s de 10 a�os de experiencia en investigaci�n, trabajando en�
                                            los retos de reducci�n de la� pobreza rural en pa�ses en v�a de desarrollo y en la protecci�n del medio ambiente.<br />
                                            Su investigaci�n se ha enfocado en el uso de an�lisis espacial y modelaci�n en los campos de desarrollo agr�cola, adaptaci�n de medios de vida a cambio 
                                            clim�tico y �mantenimiento de servicios ecosist�micos.� Ha publicado m�s de 50 art�culos en libros y revistas cient�ficas.<br />
                                            Se ha desempe�ado como consultor para instituciones como la Organizaci�n de Agricultura y Alimentos (FAO), en el desarrollo de estrategias para la conservaci�n 
                                            de la agro-biodiversidad frente el cambio clim�tico, y �en otros proyectos con la Uni�n Europea y el Fondo Mundial del Medio-Ambiente (GEF).<br />
                                            En 2003 gan� el premio de mejor art�culo publicado en la revista Crop Science, relacionado con Recursos Gen�ticos. En 2009 fue el ganador del prestigioso 
                                            premio Ebbe Nielsen por su investigaci�n en Bioinform�tica, relacionada con los impactos de cambio clim�tico sobre la agro biodiversidad.<br /><br />
                                            
                                            <strong>Luis Armando Mu�oz Borja</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA).</strong>�l.a.munoz@cgiar.org<br />
                                            Es bi�logo de la Universidad del Valle, con tesis en cultivo de tejidosin vitro.�Especialista en propagaci�n�in vitro�e implementaci�n de Biof�bricas del
                                            Instituto de Biotecnolog�a de las Plantas, Cuba. �Magister en Ciencias Agrarias de la Universidad Nacional de Colombia, con �nfasis en fitomejoramiento. 
                                            Cuenta con 13 a�os de experiencia en formulaci�n y ejecuci�n de proyectos en frutales, realizando actividades puntuales como investigador y/o coordinador de estos, 
                                            con fuentes nacionales (MADR, Colciencias y Asohofrucol) e internacionales (BID, Banco Mundial y Fontagro).<br />
                                            Gracias a su trayectoria, posee un gran n�mero de competencias en� seguimiento y evaluaci�n de proyectos (levantamiento de l�nea base, seguimiento 
                                            a indicadores y metas), construcci�n de sistemas de informaci�n geogr�fica para peque�os productores de frutales, evaluaci�n de adopci�n de tecnolog�a 
                                            para peque�os productores rurales, aplicaci�n de herramientas de evaluaci�n participativa de tecnolog�a, caracterizaci�n agromorfol�gica de materiales 
                                            en campo e invernadero y selecci�n de clones �lite. Adem�s, cuentas con habilidades para el trabajo con comunidades rurales y empresarios del sector agr�cola. 
                                            Ha estado a cargo de las relaciones institucionales en proyectos con socios en Colombia, Ecuador y Costa Rica.<br />
                                            Actualmente es el coordinador operativo del proyecto Agricultura Espec�fica por Sitio Compartiendo Experiencias.<br /><br />
                                            
                                            <strong>James Cock</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA).</strong><br />
                                            James fue el� pionero de la Agricultura Espec�fica por Sitio�-AEPS-en Colombia, cuando siendo director de Ce�ica�a aplic� este sistema en el cultivo 
                                            de�ca�a de az�car. Posteriormente,� particip� en su implementaci�n en camarones en el Centro de Investigaci�n de la Agricultura de Colombia (CENIACUA); 
                                            en caf� en el programa Decisi�n y An�lisis de Pol�ticas -DAPA- del Centro Internacional de Agricultura Tropical - CIAT ; y en frutales, primero en el 
                                            CIAT y luego como asesor de CIAT en� la Corporaci�n Biotec para guan�bana, mora y lulo . Actualmente es el asesor cient�fico del proyecto Agricultura 
                                            Espec�fica por Sitio Compartiendo Experiencias.<br /><br />
                                            
                                            <strong>Sylvain Delerce</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA).</strong>�s.delerce@cgiar.org<br />
                                            "Por haber trabajado en un organismo de extensi�n, veo que adem�s de explorar nuevos �campos cient�ficos, el proyecto AESCE desarrolla una metodolog�a 
                                            con gran potencial, y que realmente les puede servir a los productores"<br />
                                            Ingeniero agr�nomo, de nacionalidad francesa, con maestr�a en Agronom�a y sistemas productivos sostenibles de Agroparistech. �
                                            Trabaj� 3 a�os en el sur de Francia en el SUAMME, organismo de investigaci�n aplicada y extensi�n con enfoque la ganader�a pastoril. Actualmente, 
                                            coordina la parte agron�mica con los an�lisis del proyecto AESCE.<br />
                                            Durante su carrera, Sylvain ha trabajado temas como impacto del cambio clim�tico sobre sistemas pastoriles del sur de Francia (proyecto�Climfourel), 
                                            optimizaci�n de la alimentaci�n del ganado con pastoreo de superficie no cultivadas, pagos por servicios ambientales en el marco de la red Natura 2000.<br />
                                            Adem�s de ser agr�nomo, en su formaci�n como en sus primeros a�os de trabajo, siempre ha manejado los Sistemas de Informaci�n Geogr�fica (SIG), 
                                            y los an�lisis de datos (estad�sticas) lo que le permite contribuir a la articulaci�n de las m�ltiples disciplinas con las que cuenta el proyecto AESCE.<br /><br />
                                            
                                            <strong>Fanny�Howland</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA).</strong>�f.c.howland@cgiar.org<br />
                                            "Integrar los saberes cient�ficos con los de agricultores grandes y peque�os para lograr nuevos conocimientos me parece un enfoque muy interesante y �til. 
                                            Promover el intercambio de conocimientos y la asociaci�n entre productores con mismo cultivo, mismas condiciones productivas por medio del uso de tecnolog�as; 
                                            creando nuevas comunidades de inter�s com�n para mitigar �la asimetr�a de informaci�n en el sector rural y de esta manera mejorar su productividad 
                                            y competitividad es muy innovador"<br />
                                            Antrop�loga, de nacionalidad francesa con Maestr�a en Estudios de Desarrollo con �nfasis en Desarrollo Local de la�Universidad de La Sorbona�en Paris. 
                                            Trabaj� en la Federaci�n de Cooperativas de Utilizaci�n de Materiales Agr�colas en la elaboraci�n de un estudio de factibilidad para la instauraci�n 
                                            de cultivos de c��amo en el marco de un proyecto de rescate de recursos h�dricos. Su experiencia en Colombia comienza en la ONG Corporaci�n YANAPAQUI, 
                                            en el proyecto de agricultura urbana PLAENFA (Plantemos en Familia) en la ciudad de Medell�n.<br />
                                            En Agricultura Espec�fica por Sitio, Fanny trabaja con m�s de 250 peque�os productores involucrados en el proyecto de Escuelas de Campo para Agricultores (ECAs), 
                                            para que validen y apliquen las herramientas desarrolladas desde el proyecto. La metodolog�a de sus talleres es participativa y grupal; con el objetivo 
                                            de lograr una mejor apropiaci�n de dichas herramientas por parte de los agricultores.<br /><br />
                                            
                                            <strong>Hugo Andr�s Dorado</strong><br />
                                            <strong>Centro Internacional de Agricultura Tropical� (CIAT), Decision and Policy Analysis (DAPA).</strong>�h.a.dorado@cgiar.org<br />
                                            "Analizar informaci�n real proporcionada por los mismos agricultores del pa�s para generar recomendaciones a trav�s de sus experiencias, utilizando diversas
                                            metodolog�as, contribuir� a comprender aspectos importantes del sistema de producci�n lo cual beneficiar� directamente a los mismos agricultores"<br />
                                            Estadista de la Universidad del Valle. Se vincul� al proyecto hace a�o y medio con el fin de hacer su tesis con el Proyecto de AESCE:�"Un modelo estad�stico 
                                            para el cultivo de pl�tano y la pr�ctica de agricultura espec�fica por sitio".��Ahora apoya las tareas de procesamiento y an�lisis de informaci�n empleando 
                                            m�todos de an�lisis multivariado y regresi�n.<br />

                                        </p>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


