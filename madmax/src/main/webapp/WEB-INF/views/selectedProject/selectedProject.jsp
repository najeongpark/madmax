<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha256-8zyeSXm+yTvzUN1VgAOinFgaVFEFTyYzWShOy9w7WoQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha256-TQq84xX6vkwR0Qs1qH5ADkP+MvH0W+9E7TdHJsoIQiM=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" integrity="sha256-IvM9nJf/b5l2RoebiFno92E5ONttVyaEEsdemDC6iQA=" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" integrity="sha256-aa0xaJgmK/X74WM224KMQeNQC2xYKwlAt08oZqjeF0E=" crossorigin="anonymous" />

    <!-- 데이트피커 -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap-datepicker.css">
    <script src="${path}/resources/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="${path}/resources/js/bootstrap-datepicker/bootstrap-datepicker.kr.min.js"></script>

    <!-- kakao map -->
	<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d1bdbfd0b440522feea5327aec9def1&libraries=services,clusterer,drawing"></script> -->

    <!-- 스타일 -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/selectedProject-Write.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/selectedProject-View.css"/>    

    <!-- JS -->
    <script type="text/javascript" src="${path}/resources/js/selectedProject-Write.js"></script>
    <script type="text/javascript" src="${path}/resources/js/selectedProject-View.js"></script>
    <jsp:include page="/resources/js/selectedProject-Ajax.jsp" />
    
            <div class="col-sm-7">
                <!-- 프로젝트정보 -->
                <div class="mt-3 rounded mb-3 justify-content-center align-items-center" id="pjInfoContainer" style="background-color: ${projectInfo.PROJECTCOLOR};">
                    <div id="pjInfoBox" class="row w-100 d-flex align-items-center m-0">
						<c:if test="${favorite > 0}">
	                        <button type="button" class="btn col-1 justify-content-center align-items-center pl-2" onclick="fn_favorite(${favorite},${projectInfo.PROJECTNO},'${loginUser.userId}');">
	                            <i class="fas fa-star text-white" id="favoriteIcon"></i>
	                        </button>
                        </c:if>
                     	<c:if test="${favorite == 0}">
	                        <button type="button" class="btn col-1 justify-content-center align-items-center pl-2" onclick="fn_favorite(${favorite},${projectInfo.PROJECTNO},'${loginUser.userId}');">
	                            <i class="far fa-star text-white" id="favoriteIcon"></i>
	                        </button>
						</c:if>
						
                        <h4 class="col-9 h-50 w-100 flex-wrap text-white m-0" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                           	<c:out value="${projectInfo.PROJECTTITLE}"/>
                        </h4>
                        
						<c:if test="${projectInfo.USERID == loginUser.userId}">
                        <div class="dropdown col-1" id="selectColorBox">
                        </c:if>
                        <c:if test="${projectInfo.USERID != loginUser.userId}">
                        <div class="dropdown col-1 invisible" id="selectColorBox">
                        </c:if>
                            <button type="button" class="btn dropdown-toggle justify-content-center align-items-center" data-toggle="dropdown">
                            	<i class="fas fa-paint-roller text-white"></i>
                            </button>
                            <div class="dropdown-menu">
                                <div class="w-100 h-100 d-flex justify-content-center align-items-center flex-wrap" id="colorBox">                                    
                                    <div id="selectColor-lightGray" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#c8c8c8')" style="background-color: #c8c8c8;" class="m-1"></div>
                                    <div id="selectColor-gray" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#505050')" style="background-color: #505050;" class="m-1"></div>
                                    <div id="selectColor-yellow" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ffe346')" style="background-color: #ffe346;" class="m-1"></div>
                                    <div id="selectColor-orange" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ff9318')" style="background-color: #ff9318;" class="m-1"></div>
                                    <div id="selectColor-red" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ff3b29')" style="background-color: #ff3b29;" class="m-1"></div>
                                    <div id="selectColor-pink" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ff939c')" style="background-color: #ff939c;" class="m-1"></div>
                                    <div id="selectColor-purple" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#a13d9c')" style="background-color: #a13d9c;" class="m-1"></div>
                                    <div id="selectColor-blue" onclick="fn_selectColor(this,${projectInfo.PROJECTNO}, '#25558F')" style="background-color: #25558F;" class="m-1"></div>
                                    <div id="selectColor-lightBlue" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#acc2ff')" style="background-color: #acc2ff;" class="m-1"></div>
                                    <div id="selectColor-lightMint" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#81ddc6')" style="background-color: #81ddc6;" class="m-1"></div>
                                    <div id="selectColor-mint" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#17a2b8')" style="background-color: #17a2b8;" class="m-1"></div>
                                    <div id="selectColor-green" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#71d364')" style="background-color: #71d364;" class="m-1"></div>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown col-1">
                            <button type="button" class="btn dropdown-toggle justify-content-center align-items-center" data-toggle="dropdown">
                                <i class="fas fa-bars text-white"></i>
                            </button>
                            <div class="dropdown-menu">
                                <c:if test="${projectInfo.USERID != loginUser.userId}">
                                <a class="dropdown-item" onclick="fn_pjGoOut()">프로젝트 나가기</a>
                                </c:if>
                                <c:if test="${projectInfo.USERID == loginUser.userId}">
                                	<a class="dropdown-item" onclick="$('#pjGoOutManagerModal').modal('show');">프로젝트 나가기</a>
	                                <a class="dropdown-item" onclick="$('#updateProjectModal').modal('show')">프로젝트 수정</a>
	                            </c:if>
                                <div class="dropdown-divider"></div>
                                <div class="dropdown-item d-flex flex-column">
                                    <strong>프로젝트 번호</strong>
                                    <p class="p-0 m-0"><c:out value="${projectInfo.PROJECTNO}"/></p>
                                    <p class="p-0 m-0">
                                    	<c:out value="${PROJECTNO }"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 태그 -->
                <div id="" class="w-100 bg-white border border-grey d-flex align-items-start mb-3 p-2">
                         <i class="fas fa-hashtag stoolGrey mt-2 mr-3 ml-3" style="font-size: 25px;"></i>                            
                         <!-- 태그목록 -->
                         <div id="tagBox" class="d-flex flex-wrap align-items-center">
	                         <c:forEach items="${pjTagList}" var="tag">
	                         	<a href="${path}/selectedProject/selectedProjectSelectTag.do?pjNo=${projectInfo.PROJECTNO}&loginId=${loginUser.userId}&tag=${tag.tag}" class="ml-3 mr-3 mt-1">
									<c:out value="${tag.tag}"/>
								</a>
	                         </c:forEach>
                         </div>
                </div>


                <!-- 업무리포트 -->
                <div id="reportBox" class="w-100 bg-white border border-grey d-flex flex-column align-items-center mb-3">
                        <button type="button" class="btn w-100 d-flex align-items-center justify-content-between" data-toggle="collapse" data-target="#demo" id="reportBoxBtn">
                            <div class="d-flex align-items-center ml-2">
	                            <i class="fas fa-chart-pie stoolGrey mr-2" style="font-size:25px;"></i>
	                            <strong class="m-0">
	                                	업무리포트
	                            </strong>
	                        </div>
                            <img src="${path}/resources/images/expand-arrow.png" alt="더보기" style="width: 25px;" id="rb_slide_icon">
                        </button>
                        <div id="demo" class="collapse p-2 w-100">
                            <div class="border w-100 d-flex align-items-center" style="height:600px;">
                            	<canvas id="reportArea" class=""></canvas>
                            </div>
                        </div>
                </div>

				<c:if test="${projectInfo.PROJECTSTATE eq 'P'}">
                <!-- 게시물 작성 -->
                <form method="post" enctype="multipart/form-data" onkeydown="return captureReturnKey(event);" id="pjMainForm">
                <!-- from 공통 hidden input모음 -->
				    <!-- 0) 프로젝트 작성자  --> <!-- value수정 -->
				    <input type="hidden" name="writer" value="${loginUser.userId}"/>
				    <!-- 1) 프로젝트 번호 저장 --><!-- value수정 -->
				    <input type="hidden" name="selectedProjectNo" value="${projectInfo.PROJECTNO}"/>    
                    <!-- 2) 글 타입 -->
                    <input type="hidden" name="boardType" id="boardType" value="writing"/>
                    <!-- 3) 파일-->                
                    <input type="file" name="files" id="files" multiple style="display: none;"/>
                    <!-- 4) 이미지파일 -->
                    <input type="file" name="imgFiles" id="imgFiles" multiple style="display: none;" accept="image/*"/>
                    <!-- 5) 태그 -->
                    <input type="hidden" name="tagListStr" id="tagListStr"/>
                    <!-- 6) 언급 -->
                    <input type="hidden" name="mentionListStr" id="mentionListStr"/>
                <!-- from 공통 hidden input모음 끝 -->

                    <div id="pjWriteBox" class="w-100 mb-3 bg-white border border-grey rounded">
                        <div id="writeCategoryBtns" class="row w-100 border-bottom border-light m-0">
                            <button type="button" id="cBtn-board" class="btn col-4 cBtnSelect" onclick="fn_writeCategory(this,'board');">
                                	글 작성
                            </button>
                            <button type="button" id="cBtn-task" class="btn col-4" onclick="fn_writeCategory(this,'task');">
                               	업무 작성
                            </button>
                            <button type="button" id="cBtn-schedule" class="btn col-4" onclick="fn_writeCategory(this, 'schedule');">
                                	일정 작성
                            </button>                                                                     
                        </div>

                        <!-- 작성 카테고리별 div -->
                            <!-- 1) 글 작성 -->
                            <div id="writeCategory-board" class="row w-100 m-0">
                                <div id="boardContainer" class="w-100 p-3">
                                    <div id="boardTitleBox" class="col-12 d-flex justify-content-center mb-2">
                                        <input name="writingTitle" id="writingTitle" class="titleInput w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                            placeholder="제목 입력" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;" required="required">
                                    </div>
                                    <div id="boardContentBox" class="col-12 d-flex flex-column justify-content-center">
                                        <div id="boardContentAreaDiv" class="w-100">
                                            <textarea id="boardContentArea" name="writingContent" class="w-100 border-0 contentArea" style="resize: none; visibility: visible;" placeholder="글을 입력하세요." required="required"></textarea>
                                        </div>
                                    </div>                                                                 
                                </div>
                        </div>     
                    
                        <!-- 2) 업무 작성 -->
                        <div id="writeCategory-task" class="row w-100 m-0">
                            <div id="taskBox" class="w-100 p-3">
                                <div id="taskTitleBox" class="col-12 d-flex justify-content-center mb-3">
                                    <input name="taskTitle" id="taskTitle" class="titleInput w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        placeholder="업무명 입력" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;"  required="required">
                                </div>
                                <div id="taskTabBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">진행상태</strong>
                                    <div id="taskTabBtns" class="btn-group border border-grey rounded overflow-hidden">
                                        <input type="hidden" id="progressState" name="taskState" value="요청"/>
                                        <button type="button" class="btn border-right btn-primary" id="request" onclick="fn_progressState(this, '요청');">요청</button>
                                        <button type="button" class="btn border-right" id="progress" onclick="fn_progressState(this, '진행');">진행</button>
                                        <button type="button" class="btn border-right" id="feedback" onclick="fn_progressState(this, '피드백');">피드백</button>
                                        <button type="button" class="btn border-right" id="end" onclick="fn_progressState(this, '완료');">완료</button>
                                        <button type="button" class="btn" id="hold" onclick="fn_progressState(this, '보류');">보류</button>
                                    </div>
                                </div>
                                <div id="taskListBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">담당자</strong>
                                    <input type="text" id="workerListStr" name="taskManagerId" style="display: none;" required="required"/>
                                    <div id="workerList" class="d-flex flex-wrap">            
                                        <button type="button" id="addWorker" class="btn stoolDarkBlue-outline m-1" onclick="fn_addWorkerModal();">담당자 추가</button>                       
                                    </div>
                                </div>
                                <div id="taskStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date"" id="taskStartDate" name="taskStartdate" class="stoolDateInput" required="required"/>
                                </div>   
                                <div id="taskEndDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date"" id="taskEndDate" name="taskEnddate" class="stoolDateInput" required="required"/>
                                </div>  
                                <div id="priorityBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">우선순위</strong>
                                    <input type="hidden" id="taskPriority" name="taskProiority" value="없음" required="required"/>
                                    <div class="dropdown">
                                        <button type="button" id="prioritySelectBtn" class="btn dropdown-toggle" data-toggle="dropdown" style="width: 150px;">
                                            	우선순위 선택
                                        </button>
                                        <div class="dropdown-menu text-center" id="taskPriority-dropItem">
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="없음" onclick="fn_priority(this, '없음');"><i class="fas fa-times stoolGrey mr-3" style="font-size:17px;"></i>없음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="낮음" onclick="fn_priority(this, '낮음');"><i class="fas fa-arrow-down text-success mr-3" style="font-size:17px;"></i>낮음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="보통" onclick="fn_priority(this, '보통');"><i class="fas fa-circle text-secondary mr-3" style="font-size:10px;"></i>보통</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="높음" onclick="fn_priority(this, '높음');"><i class="fas fa-arrow-up text-warning mr-3" style="font-size:17px;"></i>높음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="긴급" onclick="fn_priority(this, '긴급');"><i class="fas fa-arrow-up text-danger mr-3" style="font-size:17px;"></i>긴급</p>
                                        </div>
                                    </div>                   
                                </div>                                  
                                <div id="taskContentBox" class="col-12 d-flex justify-content-center">
                                    <textarea name="taskContent" id="taskContentArea" class="w-100 border-0 contentArea" style="resize: none;" placeholder="글을 입력하세요." required="required"></textarea>
                                </div>
                            </div>
                        </div>

                        
                        <!-- 3) 일정 작성 -->
                        <div id="writeCategory-schedule" class="row w-100 m-0">
                            <div id="scheduleBox" class="w-100 p-3">
                                <div id="scheduleTitleBox" class="col-12 d-flex justify-content-center mb-3">
                                    <input name="scheduleTitle" id="scheduleTitle" class="titleInput w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        placeholder="일정 제목 입력" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;" required="required">
                                </div>
                                <div id="scheduleStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date" id="scheduleStartDate" name="scheduleStartdate" class="stoolDateInput" required="required"/>
                                </div>   
                                <div id="scheduleEndDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date"" id="scheduleEndDate" name="scheduleEnddate" class="stoolDateInput" required="required"/>
                                </div>    
                                <div id="schedulePlaceBox" class="col-12 w-100 d-flex align-items-center mb-3">
                                    <strong class="mr-2">장소</strong>
                                    <div class="d-flex align-items-end">
                                    	<button type="button" class="btn stoolDarkBlue-outline mr-2" onclick="sample5_execDaumPostcode();">주소 검색</button>
                                    	<div id="schedulePlaceText" style="width:280px; border-bottom: 2px solid #E8E8EB;" class="ml-2"></div>
                                    	<input type="hidden" id="schedulePlace" name="schedulePlace" required="required"/>
                                    </div>
                                </div>      
                                <div id="schedulePlaceMapBox" class="col-12 d-flex w-100 align-items-center mb-3" >
									 <div id="mapBox" style="height:300px; display: none;" class="border w-100">
									 	<div id="map" style="height:300px;" class="w-100"></div>
									 </div>
                                </div>                                                                                        
                                <div id="scheduleContentBox" class="col-12 d-flex justify-content-center">
                                    <i class="far fa-sticky-note mr-2 stoolGrey" style="font-size: 24px;"></i>
                                    <textarea id="scheduleContentArea" name="scheduleMemo" class="w-100 border-0 contentArea" style="resize: none;" placeholder="메모를 입력하세요." required="required"></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- 공통 하단 -->                        
                        <div class="w-100 p-3">
                            <!-- 공통) 태그 & 언급 -->
                            <!-- 태그 입력 -->
                            <div class="col-12 addTagListBox d-none mb-2">
                                <div class="w-100 d-flex flex-column">
                                    <strong class="mb-2">태그</strong>
                                    <div class="w-100 d-flex flex-wrap align-items-center addTagList">
                                        <div class="d-flex addTagInputDiv pl-2 pr-2">
                                            # <input type="text" onkeyup="fn_addTag(this)" placeholder="태그 입력"/>
                                        </div>
                                    </div>
                                </div>
                                <hr class="w-100">
                            </div>  <!-- 태그 입력 끝 -->     
                            
                            <!-- 언급 입력 -->
                            <div class="col-12 addMentionListBox d-none mb-2">                             
                                <div class="w-100 d-flex flex-column">
                                    <strong class="mb-1">언급할 참여자 추가</strong>
                                    <div id="mentionListBox" class="w-100 d-flex flex-wrap align-items-center addMentionList">
                                        <button type="button" id="mentionModalBtn" class="btn stoolDarkBlue-outline m-1 mt-0" onclick="fn_addMentionModal();">언급 추가</button>                       
                                    </div>
                                </div>
                                <hr class="w-100">
                            </div>  <!-- 언급 입력 끝 -->    

                            <!-- 공통) 파일 미리보기 -->
                            <div id="uploadFilesPreview" class="d-none col-12 mb-2">
                                <strong class="mb-2">업로드 파일</strong>
                                <div class="col-12 d-flex flex-column mb-2">
                                    <p  id="imgFilesPreviewTitle" class="d-none align-items-center m-0 pl-1">
                                        <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
                                        	첨부이미지
                                    </p>
                                    <div class="w-100 d-flex justify-content-center">
                                        <div id="imgFileBox" class="w-100 row">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 d-flex flex-column d-none">
                                    <p id="filesPreviewTitle" class="d-none align-items-center m-0 pl-1">
                                        <i class="fas fa-file-upload stoolGrey" style="font-size: 20px;"></i>
                                       	 첨부파일
                                    </p>
                                    <div class="w-100 d-flex justify-content-center">
                                        <div id="fileBox" class="w-100 row">

                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>


                        <!-- 공통) 하단 버튼 -->
                        <div id="writeCategory-bordBtns" class="row w-100 border-top border-light m-0 justify-content-between align-items-center">
                            <div class="col-5 w-100 d-flex align-items-center"> 
                                <div id="fileUploadBtns" class="">
                                    <div class="d-flex align-items-center">
                                        <!-- 파일 업로드 -->                                      
                                        <button type="button" class="btn mr-2 ml-2" id="filesBtn">
                                            <i class="fas fa-file-upload stoolGrey" style="font-size: 25px;"></i>
                                        </button>
                                        <!-- 이미지파일 업로드 -->                                    
                                        <button type="button" class="btn" id="imgFilesBtn">
                                            <i class="fas fa-images stoolGrey" style="font-size: 25px;"></i>
                                        </button>
                                        <span style="width: 2px; height: 25px; border-left: 1px solid rgb(235, 235, 235);" class=" mr-3 ml-3"></span>
                                    </div>
                                </div>
                                <!-- 태그입력창 toggleBtn -->
                                <button type="button" class="btn mr-2 ml-2" data-toggle="tooltip" title="태그를 추가하시고 싶으시다면 클릭해주세요."
                                        onclick="fn_tagBtn()">
                            		<i class="fas fa-hashtag stoolGrey" style="font-size: 25px;"></i>
                                </button>
                                <!-- 언급할 참여자 입력 toggleBtn -->
                                <button type="button" class="btn mr-2 ml-2 tooltipBtn" data-toggle="tooltip" title="클릭하시면 회원 멘션기능을 사용하실 수 있습니다."
                                        onclick="fn_atBtn()">
                                    <i class="fas fa-at stoolGrey" style="font-size: 25px;"></i>
                                </button>                                                                            
                            </div>      
                            <div class="col-4 w-100 d-flex align-items-center justify-content-end">                           
                                <button type="submit" onclick="fn_writeSubmit();" class="btn m-2 stoolDarkBlue">
                                    	올리기
                                </button>    
                            </div>                                                              
                        </div>
					</div>
                        
                </form>
                </c:if>
                
	            <!-- ☆★☆ 게시글List include -->
 	            <div class="mb-3"> <!-- 고정글 -->
					<jsp:include page="/WEB-INF/views/selectedProject/selectedProject-pinPost.jsp" />
	            </div>
	            <div class="mb-3"> <!-- 게시글 리스트 -->
					<jsp:include page="/WEB-INF/views/selectedProject/selectedProject-postView.jsp" />
	            </div>

            </div> <!-- col-sm-7닫는 div -->

                
            <div class="col-sm-3">

				<jsp:include page="/WEB-INF/views/selectedProject/asidebar.jsp" />

				<%-- <jsp:include page="/WEB-INF/views/selectedProject/asidebar.jsp" /> --%>

			</div>


