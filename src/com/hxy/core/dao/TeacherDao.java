package com.hxy.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hxy.core.po.Teacher;

public interface TeacherDao {
	
	public List<Teacher> findteacher();

	public int deleteteacher(String teacher_id);

	public int updateTeacher(Teacher teacher);
	
	public Teacher getTeacherByid(String teacher_id);

	public int addTeacher(Teacher teacher);
	
	public Teacher findateacher(String teacher_name);
		
	
	
}
