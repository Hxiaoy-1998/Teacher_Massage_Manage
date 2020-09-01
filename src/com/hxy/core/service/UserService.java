package com.hxy.core.service;

import com.hxy.core.po.Files;
import com.hxy.core.po.Teacherdp;
import com.hxy.core.po.User;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hxy.core.po.Teacher;
public interface UserService {

			

			public User findUser(String userid, String password);	
			public int insertUser(String userid,String password ,String phonenum,String teachername,String peasonID);
			public List<Teacher> findteacher();
			public int deleteteacher(String teacher_id);			
			public int updateTeacher(Teacher teacher);			
			public Teacher getTeacherByid(String teacher_id);			
			public Teacher findateacher(String teacher_name);			
			public int updatefiles(String file_maker,String file_id);			
			public int addTeacher(Teacher teacher);		
			public List<Files> findFiles();			
			public void updatafilelist(Files files);			
			public Integer findaFiles(String file_maker);			
			public Files findaFilesbyid(String file_id);			
			public Integer findaUser(String userid);
			public int deletefile(Integer file_id);			
			public Integer psdeletefile(String file_maker);			
			public List<Teacherdp> findteacherdp();

}
