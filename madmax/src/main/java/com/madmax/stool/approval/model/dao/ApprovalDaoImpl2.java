package com.madmax.stool.approval.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.approval.model.vo.Approval;

@Repository
public class ApprovalDaoImpl2 implements ApprovalDao2 {

	@Override
	public List<Approval> selectApprProgList(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectApprProgList",userId);
	}

	@Override
	public List<Approval> selectApprDoneList(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("approval2.selectApprDoneList",userId);
	}
	

}