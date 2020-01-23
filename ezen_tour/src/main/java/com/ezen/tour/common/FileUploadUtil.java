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
	
	public static final int FILE_UPLOAD=1;  //�옄猷뚯떎 �뙆�씪 �뾽濡쒕뱶
	public static final int MANAGER_UPLOAD=2; //�뿉�뵒�꽣�궡 �씠誘몄� �꽔湲�
	public static final int PD_UPLOAD=3;	//�긽�뭹 愿��젴 �씠誘몄� �꽔湲�
	
	
	@Resource(name = "fileUpProperties")
	private Properties props;
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request,
			int uploadPathType, String paramName) {
		//�뙆�씪 �뾽濡쒕뱶 泥섎━
		MultipartHttpServletRequest multiReq=(MultipartHttpServletRequest)request;
		
		List<MultipartFile> olist=multiReq.getFiles(paramName);
		//Map<String, MultipartFile> fileMap=multiReq.getFileMap();
		
		//寃곌낵瑜� �꽔�쓣 List
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		
		for(MultipartFile tempFile: olist) {
			if(!tempFile.isEmpty()) {
				//蹂�寃쎌쟾 (�썝�옒) �뙆�씪紐�
				String originFileName=tempFile.getOriginalFilename();
				//蹂�寃쎈맂 �뙆�씪紐�
				String fileName=getUniqueFileName(originFileName);
				//�뙆�씪 �겕湲�
				long fileSize=tempFile.getSize();
				
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("originalFileName", originFileName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
				
				//�뾽濡쒕뱶 泥섎━
				//�뾽濡쒕뱶�븷 寃쎈줈 援ы븯湲�
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
		//�뾽濡쒕뱶�븷 寃쎈줈 援ы븯湲�
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
			}
		}else { //諛고룷�떆 �떎�젣 寃쎈줈
			String upDir="";
			if(uploadPathType==FILE_UPLOAD) {			
				upDir=props.getProperty("file.upload.path");
			}else if(uploadPathType==MANAGER_UPLOAD) {
				upDir=props.getProperty("imageFile.upload.path");
			}else if(uploadPathType==PD_UPLOAD) {
				path=props.getProperty("pdImageFile.upload.path");
			}
			
			path
			=request.getSession().getServletContext().getRealPath(upDir);
			
			//config.getServletContext().getRealPath(upDir);
		}
		logger.info("�뾽濡쒕뱶 寃쎈줈  path={}", path);
		
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
		
		//String fileName=fName+time+ext;
		String fileName=time+ext;
		logger.info("蹂�寃쎈맂 fileName={}", fileName);
		
		return fileName;
	}
	
	
}