<!-- 모달모음 ------------------------------------------------------------------------------------------------------------------------------->   
    <!-- 프로젝트 설정 [ 숨김 ] -->
    <div class="modal fade" id="pjHideModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content pjSetModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">프로젝트 숨김</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">해당 프로젝트를 숨기시겠습니까?</strong>
                    <p>숨김처리된 프로젝트는 전체 프로젝트에서 노출되지 않습니다.</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" onclick="">
                            	숨기기
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 숨김 ] 끝 -->
    <!-- 프로젝트 설정 [ 나가기 ] -->
    <div class="modal fade" id="pjGoOutModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pjSetModal modal-center">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title" id="exampleModalLabel">프로젝트 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[${projectInfo.PROJECTTITLE}]</strong>
                    <p>프로젝트에서 나가시겠습니까?</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" onclick="fn_pjGoOutAjax(${projectInfo.PROJECTNO},'${loginUser.userId}')">
                            	나가기
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 나가기 ] 끝 -->
        
    <!-- 프로젝트 설정 [ 나가기 *관리자 ] -->
    <div class="modal fade" id="pjGoOutManagerModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pjSetModal modal-center">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title" id="exampleModalLabel">프로젝트 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[${projectInfo.PROJECTTITLE}]</strong>
                    	<p>
                    		<strong>${loginUser.userName}님</strong>은 해당 프로젝트의 관리자입니다.<br>
                    		프로젝트에서 나가시려면 관리자를 위임해 주세요.
                    	</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" data-dismiss="modal" onclick="$('#changePjManagerModal').modal('show')">
                            	관리자 위임
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 나가기 *관리자  ] 끝 --> 
           
    <!-- 프로젝트 설정 [ 삭제 ] -->
    <div class="modal fade" id="pjDeleteModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pjSetModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">프로젝트 삭제</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[프로젝트이름]</strong>
                    <p>프로젝트를 삭제하시겠습니까?</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" onclick="">
                            	나가기
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 삭제 ] 끝 -->         

    <!-- 게시글 작성 [ 업무 - 담당자 추가 ] -->
    <div class="modal fade" id="addWorkerModal">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">담당자 추가하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" id="" name="" placeholder="담당자 이름 검색" class="searchProjectMember w-100 addWorker_search"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName"><c:out value="${pm.userName}"/></p>
                                <span class="d-none"><c:out value="${pm.userId}"/></span>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addWorker(this,'${pm.userId}');">
                                	선택
                            </button>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 업무 - 담당자 추가 ]  끝 -->       
    
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ] -->
    <div class="modal fade" id="addMentionModal">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">언급할 참여자 추가하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" name="addWorker_search" placeholder="담당자 이름 검색" class="w-100 searchProjectMember"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100 overflow-auto" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName">
                                	<c:out value="${pm.userName}"/>
                                </p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addMention(this,'${pm.userId}');">
                                	선택
                            </button>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ]  끝 -->     
    
    <!-- 관리자 나가기 [ 위임할 관리자 선택 ] -->
    <div class="modal fade" id="changePjManagerModal">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">위임할 참여자 선택하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" name="addWorker_search" placeholder="참여자 이름 검색" class="w-100 searchProjectMember"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <c:if test="${pm.userId ne loginUser.userId}">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName">
                                	<c:out value="${pm.userName}"/>
                                </p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_changePjManager(${pm.projectNo},'${loginUser.userId}','${pm.userId}');">
                                	선택
                            </button>
                        </div>
                        </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 관리자 나가기 [ 위임할 관리자 선택 ]  끝 -->   

    <!-- 프로젝트 수정 ----------------------->       
	<div class="modal" id="updateProjectModal">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header" style="background-color: #F1F0F5">
                    <h6 class="modal-title">프로젝트 수정</h6>
                    <button type="button"  class="close" data-dismiss="modal">&times;</button>
                </div>
                <!--Modal Body-->
                <div class="modal-body d-block">
                    <ul class="list-unstyled">
                    	<form method="post" id="updateProjectForm">
                    	<input type="hidden" name="pjNo" value="${projectInfo.PROJECTNO}"/>
                        <li class="mb-2">
                            <input type="text" class="form-control" name="projectTitle" value="${projectInfo.PROJECTTITLE}"
                            style="font-size: 25px; font-weight: bolder;">
                        </li>
                        <hr>
                        <li>
                            <b>프로젝트 상태 변경</b>
                        </li>
                        <li class="d-flex mb-3 mt-3 algin-items-center">
                           	<i class="fas fa-check-circle mr-3" style='font-size:24px'></i>
                           	<label class="mr-1" for="projectState" style="cursor: pointer;">
                           		프로젝트 완료
                         	</label>
                            <div class="ml-2 custom-control custom-switch">
                            <c:if test="${projectInfo.PROJECTSTATE eq 'E' }">
                                <input type="checkbox" class="custom-control-input"  name="projectState" id="projectState" checked>
                            </c:if>
                            <c:if test="${projectInfo.PROJECTSTATE eq 'P'}">
                                <input type="checkbox" class="custom-control-input"  name="projectState" id="projectState">
                            </c:if>
                                <label class="custom-control-label" for="projectState"></label>
                            </div>                            
                        </li>
                        <div id="pjStateCk">
                        </div>
                    </ul>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer d-flex justify-content-center">
                	<button type="submit" onclick="fn_updateProjectSubmit();" class="btn m-2 stoolDarkBlue">
                    	프로젝트 수정
                   	</button>
                </div>
                </form>
            </div>
        </div>
    </div>  
    <!-- 프로젝트 수정  끝 -------------------->  
    
<!----------------------------------------------------------------------------------------------------------------------- 모달모음 끝 ------->    

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



 <script>
 	
 	var jsonData=${json};
 	var jsonObject=JSON.stringify(jsonData);
 	var jData=JSON.parse(jsonObject);
 	
 	var taskStateList = new Array();
 	var cntList=new Array();
 	var colorList=new Array();
 	
 	for(var i=0;i<jData.length;i++){
 		var d=jData[i];
 		taskStateList.push(d.taskState);
 		cntList.push(d.count);
 		colorList.push(colorize());
 	}
 	/* $.each(jsonData, function(i, e){
 		cntList.push(e.count);
 		}); */
 	var data={
 			labels:taskStateList,
 			datasets:[{
 					backgroundColor:colorList,
 					data:cntList
 			}],
 			options:{
 				title:{
 					display:true,
 					text:'업무 상태별 수'
 				}
 			}
 	};
 
	var ctx=document.getElementById('reportArea').getContext('2d');
	new Chart(ctx,{
		type:'doughnut',
		data:data
	});
 
	function colorize() {
		var r = Math.floor(Math.random()*200);
		var g = Math.floor(Math.random()*200);
		var b = Math.floor(Math.random()*200);
		var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
		return color;
	}
 
 </script>