package com.hxy.core.dao;

import org.apache.ibatis.annotations.Param;

import com.hxy.core.po.User;

public interface UserDao {
  
	public User findUser(@Param("userid") String userid,@Param("password") String password);
	
	
	public int insertUser(@Param("userid") String userid,@Param("password") String password,@Param("phonenum") String phonenum,@Param("teachername") String  teachername,@Param("peasonID") String peasonID );


	public Integer findaUser(@Param("userid")String userid);
}
