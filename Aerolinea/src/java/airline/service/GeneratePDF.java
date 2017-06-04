/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.service;
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
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "GeneratePDF", urlPatterns = {"/GeneratePDF"})

public class GeneratePDF extends HttpServlet {

        //invoked from doGet method to create PDF through servlet 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Set content type to application / pdf
        //browser will open the document only if this is set
        response.setContentType("application/pdf");
        //Get the output stream for writing PDF object 

        OutputStream out=response.getOutputStream();
        try {
            Document document = new Document();
            /* Basic PDF Creation inside servlet */
            PdfWriter.getInstance(document, out);
            document.open();
            document.add(new Paragraph(" FACTURA DE COMPRA"));
            document.add( Chunk.NEWLINE );
            document.add(new Paragraph("Pasajeros"));
            document.add( Chunk.NEWLINE );
            document.add(createPasajerosTable());
            document.add( Chunk.NEWLINE );
            document.add(new Paragraph("Vuelos"));
            document.add( Chunk.NEWLINE );
            document.add(createVuelosTable());
            document.add( Chunk.NEWLINE );
            document.add(new Paragraph("Costo"));
            document.add( Chunk.NEWLINE );
            document.add(createCostoTable());
            document.close();
        }
                catch (DocumentException exc){
                throw new IOException(exc.getMessage());
                }
        finally {            
            out.close();
        }
        
    }
    public static PdfPTable createPasajerosTable() {
    	// a table with three columns
        PdfPTable table = new PdfPTable(3);
        // the cell object
        PdfPCell cell;
        // we add the four remaining cells with addCell()
        table.addCell("Nombre");
        table.addCell("Apellidos");
        table.addCell("Numero Pasajero");
        return table;
    }
    
    public static PdfPTable createVuelosTable() {
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
