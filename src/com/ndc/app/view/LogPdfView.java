package com.ndc.app.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import com.ndc.app.model.Log;

public class LogPdfView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document,
			PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// TODO Auto-generated method stub
		List<Log> logs = (List<Log>) model.get("generatedLogs");
		
		if(logs != null) {
			
			if(logs.size() > 0) {
				
				Table table = new Table(4);
				
				document.add(new Paragraph("NDC System Logs"));
				document.add(Chunk.NEWLINE);
				
				table.addCell("ID");
				table.addCell("Triggered By");
				table.addCell("Access Time");
				table.addCell("Description");
				
				for(Log log : logs) {
					table.addCell(""+log.getId());
					table.addCell(log.getLoggedBy());
					table.addCell(log.getAccessTime().toString());
					table.addCell(log.getDescription());
				}
				
				document.add(table);
				
			}
			
		}
		
	}
	
}
