package com.madmax.stool.project.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.madmax.stool.project.model.vo.AllAttachment;
import com.madmax.stool.project.model.vo.ProjectMember;
import com.madmax.stool.project.model.vo.TaskReport;
import com.madmax.stool.project.model.vo.Tag;

@Repository
public class SelectedProjectSelectDaoImpl implements SelectedProjectSelectDao {

	@Override
	public List<Map<String, Object>> selectProjectBoard(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectProjectBoard",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectWritingList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingList",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectTaskList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskList",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectScheduleList(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectScheduleList",pjNo);
	}

	@Override
	public Map<String, Object> selectPinPostCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("selectedProjectSelect.selectPinPostCount");
	}

	@Override
	public List<Map<String, Object>> selectHashTag(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectHashTag");
	}

	@Override
	public List<Map<String, Object>> selectNotification(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectNotification");
	}

	@Override
	public List<Map<String, Object>> selectTaskManager(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskManager");
	}

//	@Override
//	public List<Map<String, Object>> selectProjectMember(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
//		return session.selectList("selectedProjectSelect.selectProjectMember");
//	}

	@Override
	public List<Map<String, Object>> selectWritingAttachment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingAttachment");
	}

	@Override
	public List<Map<String, Object>> selectTaskAttachment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskAttachment");
	}

	@Override
	public List<Map<String, Object>> selectWritingComment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectWritingComment");
	}

	@Override
	public List<Map<String, Object>> selectTaskComment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskComment");
	}

	@Override
	public List<Map<String, Object>> selectScheduleComment(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectScheduleComment");
	}

//	@Override
//	public Map<String, Object> selectProjectMemberNo(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
//		return session.selectOne("selectedProjectSelect.selectProjectMemberNo");
//	}

//	@Override
//	public List<Map<String, Object>> selectAllFileList(SqlSessionTemplate session,int pjNo) {
//		// TODO Auto-generated method stub
//		return session.selectList("selectedProjectSelect.selectAllFileList");
//	}

	@Override
	public List<AllAttachment> selectAllAttach(SqlSessionTemplate session,int pjNo) {
		return session.selectList("selectedProjectSelect.allAttach",pjNo);
	}
	
	@Override
	public Map<String, Object> selectProjectTB(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectOne("selectedProjectSelect.selectProjectTB",pjNo);
	}

	@Override
	public int selectFavorit(SqlSessionTemplate session, Map<String,Object> pjInfo) {
		return session.selectOne("selectedProjectSelect.selectFavorit",pjInfo);
	}

	@Override
	public List<ProjectMember> selectProjectMemberList(SqlSessionTemplate session, int pjNo) {
		return session.selectList("selectedProjectSelect.selectProjectMemberList",pjNo);
	}

	@Override
	public List<Map<String,Object>> selectBookmarkList(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.selectList("selectedProjectSelect.selectBookmarkList",pjInfo);
	}


	@Override
	public List<Map<String, Object>> selectUser(SqlSessionTemplate session) {
		return session.selectList("selectedProjectSelect.selectUser");
	}

	@Override
	public List<TaskReport> selectTaskReport(SqlSessionTemplate session, int pjNo) {
		// TODO Auto-generated method stub
		return session.selectList("selectedProjectSelect.selectTaskReport",pjNo);
		
	}
	
	@Override
	public List<Tag> selectProjectTag(SqlSessionTemplate session, int pjNo) {
		return session.selectList("selectedProjectSelect.selectProjectTag",pjNo);
	}

	@Override
	public List<Map<String, Object>> selectProjectBoardWithTag(SqlSessionTemplate session, Map<String, Object> pjInfo) {
		return session.selectList("selectedProjectSelect.selectProjectBoardWithTag",pjInfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	

	
}
