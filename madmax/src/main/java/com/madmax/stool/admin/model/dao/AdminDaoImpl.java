package com.madmax.stool.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.admin.model.vo.AdminAttendManagement;
import com.madmax.stool.admin.model.vo.AdminUserManage;
import com.madmax.stool.admin.model.vo.DeptReport;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<AdminAttendManagement> selectAttendList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectAttendList");
	}

	@Override
	public int updateModifyRequest(SqlSessionTemplate session, AdminAttendManagement am) {
		// TODO Auto-generated method stub
		return session.update("admin.updateModifyRequest",am);
	}

	@Override
	public int updateEmployeeManagement(SqlSessionTemplate session, AdminAttendManagement am) {
		// TODO Auto-generated method stub
		return session.update("admin.updateEmployeeManagement",am);
	}

	@Override
	public List<AdminUserManage> selectSignupApproval(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectSignupApproval");
	}

	@Override
	public int updateUserState(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.update("admin.updateUserState",userId);
	}

	@Override
	public List<AdminUserManage> selectAllUser(SqlSessionTemplate session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectAllUser",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectUserCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectUserCount");
	}

	@Override
	public int updateJobCode(SqlSessionTemplate session, AdminUserManage aum) {
		// TODO Auto-generated method stub
		return session.update("admin.updateJobCode",aum);
	}

	@Override
	public List<DeptReport> selectUserReport(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectUserReport");
	}

	
	
	
}
