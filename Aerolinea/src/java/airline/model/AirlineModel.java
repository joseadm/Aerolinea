
package airline.model;

import java.util.*;


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
    public List<Vuelo> getPromo() {
        Vuelo [] promo = {
        new Vuelo(1,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion(),new Date("2017-08-05"),true, (float) 100),
        new Vuelo(2,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion(),new Date("2017-08-05"),true, (float) 100),
        new Vuelo(3,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion(),new Date("2017-08-05"),true, (float) 100),
        new Vuelo(4,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion(),new Date("2017-08-05"),true, (float) 100),
        new Vuelo(5,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion(),new Date("2017-08-05"),true, (float) 100),
        new Vuelo(6,new Ciudad("SJO","San Jose","Costa Rica"),new Ciudad("MIA","Miami","USA"),new Avion(),new Date("2017-08-05"),true, (float) 100)};
        return new ArrayList(Arrays.asList(promo));
    }
}
