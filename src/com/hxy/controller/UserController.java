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
 * 控制器类
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
		model.addAttribute("msg","账号密码错误！");
		
		return "login";
	}
	
	
	
	@RequestMapping(value="/register.action")
	public String register(String userid,String password ,String phonenum,String teachername,String peasonID,Model model)throws Exception{
		System.out.println("进入方法");
		
	if(userid.length()<4||userid.length()>6||password.length()<6||password.length()>12){
			model.addAttribute("msg","请输入6~12位的密码,用户名需为4~6位字符");
			return "register";
		}else if(userService.findaUser(userid)!= null){
			
			model.addAttribute("msg","用户已存在");
			return "register";
			
		}
		else{
			
		userService.insertUser(userid, password,phonenum,teachername,peasonID);	
			System.out.println("完成插入");
		
		return "login";
		
		}	
		
	}
	
	
	@RequestMapping("/testJson.action")
	@ResponseBody
	public User testJson(@RequestBody User user) {
		// 打印接收的JSON格式数据
		System.out.println("进入Json后台方法");
		System.out.println(user);
		// 返回JSON格式的响应
		return user;
	}
	
	

	
	@RequestMapping("/visit.action")
	public String list(Model model){
		//显示老师信息
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
		//前端显示文件信息
		List<Files> files = userService.findFiles();
		
		for(Files t:files){
			System.out.println(t);
		}
		model.addAttribute("files", files);
		
		return "download";
		
	}
	
	
	
	@RequestMapping("/delete.action")
	@ResponseBody
	//通过老师id删除老师
	public String delete(String teacher_id){
		
		System.out.println("进入方法2");
		String file_id=teacher_id;
		if(userService.findaFilesbyid(file_id)!=null){
			System.out.println("完成文件删除");
			Integer dteaf =userService.psdeletefile(file_id);
		}
		
		if(userService.findaFilesbyid(file_id)==null){
		System.out.println("完成文件检测");
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
	//删除文件
	public String deletefile(Integer file_id){
		
		System.out.println("进入方法");
		System.out.println("当前参数 ："+file_id);
		
		int def = userService.deletefile(file_id);
		
		if(def>0){
			return "OK";
			
			
		}else {
			
			return "FALL";
		}
		
		
	}
	
	
	@RequestMapping("/getTeacherByid.action")
	@ResponseBody
	//通过老师id查找老师
	public Teacher getTeacherByid(String teacher_id) {
		Teacher teacher = userService.getTeacherByid(teacher_id);
		System.out.println(teacher);
		
		return teacher;
	}
	
	
	
	@RequestMapping("/change.action")
	@ResponseBody
	//修改老师信息
	public String updateTeacher(Teacher teacher){
	
	
		System.out.println("完成文件检测");
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
	//添加老师信息
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
			System.out.println("执行新增方法后的数据");
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
		System.out.println("进入方法");	
		// 判断所上传文件是否存在
		if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
			System.out.println("成功进入第一次判断");
			//循环输出上传的文件
			for (MultipartFile file : uploadfile) {
				// 获取上传文件的原始名称
				System.out.println("成功进入第一次循环");
				String originalFilename = file.getOriginalFilename();
				// 设置上传文件的保存地址目录
				String dirPath = 
                       request.getServletContext().getRealPath("/upload/x/ ");
				File filePath = new File(dirPath);
				// 如果保存文件的地址不存在，就先创建目录
				if (!filePath.exists()) {
					filePath.mkdirs();
					System.out.println("保存文件的地址不存在先创建文件目录"+dirPath);
				}
				// 使用UUID重新命名上传的文件名称(上传人_uuid_原始文件名称)
				/*String newFilename = name+ "_"+UUID.randomUUID() + "_"+originalFilename;*/
				
				System.out.println("文件名称为 : "+name+ "_"+UUID.randomUUID() + "_"+originalFilename);
				System.out.println("路径名称为 ："+dirPath);
				
				Files files = new Files();
				files.setFile_maker(name);
				files.setFile_name(originalFilename);
				files.setFile_id(id);
				userService.updatafilelist(files);
				try {
					// 使用MultipartFile接口的方法完成文件上传到指定位置
					file.transferTo(new File(dirPath + originalFilename));
					System.out.println("成功上传到"+dirPath + originalFilename);
					System.out.println("此时文件目录为： "+dirPath);
					System.out.println("此时文件名称为： "+originalFilename);					
				} catch (Exception e) {
					e.printStackTrace();
                       return"error";
				}
			}				
			// 跳转到成功页面
			return "fileUpload";
		}else{
			return"error";
		}
		
		

	}
	@RequestMapping("/download.action")
	public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
	                                           String filename) throws Exception{
		System.out.println("进入方法");
	    // 指定要下载的文件所在路径
	    String path = request.getServletContext().getRealPath("/upload/x/");
	    System.out.println("完成路径指定 :"+path);
	    // 创建该文件对象
	    
	    File file = new File(path+File.separator+" "+filename);
	    //File file = new File("E:\\tom\\webapps\\Myproject\\upload\\x\\HWID.log");
	    System.out.println("完成文件对象创建 ："+file);
	    // 对文件名编码，防止中文文件乱码
	    filename = this.getFilename(request, filename);
	    System.out.println("完成字符编码，当前字符串为："+filename);
	    // 设置响应头
	    HttpHeaders headers = new HttpHeaders();
	    System.out.println("完成相应头设置 :"+headers);
	    // 通知浏览器以下载的方式打开文件
	    headers.setContentDispositionFormData("attachment", filename);
	    System.out.println("完成下载通知 ");
	    // 定义以流的形式下载返回文件数据
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    System.out.println("完成流的定义");
	    // 使用Sring MVC框架的ResponseEntity对象封装返回下载数据
	   return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	                                           headers,HttpStatus.OK);
	}
	/**
	 * 根据浏览器的不同进行编码设置，返回编码后的文件名
	 */
	public String getFilename(HttpServletRequest request,
	                                            String filename) throws Exception { 
	    // IE不同版本User-Agent中出现的关键词
	    String[] IEBrowserKeyWords = {"MSIE", "Trident", "Edge"};  
	    // 获取请求头代理信息
	    String userAgent = request.getHeader("User-Agent");  
	    for (String keyWord : IEBrowserKeyWords) { 
	         if (userAgent.contains(keyWord)) { 
	              //IE内核浏览器，统一为UTF-8编码显示
	              return URLEncoder.encode(filename, "UTF-8");
	         }
	    }  
	    //火狐等其它浏览器统一为ISO-8859-1编码显示
	    return new String(filename.getBytes("UTF-8"), "ISO-8859-1");  
	}  
	


	
}
