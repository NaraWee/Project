<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스레터</title>
<style>
.table > thead > tr > th{
	 font-size:17px;

}
.table > tbody > tr > td{
	text-align: center;
	 padding-top: 15px !important;
	 padding-bottom: -15px !important;
	 font-size:17px;
	 
}

select { -webkit-appearance: none; /* 네이티브 외형 감추기 */
-moz-appearance: none; appearance: none; 
background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ } 
/* IE 10, 11의 네이티브 화살표 숨기기 */ 

select::-ms-expand { display: none; }

select { width: 150px; /* 원하는 너비설정 */
 padding: .8em .5em; /* 여백으로 높이 설정 */ 
 font-family: inherit; /* 폰트 상속 */ 
 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
 border: 1px solid #999; 
 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
 -moz-appearance: none; 
 appearance: none; }
 
select>option{
  text-align:center;}
  
 td > .complete_btn {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
  td > .send_btn {
                background-color: #FFB830; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
</style>
 <!-- summerNote -->
    	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
					<div class="head_title text-left fix">
			 			<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">뉴스레터</p>
                    </div>	
					 <div class="col-md-20">
					 		
                             <!-- Nav tabs -->
                  
							
							
                                    <!-- Tab panes -->
	                                        							              	
											
											
											 <div class="box box-primary">
								           <form action="${pageContext.servletContext.contextPath }/admin/send.do" method="post" enctype="multipart/form-data" name="form1">
								            <div class="box-header with-border">
								            </div>
								            <!-- /.box-header -->
								            <div class="box-body">
								           
								           
								          
								              
								              <div class="form-group">
								                <label>제목 </label>
								                <input class="form-control" placeholder="Subject:" name="subject">
								              </div>
								             
								             
								              <div class="form-group">
								                 <label>내용 </label>
								                    <textarea id="message" class="form-control" style="height: 300px" name="message"></textarea>
								
								              
								              
								              </div>
								              <div class="form-group">
								                <div class="form-group">
								                  <i class="fa fa-paperclip"></i> 파일첨부
								                  <input type="file" name="file"  class="form-control" > 
								                </div>
								               <!--  <p class="help-block">Max. 32MB</p> -->
								              </div>
								             
								            
								            
								            </div>
								            <!-- /.box-body -->
								            <div class="box-footer">
								              <div class="pull-right">
								                <button type="reset" class="btn btn-primary" id="reset"><i class="fa fa-pencil"></i> 리셋</button>
								                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i>보내기</button>
								              </div>
								  <!--             <button type="reset" class="btn btn-default"><i class="fa fa-times"></i> Discard</button> -->
								            </div>
								            <!-- /.box-footer -->
								            
								             </form>
								          </div>
                                      			
                                      	
                                   		</div>
                    </div>
       		  </div>		
    </section><!-- End off Product section -->
	

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
<script src="/resources/admin/plugins/ckeditor/ckeditor.js"></script>
  
<script>

$(document).ready(function(){
	
	$("#reset").click(function(){
		
		
		document.form1.senderName.value("");
		document.form1.senderMail.value("");
		document.form1.receiveMail.value("");
		document.form1.subject.value("");
		
		
		
	});
	
	 // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
	  CKEDITOR.replace( 'message', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
          width:'100%',
          height:'600px',
      //    extraPlugins : 'youtube',
         //여기 경로로 파일을 전달하여 업로드 시킨다. 
          // JSP, PHP 공통입니다. 경로를 적당히 적어줍니다.
        
         filebrowserImageUploadUrl: '/admin/mail/ckeditorupload'	
          	
      });
    
    
	
});


</script>
<script type="text/javascript">
var message = "${message}"
if(message == "뉴스레터 발송 성공"){
	alert(message)
}

</script>
</body>
</html>