/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.service;
import airline.model.Asiento;
import airline.model.Avion;
import airline.model.Ciudad;
import airline.model.Jsonable;
import airline.model.Reservacion;
import airline.model.Tiquete;
import airline.model.Usuario;
import airline.model.Viaje;
import airline.model.Vuelo;
import airline.model.model;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import com.itextpdf.text.Chunk;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// Document Object
import com.itextpdf.text.Document;
//For adding content into PDF document
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "GeneratePDF", urlPatterns = {"/GeneratePDF"})

public class GeneratePDF extends HttpServlet {

    model model;
        //invoked from doGet method to create PDF through servlet 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Set content type to application / pdf
        //browser will open the document only if this is set
        response.setContentType("application/pdf");
        //Get the output stream for writing PDF object 

        OutputStream out=response.getOutputStream();
        try {
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class, "_class")
                    .registerSubtype(Reservacion.class, "Reservacion")
                    .registerSubtype(Tiquete.class, "Tiquete")
                    .registerSubtype(Viaje.class, "Viaje");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            List<Viaje> viajes;
            
            String jsonReservacion = request.getParameter("reservacion");
            Reservacion reservacion = gson.fromJson(jsonReservacion, Reservacion.class);
            String jsonViajes = request.getParameter("viajes");
            viajes = gson.fromJson(jsonViajes, new TypeToken<ArrayList<Viaje>>(){}.getType());

            
            Document document = new Document();
            /* Basic PDF Creation inside servlet */
            PdfWriter.getInstance(document, out);
            document.open();
            document.add(new Paragraph(" FACTURA DE COMPRA"));
            document.add( Chunk.NEWLINE );
            document.add(new Paragraph("Viajes"));
            document.add( Chunk.NEWLINE );
            document.add(createViajesTable(viajes));
            document.add( Chunk.NEWLINE );
            document.add(new Paragraph("Reservacion"));
            document.add( Chunk.NEWLINE );
            document.add(createReservacionTable(reservacion));
            document.close();
        }
                catch (DocumentException exc){
                throw new IOException(exc.getMessage());
                }
        finally {            
            out.close();
        }
        
    }
    public static PdfPTable createReservacionTable(Reservacion reservacion) {
    	// a table with three columns
        PdfPTable table = new PdfPTable(5);
        // the cell object
        PdfPCell cell;
        // we add the four remaining cells with addCell()
        table.addCell("Codigo");
        table.addCell("Nombre");
        table.addCell("Viaje 1");
        table.addCell("Fecha");
        table.addCell("Precio");
        // add Reservacion
        table.addCell(""+reservacion.getCodigo());
        System.out.print(""+reservacion.getCodigo());
        table.addCell(""+reservacion.getNombreUsuario().getNombre());
        System.out.print(""+reservacion.getNombreUsuario().getNombre());
        table.addCell(""+reservacion.getViaje1().getNumero_viaje());
        System.out.print(""+reservacion.getViaje1().getNumero_viaje());
        table.addCell(""+reservacion.getFecha_reserva());
        System.out.print(""+reservacion.getFecha_reserva());
        table.addCell(""+reservacion.getPrecioTotal());
        System.out.print(""+reservacion.getPrecioTotal());
        return table;
    }
    
    public static PdfPTable createViajesTable(List<Viaje> viajes) {
    	// a table with three columns
        PdfPTable table = new PdfPTable(8);
        // the cell object
        PdfPCell cell;
        // we add the four remaining cells with addCell()
        table.addCell("Numero de Vuelo");
        table.addCell("Avion");
        table.addCell("Salida");
        table.addCell("Destino");
        table.addCell("Fecha");
        table.addCell("Hora Salida");
        table.addCell("Duracion");
        table.addCell("Hora Llegada");
        // add array viajes
        for(int i=0; i<viajes.size(); i++) {
            table.addCell(""+viajes.get(i).getNumero_viaje());
            table.addCell(""+viajes.get(i).getAvion().getPlaca());
            table.addCell(""+viajes.get(i).getVuelo().getCiudad_origen());
            table.addCell(""+viajes.get(i).getVuelo().getCiudad_destino());
            table.addCell(""+viajes.get(i).getFecha());
            table.addCell(""+viajes.get(i).getVuelo().getHora());
            table.addCell(""+viajes.get(i).getVuelo().getDuracion());
            table.addCell(""+viajes.get(i).getVuelo().getHora()+viajes.get(i).getVuelo().getDuracion());
        }
        return table;
        
    }
    
    public static PdfPTable createCostoTable() {
    	// a table with three columns
        PdfPTable table = new PdfPTable(5);
        // the cell object
        PdfPCell cell;
        // we add the four remaining cells with addCell()
        table.addCell("Cantidad de Tiquetes");
        table.addCell("Salida");
        table.addCell("Destino");
        table.addCell("Fecha");
        table.addCell("Total");
        return table;
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "This Servlet Generates PDF Using iText Library";
    }
}
