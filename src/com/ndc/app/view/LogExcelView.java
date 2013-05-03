package com.ndc.app.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.ndc.app.model.Log;

public class LogExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		// TODO Auto-generated method stub
		List<Log> logs = (List<Log>) model.get("generatedLogs");
		
		if(logs != null) {
			if(logs.size() > 0) {
				//write to excel
				HSSFSheet sheet = workbook.createSheet();
				
				HSSFRow header = sheet.createRow(0);
				header.createCell(0).setCellValue("NDC System Logs");
				
				sheet.createRow(1);
				
				HSSFRow excelHeader = sheet.createRow(2);
				excelHeader.createCell(0).setCellValue("ID");
				excelHeader.createCell(1).setCellValue("Triggered By");
				excelHeader.createCell(2).setCellValue("Access Time");
				excelHeader.createCell(3).setCellValue("Description");
				
				int rowNum = 3;
				for(Log log : logs) {
					HSSFRow row = sheet.createRow(rowNum++);
					row.createCell(0).setCellValue(log.getId());
					row.createCell(1).setCellValue(log.getLoggedBy());
					row.createCell(2).setCellValue(log.getAccessTime().toString());
					row.createCell(3).setCellValue(log.getDescription());
				}
			}
		}
	
	}
	
}
