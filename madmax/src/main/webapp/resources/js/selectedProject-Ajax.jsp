<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<script>
	/* $(document).ready(function() { alert("로딩 완료"); }); */
//글 작성
function fn_writeSubmit(){
    // Get form
    var form = $('#pjMainForm')[0];

    // Create an FormData object 
    var data = new FormData(form);


    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "${path}/selectedProject/insertSelectedProject.do",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {        	
        	if(data>0){
        		alert("게시글이 등록되었습니다.");
        		location.reload(true);
        	}else{
        		alert("게시글이 정상적으로 등록되지않았습니다. 다시 시도해주세요.");
        	}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("fail");
        }
    });
}
	
//즐찾기능	
function fn_favorite(flag,pjNo,loginId){    
	//flag가 1인 경우엔 즐찾이 되어있으니 즐찾을 해제하는 것    
	if(flag > 0){
		$.ajax({
			url:"${path}/selectedProject/deleteFavorite.do",
			data:{flag:flag,
				  pjNo:pjNo,
				  loginId:loginId},
			success:function(data){
				if(data > 0){
					alert("즐겨찾기 해제되었습니다.");
	        		location.reload(true);
				}else{
					alert("즐겨찾기 해제에 실패하였습니다. 다시 시도해주세요");
				}
			}
		});
	}else if(flag == 0){
		$.ajax({
			url:"${path}/selectedProject/insertFavorite.do",
			data:{flag:flag,
				  pjNo:pjNo,
				  loginId:loginId},
			success:function(data){
				console.log(data);
				if(data > 0){
					alert("즐겨찾기로 등록되었습니다.");
	        		location.reload(true);
				}else{
					alert("즐겨찾기 등록에 실패하였습니다. 다시 시도해주세요");
				}
			}
		});
	}

}	

//프로젝트 색상변경
function fn_selectColor(e,pjNo,color){
    let id = $(e).attr("id");
    switch(id){
        case "selectColor-lightGray" : 
            $("#pjInfoContainer").attr("style", "background-color: #c8c8c8;"); 
            break;
        case "selectColor-gray": 
            $("#pjInfoContainer").attr("style", "background-color: #505050;"); 
            $("#pjInfoBoxColor").val("gray");
            break;
        case "selectColor-yellow": 
            $("#pjInfoContainer").attr("style", "background-color: #ffe346;"); 
            break;
        case "selectColor-orange": 
            $("#pjInfoContainer").attr("style", "background-color: #ff9318;"); 
            break;
        case "selectColor-red": 
            $("#pjInfoContainer").attr("style", "background-color: #ff3b29;");
            break;
        case "selectColor-pink": 
            $("#pjInfoContainer").attr("style", "background-color: #ff939c;"); 
            break;
        case "selectColor-purple": 
            $("#pjInfoContainer").attr("style", "background-color: rgb(161, 61, 156);"); 
            break;
        case "selectColor-blue": 
            $("#pjInfoContainer").attr("style", "background-color: #25558F;"); 
            break;
        case "selectColor-lightBlue": 
            $("#pjInfoContainer").attr("style", "background-color: #acc2ff;"); 
            break;
        case "selectColor-lightMint": 
            $("#pjInfoContainer").attr("style", "background-color: #81ddc6;"); 
            break;
        case "selectColor-mint": 
            $("#pjInfoContainer").attr("style", "background-color: #17a2b8;"); 
            break;
        case "selectColor-green": 
            $("#pjInfoContainer").attr("style", "background-color: #71d364;"); 
            break;
    }
    
	$.ajax({
		url:"${path}/selectedProject/updateProjectColor.do",
		data:{pjNo:pjNo,
			  color:color}/* ,
		success:function(data){
			if(data > 0){
				alert("즐겨찾기 해제되었습니다.");
        		location.reload(true);
			}else{
				alert("즐겨찾기 해제에 실패하였습니다. 다시 시도해주세요");
			}
		} */
	});
}
    
    
    
</script>