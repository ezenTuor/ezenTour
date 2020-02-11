package com.ezen.tour.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.PatternSyntaxException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	private static final Logger logger
		=LoggerFactory.getLogger(FileUploadUtil.class);
	
	public static final int FILE_UPLOAD=1;
	public static final int MANAGER_UPLOAD=2;
	public static final int PD_UPLOAD=3;
	public static final int USER_UPLOAD=4;
	
	
	@Resource(name = "fileUpProperties")
	private Properties props;
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request,
			int uploadPathType, String paramName) {
		
		MultipartHttpServletRequest multiReq=(MultipartHttpServletRequest)request;
		
		List<MultipartFile> olist=multiReq.getFiles(paramName);
		//Map<String, MultipartFile> fileMap=multiReq.getFileMap();
		
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		
		for(MultipartFile tempFile: olist) {
			if(!tempFile.isEmpty()) {
				
				String originFileName=tempFile.getOriginalFilename();
				
				String fileName=getUniqueFileName(originFileName);
				
				long fileSize=tempFile.getSize();
				
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("originalFileName", originFileName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
				
				
				String upPath=getFilePath(request, uploadPathType);
				
				File file=new File(upPath, fileName);
				
				try {
					tempFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}			
				
			}
		}
		
		return list;
	}

	public String getFilePath(HttpServletRequest request, int uploadPathType) {
		String path="";
		
		String type=props.getProperty("file.upload.type");
		logger.info("type={}", type);
		
		if(type.equals("test")) { 
			if(uploadPathType==FILE_UPLOAD) {
				path=props.getProperty("file.upload.path.test");
			}else if(uploadPathType==MANAGER_UPLOAD) {
				path=props.getProperty("imageFile.upload.path.test");
			}else if(uploadPathType==PD_UPLOAD) {
				path=props.getProperty("pdImageFile.upload.path.test");
			}else if(uploadPathType==USER_UPLOAD) {
				path=props.getProperty("userFile.upload.path.test");
			}
		}else {
			String upDir="";
			if(uploadPathType==FILE_UPLOAD) {			
				upDir=props.getProperty("file.upload.path");
			}else if(uploadPathType==MANAGER_UPLOAD) {
				upDir=props.getProperty("imageFile.upload.path");
			}else if(uploadPathType==PD_UPLOAD) {
				path=props.getProperty("pdImageFile.upload.path");
			}else if(uploadPathType==USER_UPLOAD) {
				path=props.getProperty("userFile.upload.path");
			}
			
			path
			=request.getSession().getServletContext().getRealPath(upDir);
			
			//config.getServletContext().getRealPath(upDir);
		}
		logger.info("파일 업로드 경로  path={}", path);
		
		return path;
	}

	public String getUniqueFileName(String originFileName) {
		//abc.txt => 20191224120350123.txt
		int idx=originFileName.lastIndexOf(".");
		String fName=originFileName.substring(0, idx); //abc
		String ext = originFileName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time=sdf.format(d);
		
		String fileName="";
		try {
			if(fName.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {
				// 한글이 포함된 문자열
				fileName="temp"+time+ext;
			} else {
				// 한글이 포함되지 않은 문자열
				fileName=fName+time+ext;
			}
		} catch (PatternSyntaxException e) {
			// 정규식에 오류가 있는 경우에 대한 처리
			System.err.println("An Exception Occured");
			e.printStackTrace();
		}
		logger.info("수정된 파일 이름 fileName={}", fileName);
		
		return fileName;
	}
	
	
}
