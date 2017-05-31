/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.security;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import airline.model.Usuario;
/**
 *
 * @author AndreyCh
 */
@WebFilter(filterName = "ReservationFilter", urlPatterns = {"/*"}, dispatcherTypes = {DispatcherType.REQUEST}, initParams = {
    @WebInitParam(name = "TipoUsuario", value = "1")})
public class SecurityFilter implements Filter{

    List<String> clientActions = Arrays.asList("/usuario.jsp","/reserva.jsp");
    List<String> managerActions = Arrays.asList("/tablero.jsp","/aviones.jsp","/ciudades.jsp","/viajes.jsp","/vuelos.jsp","/AirlineService_viajesListAll"
    ,"/AirlineService_avionesListAll","/AirlineService_vuelosListAll","/AirlineService_usuariosListAll","/AirlineService_avionAdd"
    ,"/AirlineService_ciudadAdd","/AirlineService_viajeAdd","/AirlineService_vueloAdd","/AirlineService_ciudadDelete","/AirlineService_viajeDelete",
    "/AirlineService_vueloDelete","/AirlineService_avionDelete");
    List<String>[] userActions;
    
     public SecurityFilter() {
        userActions = (List<String>[]) new List[3];
        userActions[1]=clientActions; 
        userActions[2]=managerActions;
    }    

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
         HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession ses = req.getSession();
        String LOGIN= "/Aerolinea/login.jsp";
        String SEGURIDAD = "/Aerolinea/errorSeguridad.jsp";
        String uri= req.getRequestURI().substring(req.getContextPath().length());
        if (uri.equals("/Aerolinea")){
            String action = request.getParameter("action");
            if (action==null){
                resp.sendRedirect(SEGURIDAD);
            }
            uri = uri+"_"+action;
        }
        if (!(userActions[1].contains(uri) || userActions[2].contains(uri) )){ // open access
            chain.doFilter(request,response);
        }
        else {  // restricted access
             Usuario user = (Usuario)ses.getAttribute("usuario");
             if(user==null){
                 resp.sendRedirect(LOGIN);
             }
             else{
                 if (userActions[user.getTipo()].contains(uri)){
                     chain.doFilter(request,response);
                 }
                 else{
                     resp.sendRedirect(SEGURIDAD);
                 }
            }
        }
    }

    @Override
    public void destroy() {
        
    }
     @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
}
