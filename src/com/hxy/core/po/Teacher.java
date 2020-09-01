package com.hxy.core.po;

import java.io.Serializable;
import java.util.List;

public class Teacher implements Serializable{
	private static final long serialVersionUID=1L;
	private String teacher_name;
	private String teacher_id;
	private String teacher_phone;
	private String IDcard;
	private String teacher_dp;
	

	/**
	 * @return the teacher_dp
	 */
	public String getTeacher_dp() {
		return teacher_dp;
	}
	/**
	 * @param teacher_dp the teacher_dp to set
	 */
	public void setTeacher_dp(String teacher_dp) {
		this.teacher_dp = teacher_dp;
	}
	/**
	 * @return the teacher_name
	 */
	public String getteacher_name() {
		return teacher_name;
	}
	/**
	 * @param teacher_name the teacher_name to set
	 */
	public void setteacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	/**
	 * @return the teacher_id
	 */
	public String getteacher_id() {
		return teacher_id;
	}
	/**
	 * @param teacher_id the teacher_id to set
	 */
	public void setteacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	/**
	 * @return the teacher_phone
	 */
	public String getteacher_phone() {
		return teacher_phone;
	}
	/**
	 * @param teacher_phone the teacher_phone to set
	 */
	public void setteacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}
	/**
	 * @return the iDcard
	 */
	public String getIDcard() {
		return IDcard;
	}
	/**
	 * @param iDcard the iDcard to set
	 */
	public void setIDcard(String iDcard) {
		IDcard = iDcard;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Teacher [teacher_name=" + teacher_name + ", teacher_id="
				+ teacher_id + ", teacher_phone=" + teacher_phone + ", IDcard="
				+ IDcard + ", teacher_dp=" + teacher_dp + "]";
	}
	

	
	

}
