package com.hxy.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hxy.core.dao.FileDao;
import com.hxy.core.dao.TeacherDao;
import com.hxy.core.dao.TeacherdpDao;
import com.hxy.core.dao.UserDao;
import com.hxy.core.po.Files;
import com.hxy.core.po.Teacher;
import com.hxy.core.po.Teacherdp;
import com.hxy.core.po.User;
import com.hxy.core.service.UserService;

		
	
		@Service("userService")
		@Transactional
		public class  UserServiceimpl implements UserService {

			@Autowired
			private UserDao userDao;
			@Autowired
			private TeacherDao teacherDao;
			@Autowired
			private TeacherdpDao teacherdpDao;
			@Autowired
			private FileDao fileDao;
			
			@Override
			
			public User findUser(String userid, String password) {
				
				User user = this.userDao.findUser(userid, password);
				return  user;
			}

			@Override
			public int insertUser(String userid,String password ,String phonenum,String teachername,String peasonID) {
				int res = this.userDao.insertUser(userid, password,phonenum,teachername,peasonID);
				return res;
			}

			@Override
			public List<Teacher> findteacher() {
				List<Teacher> list=this.teacherDao.findteacher();
				return list;
			}

			@Override
			public int deleteteacher(String teacher_id) {
				return teacherDao.deleteteacher(teacher_id);
			}
			
			
			@Override
			public Teacher getTeacherByid(String teacher_id) {
				Teacher teacher = teacherDao.getTeacherByid(teacher_id);
				return teacher;
			}
				
			
			@Override
			public int updateTeacher(Teacher teacher) {
				
				return teacherDao.updateTeacher(teacher);
			}

			@Override
			public int addTeacher(Teacher teacher) {
				return teacherDao.addTeacher(teacher);
			}

			@Override
			public List<Files> findFiles() {
				List<Files> list=this.fileDao.findFiles();
				return list;
			}

		
			@Override
			public void updatafilelist(Files files) {
				this.fileDao.updatafilelist(files);
				
			}

			@Override
			public Integer findaFiles(String file_maker) {
				return fileDao.findaFiles(file_maker);
			}

			@Override
			public Integer findaUser(String userid) {
				return userDao.findaUser(userid);
			
			}

			@Override
			public int deletefile(Integer file_id) {
				return fileDao.deletefile(file_id);
			}

			@Override
			public List<Teacherdp> findteacherdp() {
				List<Teacherdp> list=this.teacherdpDao.findteacherdp();
				return list;
			}

			@Override
			public Integer psdeletefile(String file_maker) {
				// TODO Auto-generated method stub
				return fileDao.psdeletefile(file_maker);
			}

			@Override
			public Files findaFilesbyid(String file_id) {
				return fileDao.findaFilesbyid(file_id);
			}

			@Override
			public Teacher findateacher(String teacher_name) {
				// TODO Auto-generated method stub
				return teacherDao.findateacher(teacher_name);
			}

			@Override
			public int updatefiles(String file_maker, String file_id) {
				// TODO Auto-generated method stub
				return fileDao.updatefiles(file_maker, file_id);
			}
			
		
	
		}
