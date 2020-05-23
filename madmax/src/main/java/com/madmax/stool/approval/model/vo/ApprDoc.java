package com.madmax.stool.approval.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprDoc {
	private int apprNo;
	private String apprTitle;
	private String apprContent;
	private String apprText;
	private Date writeDate;
	private int apprDocTypeNo;
	private String userId;
	private int finalApprStep;
	private int currApprStep;
	private int apprStatus;
	private String receiver;
	private String userName;
	private String jobCode;
	private String jobName;
	private String deptCode;
	private String deptName;
	private String receiverName;
	private String typeTitle;
	private String apprType;
	private List<ApprLine> apprLine;
	private List<AppredDoc> appredDoc;
	private List<ApprAttachment> apprAttachment;
	
}
