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
	
	public static final int FILE_UPLOAD=1;  //자료실 파일 업로드
	public static final int IMAGE_UPLOAD=2; //상품 등록-이미지 업로드
	
	
	@Resource(name = "fileUpProperties")
	private Properties props;
	
	public List<Map<String, Object>> fileUpload(HttpServletRequest request,
			int uploadPathType, String paramName) {
		//파일 업로드 처리
		MultipartHttpServletRequest multiReq=(MultipartHttpServletRequest)request;
		
		List<MultipartFile> olist=multiReq.getFiles(paramName);
		//Map<String, MultipartFile> fileMap=multiReq.getFileMap();
		
		//결과를 넣을 List
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		
		for(MultipartFile tempFile: olist) {
			if(!tempFile.isEmpty()) {
				//변경전 (원래) 파일명
				String originFileName=tempFile.getOriginalFilename();
				//변경된 파일명
				String fileName=getUniqueFileName(originFileName);
				//파일 크기
				long fileSize=tempFile.getSize();
				
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("originalFileName", originFileName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
				
				//업로드 처리
				//업로드할 경로 구하기
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
		//업로드할 경로 구하기
		String path="";
		
		String type=props.getProperty("file.upload.type");
		logger.info("type={}", type);
		
		if(type.equals("test")) {  //테스트 경로
			if(uploadPathType==FILE_UPLOAD) {
				path=props.getProperty("file.upload.path.test");
			}else if(uploadPathType==IMAGE_UPLOAD) {
				path=props.getProperty("imageFile.upload.path.test");
			}
		}else { //배포시 실제 경로
			String upDir="";
			if(uploadPathType==FILE_UPLOAD) {			
				upDir=props.getProperty("file.upload.path");
			}else if(uploadPathType==IMAGE_UPLOAD) {
				upDir=props.getProperty("imageFile.upload.path");
			}
			
			path
			=request.getSession().getServletContext().getRealPath(upDir);
			
			//config.getServletContext().getRealPath(upDir);
		}
		logger.info("업로드 경로  path={}", path);
		
		return path;
	}

	public String getUniqueFileName(String originFileName) {
		//파일명에 현재시간(년월일시분초밀리초)을 붙여서 파일명 변경
		//abc.txt => abc20191224120350123.txt
		int idx=originFileName.lastIndexOf(".");
		String fName=originFileName.substring(0, idx); //abc
		String ext = originFileName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time=sdf.format(d);
		
		String fileName=fName+time+ext;
		logger.info("변경된 fileName={}", fileName);
		
		return fileName;
	}
	
	
}
