package com.madmax.stool.approval.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.madmax.stool.approval.model.dao.ApprovalDao;
import com.madmax.stool.approval.model.vo.ApprAttachment;
import com.madmax.stool.approval.model.vo.ApprDoc;
import com.madmax.stool.approval.model.vo.ApprDocType;
import com.madmax.stool.approval.model.vo.ApprLine;
import com.madmax.stool.approval.model.vo.AppredDoc;
import com.madmax.stool.approval.model.vo.Approval;
import com.madmax.stool.approval.model.vo.DeptUsers;
import com.madmax.stool.approval.model.vo.User;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	ApprovalDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<DeptUsers> selectDeptInfo() {
		return dao.selectDeptInfo(session);
	}

	@Override
	public List<User> selectDeptUsers(DeptUsers du) {
		return dao.selectDeptUsers(session, du);
		
	}

	@Override
	public List<ApprDocType> selectApprDocList(int cPage, int numPerPage) {
		return dao.selectApprDocList(session, cPage, numPerPage);
	}

	@Override
	public int selectApprDocListCount() {
		return dao.selectApprDocListCount(session);
	}

	@Override
	public ApprDocType selectApprDocForm(int dNo) {
		// TODO Auto-generated method stub
		return dao.selectApprDocForm(session, dNo);
	}

	@Override
	public int updateUserSign(String userId) {
		return dao.updateUserSign(session, userId);
	}

	@Override
	@Transactional
	public int insertApproval(Approval appr, List<ApprLine> lines, List<AppredDoc> appred, 
								List<ApprAttachment> files) throws RuntimeException{
		//1 Approval TBL에 추가
		int result = dao.insertApproval(session, appr);			
		if(result==0) {
			throw new RuntimeException("결재 문서 입력 오류");
		}
		//2 ApprLine TBL에 추가
		for(ApprLine al : lines) {
			al.setApprNo(appr.getApprNo());
			result=dao.insertApprLine(session, al);
			if(result==0) {
				throw new RuntimeException("결재선 입력 오류");
			}
		}
		// AppredDoc 추가
		if(!appred.isEmpty()) {
			for(AppredDoc ad : appred) {
				ad.setApprNo(appr.getApprNo());
				result=dao.insertAppredDoc(session, ad);
				if(result==0) {
					throw new RuntimeException("결재선 입력 오류");
				}
			}
		}
		
		//업로드파일 추가
		if(!files.isEmpty()) {
			for(ApprAttachment at : files) {
				at.setApprNo(appr.getApprNo());
				result=dao.insertApprAttachment(session, at);
				if(result==0) {
					throw new RuntimeException("결재선 입력 오류");
				}
			}
		}

		return 1;
	}


	@Override
	public ApprDoc selectApprDoc(int apprNo) {
		//1. Approval doc 가져오기
		ApprDoc appr = dao.selectApproval(session, apprNo);
		//2. ApprLine 가져오기
		List<ApprLine> lines = dao.selectApprLine(session, apprNo);
		appr.setApprLine(lines);
		//3. 수신인 이름 가져오기
		appr.setReceiverName(dao.selectReceiverName(session, appr.getReceiver()));
		//4. 기결재문서 가져오기
		appr.setAppredDoc(dao.selectAppredDoc(session, apprNo));
		//5. 첨부파일 가져오기
		appr.setApprAttachment(dao.selectApprAttachment(session, apprNo));
		
		return appr;
	}


	@Override
	public ApprDoc selectDoApproval(Approval approval) {
		//select apprDoc 
		ApprDoc appr = dao.selectDoApproval(session, approval);
		//select apprLine
		List<ApprLine> lines = dao.selectApprLine(session, approval.getApprNo());
		appr.setApprLine(lines);
		//3. 수신인 이름 가져오기
		appr.setReceiverName(dao.selectReceiverName(session, appr.getReceiver()));
		//4. 기결재문서 가져오기
		appr.setAppredDoc(dao.selectAppredDoc(session, approval.getApprNo()));
		//5. 첨부파일 가져오기
		appr.setApprAttachment(dao.selectApprAttachment(session, approval.getApprNo()));
		return appr;
	}

	@Override
	public int updateTemporary(int apprNo) {
		return dao.updateTemporary(session, apprNo);
	}

	@Override
	public int deleteDoc(int apprNo) {
		return dao.deleteDoc(session, apprNo);
	}
	
	@Override
	public List<Approval> selectApprReqList(int cPage, int numPerPage, String userId) {
		return dao.selectApprReqList(session, cPage, numPerPage, userId);
	}

	@Override
	public int selectApprReqListCount(String userId) {
		return dao.selectApprReqListCount(session, userId);
	}
	

	@Override
	public List<Approval> selectApprTempList(int cPage, int numPerPage, String userId) {
		return dao.selectApprTempList(session, cPage, numPerPage, userId);
	}
	
	@Override
	public int selectApprTempListCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectApprTempListCount(session, userId);
	}

	@Override
	public List<Approval> selectApprWaitList(int cPage, int numPerPage, String userId) {
		return dao.selectApprWaitList(session, cPage, numPerPage, userId);
	}


	@Override
	public int selectApprWaitListCount(String userId) {
		return dao.selectApprWaitListCount(session, userId);
	}
	@Override
	@Transactional
	public int updateAppr(ApprLine line) {
		//1. apprLine 업데이트
		int result=dao.updateAppr(session, line);
		//2. approval 업데이트
		if(result>0) {
			if(line.getApprResult()==2) {
				result=dao.updateApprStatusEnd(session,line);
			}else {
				int apprNo=line.getApprNo();
				ApprDoc appr = dao.selectApproval(session, apprNo);				
				if(appr.getCurrApprStep()+1==appr.getFinalApprStep()) {
					result=dao.updateApprStatusEnd(session,line);
				}else {
					result=dao.updateApprStatusIng(session,line);
				}
			}
		}else {
			return 0;
		}
		
		return result;
	}

	@Override
	public List<ApprDoc> selectAttachAppredDoc(String deptCode) {
		return dao.selectAttachAppredDoc(session, deptCode);
	}

	@Override
	@Transactional
	public int updateTempApproval(Approval appr, List<ApprLine> apprLines, List<AppredDoc> appred,
			List<ApprAttachment> files, List<ApprAttachment> delFiles) throws RuntimeException{
		
		//1 Approval TBL에 업데이트
		int result = dao.updateApproval(session, appr);			
		if(result==0) {
			throw new RuntimeException("결재 문서 입력 오류");
		}
		//2-1 ApprLine TBL 삭제
		dao.deleteApprLine(session, appr.getApprNo());
		//2-2 ApprLine update
		for(ApprLine al : apprLines) {
			al.setApprNo(appr.getApprNo());
			result=dao.insertApprLine(session, al);
			if(result==0) {
				throw new RuntimeException("결재선 입력 오류");
			}
		}
		//3-1AppredDoc 삭제
		dao.deleteAppredDoc(session, appr.getApprNo());
		//3-2 AppredDoc 추가
		if(!appred.isEmpty()) {
			for(AppredDoc ad : appred) {
				ad.setApprNo(appr.getApprNo());
				result=dao.insertAppredDoc(session, ad);
				if(result==0) {
					throw new RuntimeException("기결재 문서 입력 오류");
				}
			}
		}
		
		//4-1 업로드파일 추가
		if(!files.isEmpty()) {
			for(ApprAttachment at : files) {
				at.setApprNo(appr.getApprNo());
				result=dao.insertApprAttachment(session, at);
				if(result==0) {
					throw new RuntimeException("파일 업로드오류");
				}
			}
		}
		//4-2 삭제 파일 있을 시 DB에서 삭제
		System.out.println("삭제파일 있어야되는데 없냐? 엠티니? 트루펄스?"+delFiles.isEmpty());
		if(!delFiles.isEmpty()) {
			for(ApprAttachment at : delFiles) {
				result = dao.deleteApprAttachment(session, at.getDocFileNo());
				if(result==0) {
					throw new RuntimeException("파일 삭제 오류");
				}
			}
		}

		return 1;

	}

	@Override
	public List<Approval> selectMyDocList(int cPage, int numPerPage, String userId) {
		return dao.selectMyDocList(session, cPage, numPerPage, userId);
	}
	
	@Override
	public int selectMyDocListCount(String userId) {
		return dao.selectMyDocListCount(session, userId);
	}

	@Override
	public List<Approval> selectDeptDocList(int cPage, int numPerPage, String deptCode) {
		return dao.selectDeptDocList(session, cPage, numPerPage, deptCode);
	}

	@Override
	public int selectDeptDocListCount(String deptCode) {
		return dao.selectDeptDocListCount(session, deptCode);
	}

	@Override
	public List<Approval> selectRefferedDocList(int cPage, int numPerPage, String userId) {
		return dao.selectRefferedDocList(session, cPage, numPerPage, userId);
	}

	@Override
	public int selectRefferedDocListCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectRefferedDocListCount(session, userId);
	}
	
	
	

	
	
}
