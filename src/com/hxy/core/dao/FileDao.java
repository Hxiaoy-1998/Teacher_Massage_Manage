package com.hxy.core.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hxy.core.po.Files;
import com.hxy.core.po.Teacher;



public interface FileDao {
	public  List<Files> findFiles();	
	public void updatafilelist(Files files);	
	public Integer findaFiles(String file_maker);	
	public Files findaFilesbyid(@Param("file_id")String file_id);
	public int deletefile(Integer file_id);
	public Integer psdeletefile(String file_maker);
	public int updatefiles(@Param("file_maker")String  file_maker,
			@Param("file_id")String file_id);
}
