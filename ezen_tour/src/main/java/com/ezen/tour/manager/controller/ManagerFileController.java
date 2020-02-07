package com.ezen.tour.manager.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.tour.common.FileUploadUtil;
import com.google.api.client.json.Json;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/managerFile")
public class ManagerFileController {
	private Logger logger=LoggerFactory.getLogger(ManagerFileController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	

	@RequestMapping("/imageUpload.do")
	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response
			, MultipartHttpServletRequest multipart) throws IOException {
		
		logger.info("이미지 업로드 처리");
		JsonObject json=new JsonObject();
		PrintWriter printWriter=null;
		OutputStream out=null;
		MultipartFile file=multipart.getFile("upload");
		if(file!=null) {
			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName=file.getOriginalFilename();
						byte[] bytes=file.getBytes();
						String uploadPath=fileUtil.getFilePath(request, FileUploadUtil.MANAGER_UPLOAD);
						File uploadFile=new File(uploadPath);
						logger.info("파일 이름={}", fileName);
						
						logger.info("업로드 경로 uploadPath={}", uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						
						fileName=fileUtil.getUniqueFileName(fileName);
						logger.info("변경된 파일 이름 fileName={}", fileName);
						
						uploadPath=uploadPath+"/"+fileName;
						out=new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						

						String tempupload="D:/lecture/workspace_list/finalP_ws/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ezen_tour/resources/manager_images";
						tempupload=tempupload+"/"+fileName;
						out=new FileOutputStream(new File(tempupload));
						out.write(bytes);
						
						printWriter = response.getWriter();

						response.setCharacterEncoding("UTF-8");
						response.setContentType("application/json");
						String fileUrl=request.getContextPath()+"/resources/manager_images/"+fileName;
						System.out.println("미리보기용으로 넘겨줄 url - "+fileUrl);
						
						logger.info("이미지 url={}", fileUrl);
						
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						
						printWriter.println(json);
					}catch(IOException e) {
						e.printStackTrace();
					}finally {
						if(out!=null) out.close();
						if(printWriter!=null) printWriter.close();
					}
				}
			}
			if(out!=null) out.close();
			if(printWriter!=null) printWriter.close();
		}
	}
	
	@RequestMapping("/userUpload.do")
	@ResponseBody
	public void userUpload(HttpServletRequest request, HttpServletResponse response
			, MultipartHttpServletRequest multipart) throws IOException {
		
		logger.info("유저 업로드 처리");
		JsonObject json=new JsonObject();
		PrintWriter printWriter=null;
		OutputStream out=null;
		MultipartFile file=multipart.getFile("upload");
		if(file!=null) {
			if(file.getSize()>0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName=file.getOriginalFilename();
						byte[] bytes=file.getBytes();
						String uploadPath=fileUtil.getFilePath(request, FileUploadUtil.USER_UPLOAD);
						File uploadFile=new File(uploadPath);
						logger.info("파일 이름={}", fileName);
						
						logger.info("업로드 경로 uploadPath={}", uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						
						fileName=fileUtil.getUniqueFileName(fileName);
						logger.info("변경된 파일 이름 fileName={}", fileName);
						
						uploadPath=uploadPath+"/"+fileName;
						out=new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						

						String tempupload="D:/lecture/workspace_list/finalP_ws/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ezen_tour/resources/user_images";
						tempupload=tempupload+"/"+fileName;
						out=new FileOutputStream(new File(tempupload));
						out.write(bytes);
						
						printWriter = response.getWriter();

						response.setCharacterEncoding("UTF-8");
						response.setContentType("application/json");
						String fileUrl=request.getContextPath()+"/resources/user_images/"+fileName;
						System.out.println("미리보기용으로 넘겨줄 url - "+fileUrl);
						
						logger.info("이미지 url={}", fileUrl);
						
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						
						printWriter.println(json);
					}catch(IOException e) {
						e.printStackTrace();
					}finally {
						if(out!=null) out.close();
						if(printWriter!=null) printWriter.close();
					}
				}
			}
			if(out!=null) out.close();
			if(printWriter!=null) printWriter.close();
		}
	}
}
