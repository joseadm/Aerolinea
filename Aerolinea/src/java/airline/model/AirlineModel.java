
package airline.model;
import airline.model.Asiento;
import airline.model.Avion;
import airline.model.Ciudad;
import airline.model.Jsonable;
import airline.model.Reservacion;
import airline.model.Tiquete;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.*;
import java.util.Date;


/**
 *
 * @author Estudiante
 */
public class AirlineModel {
    public List<Ciudad> getCiudades() {
        Ciudad[] ciudades={
        new Ciudad("SJO","San Jose","Costa Rica"),
        new Ciudad("CAN","Cancun","Mexico"),
        new Ciudad("MIA","Miami","USA"),
        new Ciudad("MAD","Madrid","Espana"),
        new Ciudad("ROM","Roma","Italia"),
        new Ciudad("VIE","Viena","Austria")};
        return new ArrayList(Arrays.asList(ciudades));
    }
    public List<Vuelo> getPromo() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date d = sdf.parse("03/08/2017");
        Vuelo[] promo = {
//        new Vuelo(1,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion("TI-CR","Boeing","737-800","2005",180,30,6),d,true, 100),
//        new Vuelo(2,new Ciudad("MIA","Miami","USA"),new Ciudad("CAN","Cancun","Mexico"),new Avion("NV506","Boeing","737-400","2001",168,28,6),d,true,200),
//        new Vuelo(3,new Ciudad("MAD","Madrid","Espana"),new Ciudad("ROM","Roma","Italia"),new Avion("NVCR0314","Airbus","380-800","2012",450,50,9),d,true,200),
//        new Vuelo(4,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MAD","Madrid","Espana"),new Avion("TI-CR5698","Airbus","330-300","2005",297,33,9),d,true,100),
//        new Vuelo(5,new Ciudad("MIA","Miami","USA"),new Ciudad("SJO","San Jose","Costa Rica"),new Avion("TI-BGV","Boeing","737-600","2001",132,22,6),d,true,40),
//        new Vuelo(6,new Ciudad("VIE","Viena","Austria"),new Ciudad("MAD","Madrid","Espana"),new Avion("NV123","Boeing","747-400","2010",315,35,9),d,true,60)
        };
        return new ArrayList(Arrays.asList(promo));
    }
    public List<Avion> getAviones(){
        Avion [] aviones={
            new Avion("TI-BGV","Boeing","737-300","2002",144,24,6),
            new Avion("NV506","Boeing","737-400","2001",168,28,6),
            new Avion("N527VL","Boeing","737-500","2000",132,22,6),
            new Avion("TI-BGV","Boeing","737-600","2001",132,22,6),
            new Avion("NV108","Boeing","737-700","2004",150,25,6),
            new Avion("TI-CR","Boeing","737-800","2005",180,30,6),
            new Avion("TI-CRLA","Boeing","737-900","2008",186,31,6),
            new Avion("NV123","Boeing","747-400","2010",315,35,9),
            new Avion("TI-BGV57","Boeing","767-300","2006",270,30,9),
            new Avion("NVCR14","Boeing","737-900","2008",297,33,9),         
            new Avion("TI-BGV98","Airbus","318-100","2002",120,20,6),
            new Avion("NV654","Airbus","319-200","2001",144,24,6),
            new Avion("NV1411","Airbus","320-200","2000",174,29,6),
            new Avion("TI-CRSJ6","Airbus","321-200","2001",186,31,6),
            new Avion("NV888","Airbus","330-200","2004",270,30,9),
            new Avion("TI-CR5698","Airbus","330-300","2005",297,33,9),
            new Avion("NVCR0314","Airbus","380-800","2012",450,50,9)
            };
        return new ArrayList(Arrays.asList(aviones));
    }
    public List<Vuelo> getVuelos() throws ParseException{
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date d = sdf.parse("03/08/2017");
        Vuelo [] vuelos = {
//            new Vuelo(1,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion("TI-CR","Boeing","737-800","2005",180,30,6),d,true, 100),
//            new Vuelo(2,new Ciudad("MIA","Miami","USA"),new Ciudad("CAN","Cancun","Mexico"),new Avion("NV506","Boeing","737-400","2001",168,28,6),d,true,200),
//            new Vuelo(3,new Ciudad("MAD","Madrid","Espana"),new Ciudad("ROM","Roma","Italia"),new Avion("NVCR0314","Airbus","380-800","2012",450,50,9),d,true,200),
//            new Vuelo(4,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MAD","Madrid","Espana"),new Avion("TI-CR5698","Airbus","330-300","2005",297,33,9),d,true,100),
//            new Vuelo(5,new Ciudad("MIA","Miami","USA"),new Ciudad("SJO","San Jose","Costa Rica"),new Avion("TI-BGV","Boeing","737-600","2001",132,22,6),d,true,40),
//            new Vuelo(6,new Ciudad("VIE","Viena","Austria"),new Ciudad("MAD","Madrid","Espana"),new Avion("NV123","Boeing","747-400","2010",315,35,9),d,true,60),
//            new Vuelo(7,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion("TI-CR","Boeing","737-800","2005",180,30,6),d,true, 100),
//            new Vuelo(8,new Ciudad("MIA","Miami","USA"),new Ciudad("CAN","Cancun","Mexico"),new Avion("NV506","Boeing","737-400","2001",168,28,6),d,true,200),
//            new Vuelo(9,new Ciudad("MAD","Madrid","Espana"),new Ciudad("ROM","Roma","Italia"),new Avion("NVCR0314","Airbus","380-800","2012",450,50,9),d,true,200),
//            new Vuelo(10,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MAD","Madrid","Espana"),new Avion("TI-CR5698","Airbus","330-300","2005",297,33,9),d,true,100),
//            new Vuelo(11,new Ciudad("MIA","Miami","USA"),new Ciudad("SJO","San Jose","Costa Rica"),new Avion("TI-BGV","Boeing","737-600","2001",132,22,6),d,true,40),
//            new Vuelo(12,new Ciudad("VIE","Viena","Austria"),new Ciudad("MAD","Madrid","Espana"),new Avion("NV123","Boeing","747-400","2010",315,35,9),d,true,60),
//            new Vuelo(13,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion("TI-CR","Boeing","737-800","2005",180,30,6),d,true, 100),
//            new Vuelo(14,new Ciudad("MIA","Miami","USA"),new Ciudad("CAN","Cancun","Mexico"),new Avion("NV506","Boeing","737-400","2001",168,28,6),d,true,200),
//            new Vuelo(15,new Ciudad("MAD","Madrid","Espana"),new Ciudad("ROM","Roma","Italia"),new Avion("NVCR0314","Airbus","380-800","2012",450,50,9),d,true,200),
//            new Vuelo(16,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MAD","Madrid","Espana"),new Avion("TI-CR5698","Airbus","330-300","2005",297,33,9),d,true,100),
//            new Vuelo(17,new Ciudad("MIA","Miami","USA"),new Ciudad("SJO","San Jose","Costa Rica"),new Avion("TI-BGV","Boeing","737-600","2001",132,22,6),d,true,40),
//            new Vuelo(18,new Ciudad("VIE","Viena","Austria"),new Ciudad("MAD","Madrid","Espana"),new Avion("NV123","Boeing","747-400","2010",315,35,9),d,true,60)
        };
        return new ArrayList(Arrays.asList(vuelos));
    }
    public List<Vuelo> getVuelos(String origen, String destino) throws ParseException{
        ArrayList<Vuelo> result = new ArrayList();
        for(Vuelo v : getVuelos()){
            if(v.ciudad_origen.nombre.contains(origen) && v.ciudad_destino.nombre.contains(destino)){
                result.add(v);
            }
        }
        return result;
    }
}
