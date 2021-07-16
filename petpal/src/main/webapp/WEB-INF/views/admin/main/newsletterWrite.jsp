<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세 페이지</title>
<style>
.table>tr>td{
	text-align: center;
}
</style>
<script src="${ pageContext.servletContext.contextPath }/ckeditor/ckeditor.js"></script>
	
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	
	<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 쓰기</h2>
        <form action="BoardWriterProc.jsp" method="post" \>
        
          <table class="table table-striped">
            <tr>
                <td>작성자</td>
                <td><input type="text"  class="form-control" name="writer"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="subject"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email"  class="form-control" name="email"></td>
            </tr>
             
            <tr>
                <td>비밀번호</td>
                <td><input type="password"  class="form-control" name="password"></td>
            </tr>
             
            <tr>
                <td>글내용</td>
		        <td>
		             <div class="row justify-content-md-center">
				          <div class="col_c" style="margin-bottom: 30px">
				                <div class="input-group">                 
				                  <textarea class="form-control" id="p_content"></textarea>
				                  <script type="text/javascript">
				                  CKEDITOR.replace( 'editor2', {
				                		filebrowserBrowseUrl: '/ckfinder/ckfinder.html',
				                		filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'
				                	} );
				                  CKEDITOR.replace('p_content', {height: 600});
				                  </script>
				                </div>
				            </div> 
				      </div>
		        </td>
            </tr>
            <tr>
                 
                <td colspan="2"  class="text-center">
                    <input type="submit" value="글쓰기" class="btn btn-success">
                    <input type="reset" value="다시작성" class="btn btn-warning">
                    <button type="button"  class="btn btn-primary">전체 게시글보기</button>
                </td>
            </tr>
             
          </table>
        </form>
    </div>
</div>




	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
	
	</body>
</html>