package com.ezen.tour.manager.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.tour.common.FileUploadUtil;
import com.ezen.tour.manager.pack.model.ManagerPackService;
import com.ezen.tour.manager.pack.model.ManagerPackVo;

@Controller
@RequestMapping("/manager")
public class ManagerController{
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@Autowired
	private ManagerPackService managerPackService;
	
	@RequestMapping("/managerMain.do")
	public String adminMain() {
		logger.info("관리자 메인 화면 보여주기");
		return "manager/managerMain";
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.GET)
	public void packWrite_get() {
		logger.info("패키지 상품 작성 화면 보여주기");
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.POST)
	public String packWrite_post(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request) {
		logger.info("패키지 상품 작성 처리, 파라미터 packVo={}", packVo);
		
		//파일 업로드 처리
		String paramName="packImages";
		
		List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.PD_UPLOAD, paramName);
		
		//아직 테스트중
		String fileNames="", fileSizes="";
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> filemap=list.get(i);
			String ofilename=(String)filemap.get("originalFileName");
			String filename=(String)filemap.get("fileName");
			long filesize=(Long)filemap.get("fileSize");
			
			System.out.println("ofn="+ofilename+", fn="+filename+", size="+filesize);
			
			//첫번째 파일이 아닐때 구분자 넣기
			if(fileNames!=null && !fileNames.isEmpty()) {
				fileNames+="|";
				fileSizes+="|";
			}
			fileNames+=filename;
			fileSizes+=filesize;
		}
		logger.info("파일 묶음 처리, fileNames={}, fileSizes={}", fileNames, fileSizes);
		packVo.setImgNames(fileNames);
		packVo.setImgSizes(fileSizes);
		
		logger.info("처리후 packVo={}", packVo);
		
		int cnt=managerPackService.insertPack(packVo);
		logger.info("pack 입력 처리 cnt={}", cnt);
		
		return "redirect:/manager/pack/detailWrite.do";
	}

	/*
	@RequestMapping("/fileTest.do")
	public void fileTest(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
	//MultipartFile 타입은 ckedit에서 upload란 이름으로 저장하게 된다
			throws Exception {

		// 한글깨짐을 방지하기위해 문자셋 설정
		response.setCharacterEncoding("utf-8");

		// 마찬가지로 파라미터로 전달되는 response 객체의 한글 설정
		response.setContentType("text/html; charset=utf-8");

		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String str=fileUtil.getFilePath(request, FileUploadUtil.IMAGE_UPLOAD);
		String uploadPath = str;
		
		System.out.println(str);
		System.out.println(fileName);

		//프로젝트는 개발 디렉토리에 저장이 되는데 이미지를 업로드할 디렉토리를 개발 디렉토리로 설정하면 일일이 새로고침을 해주어야되서
		//불편하기 때문에 이미지를 업로드할 디렉토리를 배포 디렉토리로 설정한다.    

		OutputStream out = new FileOutputStream(new File(uploadPath, fileName));

		// 서버로 업로드
		// write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
		// 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
		out.write(bytes);

		// 클라이언트에 결과 표시
		String callback = request.getParameter("CKEditorFuncNum");

		// 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();
		String fileUrl = request.getContextPath() + "/images/" + fileName;
		System.out.println(fileUrl);
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
				+ "','이미지가 업로드되었습니다.')" + "</script>");
		printWriter.flush();
		out.close();
	}
	*/
	/*
	@RequestMapping("/fileTest.do")
	public void fileTset(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		OutputStream out=null;
		PrintWriter printWriter=null;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			String fileName=upload.getOriginalFilename();
			byte[] bytes=upload.getBytes();
			String uploadPath=fileUtil.getFilePath(request, FileUploadUtil.IMAGE_UPLOAD);
			//uploadPath+="\\"+fileName;
			System.out.println(uploadPath);
			System.out.println(fileName);
			
			out=new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");
			
			printWriter=response.getWriter();
			String fileUrl=uploadPath+fileName;
			
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
            printWriter.flush();
			
			
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out !=null ) out.close();
				if(printWriter !=null) printWriter.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}
	*/
	
	@RequestMapping(value="/pack/detailWrite.do", method=RequestMethod.GET)
	public void detailWrite_get() {
		logger.info("패키지 상세 작성 화면 처리");
	}
}
