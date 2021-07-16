<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .inquiry .tab_each{display:none}
         .inquiry .tab_each:first-child{display:block}
         .inquiry .tab{display:none}
         .tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}
         .tab .active, .tab .tab_btn.active {
             color: #000;
             font-weight: bold;
             color: #45b99c8a;
         }
         .tab span.tab_btn {
             display: inline-block;
             float: none;   
             position: relative;
             width: auto;
             height: 40px;
             margin-right: 22px;
             font-size: 18px;
             line-height: normal;
             color: rgba(0,0,0,0.56);
             text-align: left;
             cursor: pointer;
         }
            .tab {
             height: auto;
             border-bottom: 1px solid rgba(0,0,0,0.2);
         }
         .tab .active:after {
             display: block;
             content: '';
             position: absolute;
             bottom: 0;
             left: 0;
             width: 100%;
             height: 2px;
             background: #45b99c8a;
         }
         td > button {
            background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 80px; 
                height: auto; 
                font-size: 13px; 
                font-weight: 500;
                border-radius: 10px;
         }
         td > button:hover {
            background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
         }
         td.notbutton > button {
            background-color: rgb(175, 175, 175); 
                color: white;
                border-color: rgb(175, 175, 175); 
                border: 1px solid; 
                width: 80px; 
                height: auto; 
                font-size: 13px; 
                font-weight: 500;
                border-radius: 10px;
         }
         td > input {
               height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            tr, td {
               font-size: 17px;
            height: 55px;
            text-align: left;
         }
            td > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            div > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 20px;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
            .overlay {
              position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            transition: opacity 500ms;
            visibility: hidden;
            opacity: 0;
            z-index: 900;
            height: 150% !important;
         }
         .overlay:target {
            visibility: visible;
            opacity: 1;
         }
         .popup {
            position: fixed;
            width: 60%;
            padding: 10px;
            max-width: 500px;
            border-radius: 10px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, .9);
            -webkit-transition: opacity .5s, visibility 0s linear .5s;
            transition: opacity .5s, visibility 0s linear .5s;
            z-index: 1;
         }
         .popup:target {
            visibility: visible;
            opacity: 1;
            -webkit-transition-delay: 0s;
            transition-delay: 0s;
         }
         .popup-close {
            position: absolute;
            padding: 10px;
            max-width: 500px;
            border-radius: 10px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, .9);
         }
         .popup .close {
            position: absolute;
            right: 5px;
            top: 5px;
            padding: 5px;
            color: #000;
            transition: color .3s;
            font-size: 2em;
            line-height: .6em;
         }
         .popup .close:hover {
            color: #007a5c;
         }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        <!-- xsslider slider css -->


        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/xsslider.css">-->




        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">


        <!-- Preloader -->
        <div id="loading"> 
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->


        <div class="culmn">
            <!--Home page style-->


            <jsp:include page="../common/userHeader.jsp"/>
            <!--Home Sections-->

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">내가 쓴 게시글 / 댓글 목록</div>
            </section> <!--End off Home Sections-->

            <section id="list" class="list" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div class="tab">
                   <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/'" style="width:50px; float: right;">
               <span id="sp0" class="tab_btn active" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A';">실종 게시판</span>
               <span id="sp1" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B';" >입양 게시판</span>
               <span id="sp2" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C';">정보공유 게시판</span>
               <span id="sp3" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D';">자유 게시판</span>
               <span id="sp4" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=E';">무료나눔 게시판</span>
               <span id="sp5" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F';">용품리뷰 게시판</span>
               <span id="sp5" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H';">프렌들리 게시판</span>
               <%-- <span id="sp7" class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=G';">댓글목록</span> --%>
            </div>
            </section>

            <section id="menutable" class="menutable">
            <div class="tab-content">
                   <div id="menu0" class="tab-pane fade in active">
                  <div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
                         <table class="table table-hover" style="margin-bottom: 50px;">
                             <thead>
                                <c:choose>
                                   <c:when test="${ type eq 'H' || type eq 'C' }">
                                   <tr style="background-color: #F1FAF8;">
                                        <th style="text-align: center; border-radius: 21px 0px 0px 0px;"><b>제목</b></th>
                                          <th style="text-align: center;"><b>날짜</b></th>
                                          <th style="text-align: center;"><b>승인상태</b></th>
                                          <th style="text-align: center;"><b>거절사유</b></th>
                                        <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>삭제</b></th>
                                    </tr>
                                   </c:when>
                                   <c:otherwise>
                                    <tr style="background-color: #F1FAF8;">
                                        <th style="text-align: center; border-radius: 21px 0px 0px 0px;"><b>제목</b></th>
                                          <th style="text-align: center;"><b>날짜</b></th>
                                        <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>삭제</b></th>
                                    </tr>
                                   </c:otherwise>
                                </c:choose>
                                
                             </thead>
                             <tbody>
                             <c:if test="${ type eq 'A' }">
                                 <c:forEach items="${ aList }" var="list">
                            <tr onclick="location.href='${ pageContext.servletContext.contextPath }/user/missing/detail/${ list.boardCode }'" id="stop">
                              <c:if test="${ list.gender eq 'M'}">
                              <td style="text-align: center;">${ list.breed }/남아/${ list.color }</td>
                              </c:if>
                              <c:if test="${ list.gender eq 'F'}">
                              <td style="text-align: center;">${ list.breed }/여아/${ list.color }</td>
                              </c:if>
                              <td style="text-align: center;">${ list.missingDate }</td>
                              <td style="text-align: center;">
                              <input type="hidden" value="A" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="A">삭제</button>
                              </td>
                           </tr>
                           </c:forEach>
                           </c:if>
                                 <c:if test="${ type eq 'B' }">
                                 <c:forEach items="${ bList }" var="list">
                           <tr onclick="location.href='${ pageContext.servletContext.contextPath }/user/adopt/detail/${ list.boardCode }'" id="stop">
                              <c:if test="${ list.adoptGender eq 'M'}">
                              <td style="text-align: center;">${ list.adoptBreed }/남아/${ list.adoptColor }</td>
                              </c:if>
                              <c:if test="${ list.adoptGender eq 'F'}">
                              <td style="text-align: center;">${ list.adoptBreed }/여아/${ list.adoptColor }</td>
                              </c:if>
                              <td style="text-align: center;">${ list.boardDate }</td>
                              <c:if test="${ list.stateCode eq 1 }">
                              <td >
                              <input type="hidden" value="B" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="B">삭제</button>
                              </td>
                              </c:if>
                              <c:if test="${ list.stateCode eq 2 }">
                              <td style="text-align: center;"><button disabled>삭제불가</button></td>
                              </c:if>
                           </tr>
                           </c:forEach>
                                 </c:if>
                                 <c:if test="${ type eq 'C' }">
                           <c:forEach items="${ cList }" var="list">
                              <c:choose>
                                 <c:when test="${ list.dicisionCode eq 0 }">
                                    <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/detail?boardCode=${ list.boardCode }'">
                                    <td style="text-align: center;">${ list.boardTitle }</td>
                                    <td style="text-align: center;">${ list.postDate }</td>
                                    <td style="text-align: center;"><c:out value="승인대기" /></td>
                                    <td style="text-align: center;"></td>
                                 </c:when>
                                 <c:when test="${ list.state eq 2 }">
                                    <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/detail?boardCode=${ list.boardCode }'">
                                    <td style="text-align: center;">${ list.boardTitle }</td>
                                    <td style="text-align: center;">${ list.postDate }</td>
                                    <td style="text-align: center;"><c:out value="승인" /></td>
                                    <td style="text-align: center;"></td>
                                 </c:when>
                                 <c:when test="${ list.state eq 3 }">
                                    <tr id="stop" onclick="backPosting(this);">
                                    <td style="text-align: center;">${ list.boardTitle }</td>
                                    <td style="text-align: center;">${ list.postDate }</td>
                                    <td style="text-align: center;"><c:out value="거절" /></td>
                                    <td style="text-align: center;"><c:out value="${ list.dReason }" /></td>
                                 </c:when>
                              </c:choose>
                              <td style="text-align: center;">
                              <input type="hidden" value="C" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="C">삭제</button>
                              </td>
                           </tr>
                           </c:forEach>
                                 </c:if>
                                 <c:if test="${ type eq 'D' }">
                                 <c:forEach items="${ dList }" var="list">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/freeboard/detail?boardCode=${ list.boardCode }'">
                              <td style="text-align: center;">${ list.boardTitle }</td>
                              <td style="text-align: center;">${ list.postDate }</td>
                              <td style="text-align: center;">
                              <input type="hidden" value="D" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="D">삭제</button>
                              </td>
                           </tr>
                           </c:forEach>
                                 </c:if>
                                 <c:if test="${ type eq 'E' }">
                                 <c:forEach items="${ eList }" var="list">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/detail/board/${ list.boardCode }'">
                              <td style="text-align: center;">${ list.boardTitle }</td>
                              <td style="text-align: center;">${ list.postDate }</td>
                              <td style="text-align: center;">
                              <input type="hidden" value="E" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="E">삭제</button>
                              </td>
                           </tr>
                           </c:forEach>
                                 </c:if>
                                 <c:if test="${ type eq 'F' }" >
                                 <c:forEach items="${ fList }" var="list">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/review/reviewDetail?boardCode=${ list.boardCode }'">
                              <td style="text-align: center;">${ list.boardTitle }</td>
                              <td style="text-align: center;">${ list.postDate }</td>
                              <td style="text-align: center;">
                              <input type="hidden" value="F" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="F">삭제</button>
                              </td>
                           </tr>
                           </c:forEach>
                                 </c:if>
                                 <c:if test="${ type eq 'H' }" >
                                 <c:forEach items="${ hList }" var="list">
                              <c:choose>
                                 <c:when test="${ list.dicisionCode eq 0 }">
                                    <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/detail?boardCode=${ list.boardCode }'">
                                    <td style="text-align: center;">${ list.boardTitle }</td>
                                    <td style="text-align: center;">${ list.postDate }</td>
                                    <td style="text-align: center;"><c:out value="승인대기" /></td>
                                    <td style="text-align: center;"></td>
                                 </c:when>
                                 <c:when test="${ list.state eq 2 }">
                                    <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/detail?boardCode=${ list.boardCode }'">
                                    <td style="text-align: center;">${ list.boardTitle }</td>
                                    <td style="text-align: center;">${ list.postDate }</td>
                                    <td style="text-align: center;"><c:out value="승인" /></td>
                                    <td style="text-align: center;"></td>
                                 </c:when>
                                 <c:when test="${ list.state eq 3 }">
                                    <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/detail?boardCode=${ list.boardCode }'">
                                    <td style="text-align: center;">${ list.boardTitle }</td>
                                    <td style="text-align: center;">${ list.postDate }</td>
                                    <td style="text-align: center;"><c:out value="거절" /></td>
                                    <td style="text-align: center;"><c:out value="${ list.dReason }" /></td>
                                 </c:when>
                              </c:choose>
                              <td style="text-align: center;">
                              <input type="hidden" value="H" id="type2">
                              <button onclick="deleteClick(this)" id="delete" class="${ list.boardCode }" title="H">삭제</button>
                              </td>
                           </tr>
                           </c:forEach>
                                 </c:if>
                             </tbody>
                         </table>
                         <!-- <script>
                        function backPosting(test){
                           
                           let reason = test.className;
                           let boardCode = test.title;
                           
                           console.log(reason);
                           console.log(boardCode);
                           
                           alert("거절 사유 : " + reason);
                        }
                     </script> -->
                         <div class="text-center">
                        <ul class="pagination">
                        <!-- A타입일때 하단 -->
                        <c:if test="${ type eq 'A' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A&?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        <!-- B타입일때 하단 -->
                        <c:if test="${ type eq 'B' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        <!-- C타입일때 하단 -->
                        <c:if test="${ type eq 'C' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        <!-- D타입일때 하단 -->
                        <c:if test="${ type eq 'D' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        <!-- E타입일때 하단 -->
                        <c:if test="${ type eq 'E' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=E&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=E&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=E&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        <!-- F타입일때 하단 -->
                        <c:if test="${ type eq 'F' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        <!-- H타입일때 하단 -->
                        <c:if test="${ type eq 'H' }">
                        <li>
                           <c:if test="${paging.startPage != 1 }">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
                           </c:if>
                           <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                              <c:choose>
                                 <c:when test="${p == paging.nowPage }">
                                    <li><a>${p }</a></li>
                                 </c:when>
                                 <c:when test="${p != paging.nowPage }">
                                    <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                                 </c:when>
                              </c:choose>
                           </c:forEach>
                           <c:if test="${paging.endPage != paging.lastPage}">
                              <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
                           </c:if>
                           </li>
                        </c:if>
                        </ul>
                     </div>
                      </div>
               </div>
               </div>
            </section>
            <section>
            <div id="menu0" class="tab-pane fade in active">
            <div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
                  <table class="table table-hover" style="margin-bottom: 50px;">
                      <thead>
                         <tr style="background-color: #F1FAF8;">
                             <th style="text-align: center; border-radius: 21px 0px 0px 0px;"><b>댓글 내용</b></th>
                               <th style="text-align: center;"><b>날짜</b></th>
                             <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>삭제</b></th>
                         </tr>
                     </thead>
                     <tbody>
                     <c:if test="${ type eq 'A' }">
                         <c:forEach items="${ reply }" var="list">
                            <c:if test="${ list.missingDeleteYn eq 'Y' }">
                           <tr id="stop" onclick="deletePosting();">
                            </c:if>
                            <c:if test="${ list.missingDeleteYn eq 'N' }">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/missing/detail/${ list.boardCode }'">
                            </c:if>
                           <td style="text-align: center;">${ list.replyContent }</td>
                           <td style="text-align: center;">${ list.replyDate }</td>
                           <td style="text-align: center;">
                           <input type="hidden" value="G" id="type2">
                           <input type="hidden" value="A" id="type">
                           <button onclick="deleteClick(this)" id="delete" class="${ list.replyCode }" title="G">삭제</button>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${ type eq 'B' }">
                         <c:forEach items="${ reply }" var="list">
                            <c:if test="${ list.adoptDeleteYn eq 'Y' }">
                           <tr id="stop" onclick="deletePosting();">
                            </c:if>
                            <c:if test="${ list.adoptDeleteYn eq 'N' }">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/adopt/detail/${ list.boardCode }'">
                            </c:if>
                           <td style="text-align: center;">${ list.replyContent }</td>
                           <td style="text-align: center;">${ list.replyDate }</td>
                           <td style="text-align: center;">
                           <input type="hidden" value="G" id="type2">
                           <input type="hidden" value="B" id="type">
                           <button onclick="deleteClick(this)" id="delete" class="${ list.replyCode }" title="G">삭제</button>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${ type eq 'C' }">
                         <c:forEach items="${ reply }" var="list">
                           <c:if test="${ list.deleteYn eq 'Y' }">
                           <tr id="stop" onclick="deletePosting();">
                            </c:if>
                            <c:if test="${ list.deleteYn eq 'N' }">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/detail?boardCode=${ list.boardCode }'">
                            </c:if>
                           <td style="text-align: center;">${ list.replyContent }</td>
                           <td style="text-align: center;">${ list.replyDate }</td>
                           <td style="text-align: center;">
                           <input type="hidden" value="G" id="type2">
                           <input type="hidden" value="C" id="type">
                           <button onclick="deleteClick(this)" id="delete" class="${ list.replyCode }" title="G">삭제</button>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${ type eq 'D' }">
                         <c:forEach items="${ reply }" var="list">
                            <c:if test="${ list.deleteYn eq 'Y' }">
                           <tr id="stop" onclick="deletePosting();">
                            </c:if>
                            <c:if test="${ list.deleteYn eq 'N' }">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/freeboard/detail?boardCode=${ list.boardCode }'">
                            </c:if>
                           <td style="text-align: center;">${ list.replyContent }</td>
                           <td style="text-align: center;">${ list.replyDate }</td>
                           <td style="text-align: center;">
                           <input type="hidden" value="G" id="type2">
                           <input type="hidden" value="D" id="type">
                           <button onclick="deleteClick(this)" id="delete" class="${ list.replyCode }" title="G">삭제</button>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${ type eq 'F' }">
                         <c:forEach items="${ reply }" var="list">
                            <c:if test="${ list.deleteYn eq 'Y' }">
                           <tr id="stop" onclick="deletePosting();">
                            </c:if>
                            <c:if test="${ list.deleteYn eq 'N' }">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/review/reviewDetail?boardCode=${ list.boardCode }'">
                            </c:if>
                           <td style="text-align: center;">${ list.replyContent }</td>
                           <td style="text-align: center;">${ list.replyDate }</td>
                           <td style="text-align: center;">
                           <input type="hidden" value="G" id="type2">
                           <input type="hidden" value="F" id="type">
                           <button onclick="deleteClick(this)" id="delete" class="${ list.replyCode }" title="G">삭제</button>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test="${ type eq 'H' }">
                         <c:forEach items="${ reply }" var="list">
                            <c:if test="${ list.deleteYn eq 'Y' }">
                           <tr id="stop" onclick="deletePosting();">
                            </c:if>
                            <c:if test="${ list.deleteYn eq 'N' }">
                           <tr id="stop" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/detail?boardCode=${ list.boardCode }'">
                            </c:if>
                           <td style="text-align: center;">${ list.replyContent }</td>
                           <td style="text-align: center;">${ list.replyDate }</td>
                           <td style="text-align: center;">
                           <input type="hidden" value="G" id="type2">
                           <input type="hidden" value="H" id="type">
                           <button onclick="deleteClick(this)" id="delete" class="${ list.replyCode }" title="G">삭제</button>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                     </tbody>
                  </table>
           <div class="text-center">
            <ul class="pagination">
            <c:if test="${ type eq 'A' }">
               <li>
                  <c:if test="${paging2.startPage != 1 }">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A&nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a></li>
                  </c:if>
                  <c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
                     <c:choose>
                        <c:when test="${p == paging2.nowPage }">
                           <li><a>${p }</a></li>
                        </c:when>
                        <c:when test="${p != paging2.nowPage }">
                           <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A&nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>
                  </c:forEach>
                  <c:if test="${paging2.endPage != paging2.lastPage}">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=A&?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                  </c:if>
                  </li>
            </c:if>
            <c:if test="${ type eq 'B' }">
               <li>
                  <c:if test="${paging2.startPage != 1 }">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B&nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a></li>
                  </c:if>
                  <c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
                     <c:choose>
                        <c:when test="${p == paging2.nowPage }">
                           <li><a>${p }</a></li>
                        </c:when>
                        <c:when test="${p != paging2.nowPage }">
                           <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B&nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>
                  </c:forEach>
                  <c:if test="${paging2.endPage != paging2.lastPage}">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=B&?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                  </c:if>
                  </li>
            </c:if>
            <c:if test="${ type eq 'C' }">
               <li>
                  <c:if test="${paging2.startPage != 1 }">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C&nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a></li>
                  </c:if>
                  <c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
                     <c:choose>
                        <c:when test="${p == paging2.nowPage }">
                           <li><a>${p }</a></li>
                        </c:when>
                        <c:when test="${p != paging2.nowPage }">
                           <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C&nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>
                  </c:forEach>
                  <c:if test="${paging2.endPage != paging2.lastPage}">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=C&?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                  </c:if>
                  </li>
            </c:if>
            <c:if test="${ type eq 'D' }">
               <li>
                  <c:if test="${paging2.startPage != 1 }">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D&nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a></li>
                  </c:if>
                  <c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
                     <c:choose>
                        <c:when test="${p == paging2.nowPage }">
                           <li><a>${p }</a></li>
                        </c:when>
                        <c:when test="${p != paging2.nowPage }">
                           <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D&nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>
                  </c:forEach>
                  <c:if test="${paging2.endPage != paging2.lastPage}">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=D&?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                  </c:if>
                  </li>
            </c:if>
            <c:if test="${ type eq 'F' }">
               <li>
                  <c:if test="${paging2.startPage != 1 }">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F&nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a></li>
                  </c:if>
                  <c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
                     <c:choose>
                        <c:when test="${p == paging2.nowPage }">
                           <li><a>${p }</a></li>
                        </c:when>
                        <c:when test="${p != paging2.nowPage }">
                           <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F&nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>
                  </c:forEach>
                  <c:if test="${paging2.endPage != paging2.lastPage}">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=F&?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                  </c:if>
                  </li>
            </c:if>
            <c:if test="${ type eq 'H' }">
               <li>
                  <c:if test="${paging2.startPage != 1 }">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H&nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a></li>
                  </c:if>
                  <c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
                     <c:choose>
                        <c:when test="${p == paging2.nowPage }">
                           <li><a>${p }</a></li>
                        </c:when>
                        <c:when test="${p != paging2.nowPage }">
                           <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H&nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>
                  </c:forEach>
                  <c:if test="${paging2.endPage != paging2.lastPage}">
                     <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList?type=H&?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">${p }</a></li>
                  </c:if>
                  </li>
            </c:if>
                </ul>
             </div>
            </div>
          </div>  
            </section>
            
            <script>
            let targetLink = document.querySelectorAll('.tab span');
            for(var i = 0; i < targetLink.length; i++){
               targetLink[i].classList.remove('active');
               if(i == ${ requestScope.num}){
                  targetLink[i].classList.add('active');
               }
            }
            
         </script>
         <script>
            function deletePosting(){
               console.log("들어옴");
               alert("삭제가 된 게시글입니다.");
            }
         </script>
         
         <div id="deletePost" class="overlay" id="why">
            <div class="popup">
               <a href="" class="close">&times;</a>
               <p style="font-size: 20px; text-align: center; padding-bottom: 10px;">삭제하기</p>
               <div class="cont-step cont-step_02" id="contStep02" style="display: block;">
                  <div class="cont-step_preface">
                     <h3 align="center">해당 글을 삭제하시겠습니까</h3>
                     <br>
                     <input type="hidden" name="boardCode" id="inputReplyCode">
                     <input type="hidden" name="type" id="type">
                     <button style="margin-left: 43%;" onclick="postDeleteA()">
                     삭제하기
                     </button>
                  </div>
               </div>
            </div>
         </div>
<script type="text/javascript">



function deleteClick(test){
   
   event.stopPropagation();
    
   let replyCode = test.className;
   let type = test.title;
   document.getElementById("inputReplyCode").value = replyCode;
   document.getElementById("type").value = type;
   location.href = '#deletePost';

}

function postDeleteA(){

   var type = document.getElementById("type").value;
   var load = document.getElementById("type2").value;
   var boardCode = document.getElementById("inputReplyCode").value;
   console.log(type);
   console.log(load);
   console.log(boardCode);

$.ajax({
   
   url:"${pageContext.servletContext.contextPath}/user/mypage/deletePost",
   type:"post",
   data:{boardCode:boardCode, type:type, load:load},
   success:function(data){
      console.log("성공!!!!!!!!!!!!");
      console.log(data);
      alert("삭제에 성공했습니다.");
      location.href="${pageContext.servletContext.contextPath}/user/mypage/boardCommentList?type="+data;
   },
   error:function(data){
      alert("삭제에 실패했습니다. 지속된 삭제 실패는 고객센터에 연락바랍니다.");
   }
});
}

</script>









                     

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>