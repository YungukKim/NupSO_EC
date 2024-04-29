<%@page import="dto.FurnitureDTO"%>
<%@page import="dto.OrderDTO" %>
<%@page import="dto.OrderInfoDTO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>NoopSO Admin Delivery State</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${path}/assets/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  		<style type="text/css">
		  		#inForm {
				  width: 100%;
				  border-collapse: collapse;
				}
				
				#inForm th, #inForm td {
				  border: 1px solid #dddddd;
				  padding: 8px;
				  text-align: left;
				}
				
				#inForm th {
				  background-color: #f2f2f2;
				}
				
				#inForm tr:nth-child(even) {
				  background-color: #f2f2f2;
				}
				
				#inForm tr:hover {
				  background-color: #dddddd;
				}
				
				#inForm input[type="text"] {
				  width: 100%;
				  box-sizing: border-box;
				}
				
				#inForm input[type="hidden"] {
				  display: none;
				}
				
				
  		</style>
  		<script src="${path}/assets/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
 	   //전체검색
 	    $(function(){
                $(document).on("click", "main .card-body table > tbody td", function(){
                    let tr = $(this).closest("tr");
                    $("#orderSeq").val(tr.find("td:eq(0)").text());
                    $("#userSeq").val(tr.find("td:eq(1)").text());
                    $("#furnitureSeq").val(tr.find("td:eq(2)").text());
                    $("#furnitureNumber").val(tr.find("td:eq(3)").text());
                    $("#furnitureName").val(tr.find("td:eq(4)").text());
                    $("#colorName").val(tr.find("td:eq(5)").text());
                    $("#sizeVal").val(tr.find("td:eq(6)").text());
                    $("#category").val(tr.find("td:eq(7)").text());
                    $("#quantity").val(tr.find("td:eq(8)").text());
                    $("#deliveryDate").val(tr.find("td:eq(9)").text());
                    $("#orderState").val(tr.find("td:eq(10)").text());
                    if($("#orderState").val() !== ""){
                        $("#update").val("배송 상태 변경하기");
                    }
                });
 		   
                $(document).on("click", "#update", function(){
                    if($("#userSeq").val() === ""){
                        return;
                    }
                    $("#inForm").attr("action", "${path}/front?key=delivery&methodName=update"); // 수정된 부분
                    $("#inForm").submit();
			 });
 			 
 			 
 	   };)//ready 함수 END
 	   /////////////////////////////////////////////////////////////
  		</script>
  		
    </head>
    <body class="sb-nav-fixed">
       <jsp:include page="../assets/common/admin/header.jsp"></jsp:include>
        <div id="layoutSidenav">
           <jsp:include page="../assets/common/admin/sideNav.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">배송 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${path}/front?key=delivery&methodName=selectAll">새로고침</a></li>
                            <li class="breadcrumb-item active">0: 취소, 1: 결제완료, 2: 배송중, 3: 배송 완료</li>
                        </ol>
                        <div>
                        	<h3>배송 상태 변경할 상품 선택</h3>
                            <form name="inForm" method="post" id="inForm" action="${path}/front?key=delivery&methodName=update"> <!-- 수정된 부분 -->
                                <table id="inForm">
                                    <tr>
                                        <th>orderSeq</th>
                                        <th>userSeq</th>
                                        <th>furnitureSeq</th>
                                        <th>furnitureNumber</th>
                                        <th>furnitureName</th>
                                        <th>colorName</th>
                                        <th>sizeVal</th>
                                        <th>category</th>
                                        <th>quantity</th>
                                        <th>deliveryDate</th>
                                        <th>orderState</th>
                                    </tr>
                                    <tr>
                                        <td><input type="text" id="orderSeq" name="orderSeq"></td>
                                        <td><input type="text" id="userSeq" name="userSeq"></td>
                                        <td><input type="text" id="furnitureSeq" name="furnitureSeq"></td>
                                        <td><input type="text" id="furnitureNumber" name="furnitureNumber"></td>
                                        <td><input type="text" id="furnitureName" name="furnitureName"></td>
                                        <td><input type="text" id="colorName" name="colorName"></td>
                                        <td><input type="text" id="sizeVal" name="sizeVal"></td>
                                        <td><input type="text" id="category" name="category"></td>
                                        <td><input type="text" id="quantity" name="quantity"></td>
                                        <td><input type="text" id="deliveryDate" name="deliveryDate"></td>
                                        <td><input type="text" id="orderState" name="orderState"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="11" align="center"> 
                                            <input type="button" value="배송 상태 변경하기" id="update">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                배송 관리
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>orderSeq</th>
                                            <th>userSeq</th>
                                            <th>furnitureSeq</th>
                                            <th>furnitureNumber</th>
                                            <th>furnitureName</th>
                                            <th>colorName</th>
                                            <th>sizeVal</th>
                                            <th>category</th>
                                            <th>quantity</th>
                                            <th>deliveryDate</th>
                                            <th>orderState</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="item">
                                            <tr>
                                                <td>${item.orderSeq}</td>
                                                <td>${item.userSeq}</td>
                                                <td>${item.furniture.furnitureSeq}</td>
                                                <td>${item.furniture.furnitureNumber}</td>
                                                <td>${item.furniture.furnitureName}</td>
                                                <td>${item.orderInfo.colorName}</td>
                                                <td>${item.orderInfo.sizeVal}</td>
                                                <td>${item.furniture.category}</td>
                                                <td>${item.orderInfo.quantity}</td>
                                                <td>${item.deliveryDate}</td>
                                                <td>${item.orderState}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../assets/common/admin/footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/assets/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${path}/assets/js/datatables-simple-demo.js"></script>
    </body>
</html>