<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="../lib/css/stylesheet.css"
	data-minify="1" />
<link rel="stylesheet" type="text/css" href="../lib/css/sheet.css">
<link rel="stylesheet" type="text/css" href="../lib/css/style.css">
<link rel="stylesheet" type="text/css" href="../lib/css/BEM_Style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="../lib/js/jquery-3.3.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../lib/js/vu.js"></script>

</head>
<body>

	<!-- Phần header cho trang Web -->
	<%@ include file="../comp/Header.jsp"%>

	<div class="container-fluid" id="content">
		<div class="row" style="background-color: #eeeeee;">
			<div class="categories col-md-3 col-sm-12">
				<div class="title">
					<p>Chức năng quản lý</p>
				</div>
				<ul class="detail">
					<li class="item"><a href="../Manager/BangTin">Quản lý bảng
							tin</a></li>
					<li class="item"><a href="../Manager/ThuChi">Quản lý thu
							chi</a></li>
					<li class="item"><a href="../Manager/DonHang">Quản lý đơn
							hàng</a></li>
					<li class="item"><a href="../Manager/KhoSach">Quản lý kho
							sách</a></li>
					<li class="item active"><a href="../Manager/KhachHang">Quản
							lý khách hàng</a></li>
				</ul>
			</div>

			<div class="col-md-9 col-sm-12"">
				<h3 style="text-align: center; border-bottom: 1px groove; padding-bottom: 0.25em">Thông tin chi tiết khách hàng</h3>
				<%
					Object object = request.getAttribute("Account");
					Account account = null;
					if (object != null && object instanceof Account){
						account = (Account)object;
					}
				%>
				<div class="row">
					<div class="col-sm-7 col-xs-12">
						<ul id="Info">
							<li class="Info__Item">
								<span class="Info__Item__Title">Tên khách hàng</span>
								<% 
									if (account != null) 
										out.println("<span class=\"Info__Item__Content\">"+ account.getTenTaiKhoan() +"</span>"); 
								%>
							</li>
						
							<li class="Info__Item">
								<span class="Info__Item__Title">Giới tính</span>
								<% 
									if (account != null) 
										out.println("<span class=\"Info__Item__Content\">"+ account.getGioiTinh() +"</span>"); 
								%>
							</li>
						
							<li class="Info__Item">
								<span class="Info__Item__Title">Ngày sinh</span>
								<% 
									if (account != null) 
										out.println("<span class=\"Info__Item__Content\">"+ account.getNgaySinh() +"</span>"); 
								%>
							</li>
						</ul>
					</div>
					<div class="col-sm-5 col-xs-12">
						<ul id="Info">
							<li class="Info__Item">
								<span class="Info__Item__Title">Địa chỉ</span>
								<% 
									if (account != null) 
										out.println("<span class=\"Info__Item__Content\">"+ account.getDiaChi() +"</span>"); 
								%>
							</li>
							
							<li class="Info__Item">
								<span class="Info__Item__Title">Liên hệ</span>
								<% 
									if (account != null) 
										out.println("<span class=\"Info__Item__Content\">"+ account.getSdt() +"</span>"); 
								%>
							</li>
							
							<li class="Info__Item">
								<span class="Info__Item__Title">Email</span>
								<% 
									if (account != null) 
										out.println("<span class=\"Info__Item__Content\">"+ account.getEmail() +"</span>"); 
								%>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Phần footer cho trang Web -->
	<%@ include file="../comp/Footer.jsp"%>
</body>
</html>