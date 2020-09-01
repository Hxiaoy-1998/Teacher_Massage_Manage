package com.hxy.core.po;

import java.io.Serializable;

public class User implements Serializable {

		private static final long serialVersionUTD=1L;
		private String userid;
		private String password;
		private String phonenum;
		private String teachername;
		private String peasonID;
		/**
		 * @return the phonenum
		 */
		public String getPhonenum() {
			return phonenum;
		}
		/**
		 * @param phonenum the phonenum to set
		 */
		public void setPhonenum(String phonenum) {
			this.phonenum = phonenum;
		}
		/**
		 * @return the teachername
		 */
		public String getTeachername() {
			return teachername;
		}
		/**
		 * @param teachername the teachername to set
		 */
		public void setTeachername(String teachername) {
			this.teachername = teachername;
		}
		/**
		 * @return the peasonID
		 */
		public String getPeasonID() {
			return peasonID;
		}
		/**
		 * @param peasonID the peasonID to set
		 */
		public void setPeasonID(String peasonID) {
			this.peasonID = peasonID;
		}
		/**
		 * @return the user_id
		 */
		public String getUserid() {
			return userid;
		}
		/**
		 * @param user_id the user_id to set
		 */
		public void setUserid(String userid) {
			this.userid = userid;
		}
		/**
		 * @return the user_password
		 */
		public String getpassword() {
			return password;
		}
		/**
		 * @param user_password the user_password to set
		 */
		public void setpassword(String password) {
			this.password = password;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "User [userid=" + userid + ", password=" + password
					+ ", phonenum=" + phonenum + ", teachername=" + teachername
					+ ", peasonID=" + peasonID + "]";
		}
		
		
		
		
}
