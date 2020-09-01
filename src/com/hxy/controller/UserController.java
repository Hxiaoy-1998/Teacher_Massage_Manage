package com.hxy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.hxy.core.po.Teacher;
import com.hxy.core.po.Teacherdp;
import com.hxy.core.po.User;
import com.hxy.core.service.UserService;
import com.hxy.core.po.Files;;
/**
 * ��������
 */

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value="/login.action")
	public String login(String  userid,String password, Model model,HttpSession session ){
		User user = userService.findUser(userid, password);
		if(user!=null){
			session.setAttribute("USER_SESSION", user);
			return "teacher";
		} 
		model.addAttribute("msg","�˺��������");
		
		return "login";
	}
	
	
	
	@RequestMapping(value="/register.action")
	public String register(String userid,String password ,String phonenum,String teachername,String peasonID,Model model)throws Exception{
		System.out.println("���뷽��");
		
	if(userid.length()<4||userid.length()>6||password.length()<6||password.length()>12){
			model.addAttribute("msg","������6~12λ������,�û�����Ϊ4~6λ�ַ�");
			return "register";
		}else if(userService.findaUser(userid)!= null){
			
			model.addAttribute("msg","�û��Ѵ���");
			return "register";
			
		}
		else{
			
		userService.insertUser(userid, password,phonenum,teachername,peasonID);	
			System.out.println("��ɲ���");
		
		return "login";
		
		}	
		
	}
	
	
	@RequestMapping("/testJson.action")
	@ResponseBody
	public User testJson(@RequestBody User user) {
		// ��ӡ���յ�JSON��ʽ����
		System.out.println("����Json��̨����");
		System.out.println(user);
		// ����JSON��ʽ����Ӧ
		return user;
	}
	
	

	
	@RequestMapping("/visit.action")
	public String list(Model model){
		//��ʾ��ʦ��Ϣ
		List<Teacher> teachers = userService.findteacher();
		List<Teacherdp> teachersdp = userService.findteacherdp();
		for(Teacher t:teachers){
			System.out.println(t);
		}
		model.addAttribute("teachers", teachers);
		model.addAttribute("teachersdp", teachersdp);
		
		return "visit";
		
	}
	
	@RequestMapping("/file.action")
	public String list2(Model model){
		
		List<Teacher> teachers = userService.findteacher();
		
		for(Teacher t:teachers){
			System.out.println(t);
		}
		model.addAttribute("teachers", teachers);
		
		return "fileUpload";
		
	}
	
	
	@RequestMapping("/findFile.action")
	public String lists(Model model){
		//ǰ����ʾ�ļ���Ϣ
		List<Files> files = userService.findFiles();
		
		for(Files t:files){
			System.out.println(t);
		}
		model.addAttribute("files", files);
		
		return "download";
		
	}
	
	
	
	@RequestMapping("/delete.action")
	@ResponseBody
	//ͨ����ʦidɾ����ʦ
	public String delete(String teacher_id){
		
		System.out.println("���뷽��2");
		String file_id=teacher_id;
		if(userService.findaFilesbyid(file_id)!=null){
			System.out.println("����ļ�ɾ��");
			Integer dteaf =userService.psdeletefile(file_id);
		}
		
		if(userService.findaFilesbyid(file_id)==null){
		System.out.println("����ļ����");
		int tea = userService.deleteteacher(teacher_id);
		
		if(tea>0){
			return "OK";
			
			
		}else {
			
			return "FALL";
		}
		
		}
		return "OK";
		
		
	}
	
	@RequestMapping("/deletefile.action")
	@ResponseBody
	//ɾ���ļ�
	public String deletefile(Integer file_id){
		
		System.out.println("���뷽��");
		System.out.println("��ǰ���� ��"+file_id);
		
		int def = userService.deletefile(file_id);
		
		if(def>0){
			return "OK";
			
			
		}else {
			
			return "FALL";
		}
		
		
	}
	
	
	@RequestMapping("/getTeacherByid.action")
	@ResponseBody
	//ͨ����ʦid������ʦ
	public Teacher getTeacherByid(String teacher_id) {
		Teacher teacher = userService.getTeacherByid(teacher_id);
		System.out.println(teacher);
		
		return teacher;
	}
	
	
	
	@RequestMapping("/change.action")
	@ResponseBody
	//�޸���ʦ��Ϣ
	public String updateTeacher(Teacher teacher){
	
	
		System.out.println("����ļ����");
		String file_id=teacher.getteacher_id();
		String file_maker=teacher.getteacher_name();
		System.out.println("flie_maker="+file_maker);
		System.out.println("flie_id="+file_id);
		
		
		if(userService.findateacher(file_maker)!=null){
			return "FALL1";
		}
		
		if(userService.getTeacherByid(file_id)!=null){
			return "FALL1";
			
		}
		
		if(userService.findaFilesbyid(file_id)!=null){
			
			return "FALL2";
		
		}
		
		
		
		int uptea = userService.updateTeacher(teacher);
		
		
		if(uptea>0){
			return "OK";
		}else{
			
			return "FALL";
		}
	
		
	}
	
	@RequestMapping("/addTeacher.action")
	@ResponseBody
	//�����ʦ��Ϣ
	public String addTeacher(Teacher teacher){
		String teacher_name=teacher.getteacher_name();
		String teacher_id=teacher.getteacher_id();
		if(userService.findateacher(teacher_name)!=null){
			return "FALL1";
		}
		
		else if(userService.getTeacherByid(teacher_id)!=null){
			return "FALL1";
			
		}
		
		
		else{	
			int addtea = userService.addTeacher(teacher);
			System.out.println("ִ�����������������");
			System.out.println(teacher);
			if(addtea>0){
			return "OK";
			}else{
			
			return "FALL";
			}
		
		
		}
	}
	
	
	@RequestMapping("/fileUpload.action")
	public String handleFormUpload(@RequestParam("name") String name,@RequestParam("id") String id,@RequestParam("uploadfile") List<MultipartFile> uploadfile,HttpServletRequest request) {
		System.out.println("���뷽��");	
		// �ж����ϴ��ļ��Ƿ����
		if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
			System.out.println("�ɹ������һ���ж�");
			//ѭ������ϴ����ļ�
			for (MultipartFile file : uploadfile) {
				// ��ȡ�ϴ��ļ���ԭʼ����
				System.out.println("�ɹ������һ��ѭ��");
				String originalFilename = file.getOriginalFilename();
				// �����ϴ��ļ��ı����ַĿ¼
				String dirPath = 
                       request.getServletContext().getRealPath("/upload/x/ ");
				File filePath = new File(dirPath);
				// ��������ļ��ĵ�ַ�����ڣ����ȴ���Ŀ¼
				if (!filePath.exists()) {
					filePath.mkdirs();
					System.out.println("�����ļ��ĵ�ַ�������ȴ����ļ�Ŀ¼"+dirPath);
				}
				// ʹ��UUID���������ϴ����ļ�����(�ϴ���_uuid_ԭʼ�ļ�����)
				/*String newFilename = name+ "_"+UUID.randomUUID() + "_"+originalFilename;*/
				
				System.out.println("�ļ�����Ϊ : "+name+ "_"+UUID.randomUUID() + "_"+originalFilename);
				System.out.println("·������Ϊ ��"+dirPath);
				
				Files files = new Files();
				files.setFile_maker(name);
				files.setFile_name(originalFilename);
				files.setFile_id(id);
				userService.updatafilelist(files);
				try {
					// ʹ��MultipartFile�ӿڵķ�������ļ��ϴ���ָ��λ��
					file.transferTo(new File(dirPath + originalFilename));
					System.out.println("�ɹ��ϴ���"+dirPath + originalFilename);
					System.out.println("��ʱ�ļ�Ŀ¼Ϊ�� "+dirPath);
					System.out.println("��ʱ�ļ�����Ϊ�� "+originalFilename);					
				} catch (Exception e) {
					e.printStackTrace();
                       return"error";
				}
			}				
			// ��ת���ɹ�ҳ��
			return "fileUpload";
		}else{
			return"error";
		}
		
		

	}
	@RequestMapping("/download.action")
	public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
	                                           String filename) throws Exception{
		System.out.println("���뷽��");
	    // ָ��Ҫ���ص��ļ�����·��
	    String path = request.getServletContext().getRealPath("/upload/x/");
	    System.out.println("���·��ָ�� :"+path);
	    // �������ļ�����
	    
	    File file = new File(path+File.separator+" "+filename);
	    //File file = new File("E:\\tom\\webapps\\Myproject\\upload\\x\\HWID.log");
	    System.out.println("����ļ����󴴽� ��"+file);
	    // ���ļ������룬��ֹ�����ļ�����
	    filename = this.getFilename(request, filename);
	    System.out.println("����ַ����룬��ǰ�ַ���Ϊ��"+filename);
	    // ������Ӧͷ
	    HttpHeaders headers = new HttpHeaders();
	    System.out.println("�����Ӧͷ���� :"+headers);
	    // ֪ͨ����������صķ�ʽ���ļ�
	    headers.setContentDispositionFormData("attachment", filename);
	    System.out.println("�������֪ͨ ");
	    // ������������ʽ���ط����ļ�����
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    System.out.println("������Ķ���");
	    // ʹ��Sring MVC��ܵ�ResponseEntity�����װ������������
	   return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	                                           headers,HttpStatus.OK);
	}
	/**
	 * ����������Ĳ�ͬ���б������ã����ر������ļ���
	 */
	public String getFilename(HttpServletRequest request,
	                                            String filename) throws Exception { 
	    // IE��ͬ�汾User-Agent�г��ֵĹؼ���
	    String[] IEBrowserKeyWords = {"MSIE", "Trident", "Edge"};  
	    // ��ȡ����ͷ������Ϣ
	    String userAgent = request.getHeader("User-Agent");  
	    for (String keyWord : IEBrowserKeyWords) { 
	         if (userAgent.contains(keyWord)) { 
	              //IE�ں��������ͳһΪUTF-8������ʾ
	              return URLEncoder.encode(filename, "UTF-8");
	         }
	    }  
	    //��������������ͳһΪISO-8859-1������ʾ
	    return new String(filename.getBytes("UTF-8"), "ISO-8859-1");  
	}  
	


	
}
