<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>

	<header>
		<!-- Thanh topbar -->
		<div class="container-fluid">

			<!-- Thanh tiêu để trên cùng dành cho màn hình trung bình và hẹp -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-ms-1">
							<span id="logo">Logo</span>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-ms-4">
							<form action="Search" method="GET" class="search-bar clearfix" id="search-textbox">
								<input name="strSearch" type="text" id="Search" placeholder="Nhập tên sách..."></input>
								<span><button type="submit" ><i class="fa fa-search"></i></button></span>
							</form>
							<div id="zoom-btn"><i class="fa fa-search"></i></div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-6">
							<div class="icon-bar horizontal">
								<ul>
									<li>
										<div class="i-right dropdown">
											<i class="fa fa-user"></i>
											<div class="right-dropdown-content">
												<%
													HttpSession ses = request.getSession();
													Account user = (Account)ses.getAttribute("User");
													if (user == null){
														out.println("<ul>");
														out.println("<li><a href=\"login\">Đăng nhập</a>");
														out.println("<li><a class=\"signup-window\" href=\"#signup-box\">Đăng ký tài khoản</a>");
														out.println("</ul>");
													}
													else
													{
														out.println("<ul>");
														out.println("<li><a href=\"\">Thông tin tài khoản</a>");
														out.println("<li><a href=\"logout\">Đăng xuất</a>");
														out.println("</ul>");
													}
												%>
											</div>
										</div>
									</li>
									<li>
										<div class="top-cart cart-icon">
											<a href="ViewCart"><i class="fa fa-briefcase"></i></a>
											<div class="cart-count">
												<%
													int count = 0; 
													Cookie[] arg_Cookies = request.getCookies();
													if (arg_Cookies != null){
														for(int i=0; i<arg_Cookies.length; i++){
															Cookie cookie = arg_Cookies[i];
															if (arg_Cookies[i].getName().equalsIgnoreCase("countBook")){
																count = Integer.parseInt(cookie.getValue());
															}
														}
													}
													out.println("<span id=\"number\">" + count + "</span>");
												%>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Thanh menu -->
			<nav>
				<div class="container">
					<!-- Menu -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-ms-12">
							<div class="navbar" style="border:none">
								<ul class="nav nav-left">
									<li class="nav-item nav-item-lv1 active"><a class="nav-link"
										href="http://localhost:8080/Web_Ban_Sach">Trang chủ</a></li>
									<li class="nav-item nav-item-lv1"><a class="nav-link"
										href="Categories">Sách mới</a></li>
									<li class="nav-item nav-item-lv1"><a class="nav-link"
										href="Categories">Sách hot</a></li>
								</ul>
								<div class="nav nav-toggle">
									<button id="btn-toggle">
										<i class="fa fa-align-justify"></i>
									</button>
									<div class="toggle-content">
										<span class="toggle-item"><a
											href="http://localhost:8080/Web_Ban_Sach">Trang chủ</a></span> 
										<span class="toggle-item"><a
											href="Categories">Sách mới</a></span> 
										<span class="toggle-item"><a
											href="Categories">Sách hot</a></span> 
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav></header>
			<div class="signup-container" id="signup-box">
		<h1>Đăng ký</h1>
		<span class="img-close"><i id="size-icon" class="fa fa-close"></i></span>
		<form class="signup-content" action="#" method="POST">
			<div class="form-group">
				<label class="control-label" for="NameSignUp">Tên đăng nhập</label> <input
					type="text" name="NameSignUp" value="" placeholder="User name"
					maxlength="10" autocomplete="off" id="NameSignUp" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="UserSignUp">Tên người dùng</label>
				<input type="text" name="UserSignUp" value="" placeholder="Your name"
					maxlength="50" autocomplete="off" id="UserSignUp" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="Sex">Giới tính</label> <select
					class="form-control" name="Sex" id="Sex">
					<option>Nam</option>
					<option>Nữ</option>
				</select>
			</div>
			<div class="form-group">
				<label class="control-label" for="BirthDate">Ngày sinh</label> <input
					id="typedate" type="date" name="Date" value="" id="BirthDate" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="Address">Địa chỉ</label> <input
					type="text" name="Address" value="" placeholder="Address"
					maxlength="255" id="Address" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="Email">Email</label> <input
					type="email" name="Email" value="" placeholder="Email"
					maxlength="50" id="Email" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="PhoneNumber">Số điện thoại
					liên hệ</label> <input type="number" name="PhoneNumber" value=""
					placeholder=" Your phone number" maxlength="10" id="PhoneNumber" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="Password">Mật khẩu đăng
					nhập</label> <input type="password" name="Password" value=""
					placeholder=" Your password" id="Password" maxlength="50">
			</div>
			<div class="form-group">
				<label class="control-label" for="Confirmpassword">Xác nhận mật khẩu</label> <input type="password" name="Confirmassword" value=""
					placeholder=" Confirm your password" id="Confirmpassword" maxlength="50">
			</div>
			<div style="position:relative; width:100%; text-align:center">
				<button class="button submit-button" onclick="dangkytk()">Đăng
					ký</button>
			</div>
			</br>
		</form>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#btn-toggle").click(function(){
			var display = $("#btn-toggle").next().css("display");
			if (display == "none"){
				$("#btn-toggle").next().css({"display":"block", "height":"100%"});
			} else {
				$("#btn-toggle").next().css({"display":"none", "height":"0px"});
			}
		});
	});
	function dangkytk(){
		var TenDangNhap,TenNguoiDung,GioiTinh,NgaySinh,DiaChi,Email,SDT,MatKhau,XNMatKhau;
		TenDangNhap= $('#NameSignUp').val();
		MatKhau=$('#Password').val();
		TenNguoiDung=$('#UserSignUp').val();
		GioiTinh=$('#Sex').val();
		NgaySinh=$('#typedate').val(); 
		DiaChi=$('#Address').val();
		Email=$('#Email').val();
		SDT=$('#PhoneNumber').val();
		XNMatKhau=$('#Confirmpassword').val();
		if(confirmpass(MatKhau,XNMatKhau)==true)
			{
				$.post('SignUp',{
					TenDangNhap:TenDangNhap,
					TenNguoiDung:TenNguoiDung,
					GioiTinh:GioiTinh,
					NgaySinh:NgaySinh,
					DiaChi:DiaChi,
					Email:Email,
					SDT:SDT,
					MatKhau:MatKhau
				}, function(loadtrang){
					location.href="login";
				}				
				);
			}
	}
	function confirmpass(MatKhau,XNMatKhau)
	{
		return (MatKhau==XNMatKhau)
			
	}
</script>
</body>
</html>