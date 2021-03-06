package com.madmax.stool.user.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

	private String userId;
	private String password;
	private String userName;
	private Date hireDate;
	private String phone;
	private String profile;
	private String status;
	private String sign;
	private String email;
	private Date birthday;
	private String deptCode;
	private String jobCode;
	private String deptName;
	private String jobName;
}
