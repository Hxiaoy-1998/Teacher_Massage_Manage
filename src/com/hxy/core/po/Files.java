package com.hxy.core.po;

import java.io.Serializable;

public class Files implements Serializable {
	private static final long serialVersionUID=1L;
	private String file_name;
	private String file_maker;
	private String file_id;
	/**
	 * @return the file_id
	 */
	public String getFile_id() {
		return file_id;
	}
	/**
	 * @param file_id the file_id to set
	 */
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	/**
	 * @return the file_name
	 */
	public String getFile_name() {
		return file_name;
	}
	/**
	 * @param file_name the file_name to set
	 */
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	/**
	 * @return the file_maker
	 */
	public String getFile_maker() {
		return file_maker;
	}
	/**
	 * @param file_maker the file_maker to set
	 */
	public void setFile_maker(String file_maker) {
		this.file_maker = file_maker;
	}
	
	
}
