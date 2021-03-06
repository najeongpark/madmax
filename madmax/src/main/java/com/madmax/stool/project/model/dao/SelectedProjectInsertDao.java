package com.madmax.stool.project.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.madmax.stool.project.model.vo.Attachment;
import com.madmax.stool.project.model.vo.InsertHashTag;
import com.madmax.stool.project.model.vo.InsertNotification;
import com.madmax.stool.project.model.vo.InsertProjectBoard;
import com.madmax.stool.project.model.vo.InsertSchedule;
import com.madmax.stool.project.model.vo.InsertTask;
import com.madmax.stool.project.model.vo.InsertTaskManager;
import com.madmax.stool.project.model.vo.InsertWriting;
import com.madmax.stool.project.model.vo.ProjectFile;
import com.madmax.stool.project.model.vo.ProjectMember;

public interface SelectedProjectInsertDao {

	List<ProjectMember> selectProjectMemberList(SqlSessionTemplate session, int pjNo);

	int insertProjectBoardTB(SqlSessionTemplate session, InsertProjectBoard pb);

	int insertWritingTB(SqlSessionTemplate session, InsertWriting writing);

	int insertHashTagTB(SqlSessionTemplate session, InsertHashTag hashTag);

	int insertNotificationTB(SqlSessionTemplate session, InsertNotification notification);

	int insertWritingAttachmentTB(SqlSessionTemplate session, Attachment a);

	int insertProjectFileTB(SqlSessionTemplate session, ProjectFile pf);

	int insertTaskTB(SqlSessionTemplate session, InsertTask task);

	int insertTaskManagerTB(SqlSessionTemplate session, InsertTaskManager itm);

	int insertTaskAttachmentTB(SqlSessionTemplate session, Attachment a);

	int insertScheduleTB(SqlSessionTemplate session, InsertSchedule schedule);

}
