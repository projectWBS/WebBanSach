
<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>

	<header>
		<!-- Thanh topbar -->
		<div class="container-fluid">

			<!-- Thanh tiêu để trên cùng dành cho màn hình trung bình và hẹp -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<%
							boolean isAdmin = false;
							if (request.getRequestURI().indexOf("Manager") != -1)
								isAdmin = true;
						%>
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-ms-1">
							<%
								if (isAdmin)
									out.println(
											"<a href=\"../Home\"><img alt=\"logo\" src=\"../image/logo.jpg\" style=\"width: 55px; margin-left: -20px;\"></img></a>");
								else
									out.println(
											"<a href=\"Home\"><img alt=\"logo\" src=\"image/logo.jpg\" style=\"width: 55px; margin-left: -20px;\"></img></a>");
							%>

						</div>
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 col-ms-4">
							<%
								if (isAdmin)
									out.println(
											"<form action=\"../Search\" method=\"GET\" class=\"search-bar clearfix\" id=\"search-textbox\">");
								else
									out.println(
											"<form action=\"Search\" method=\"GET\" class=\"search-bar clearfix\" id=\"search-textbox\">");
							%>
							<input name="strSearch" type="text" id="Search"
								placeholder="Nhập tên sách..."
								style="border: 1px solid #dcdcdc; border-radius: 0;"></input> <span><button
									type="submit">
									<i class="fa fa-search" style="margin-top: 0"></i>
								</button></span>
							<%
								out.println("</form>");
							%>
							<div id="zoom-btn">
								<i class="fa fa-search"></i>
							</div>
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
													Account user = (Account) ses.getAttribute("User");
													if (user == null) {
														out.println("<ul>");
														out.println("<li><a href=\"login\">Đăng nhập</a>");
														out.println("<li><a class=\"signup-window\" href=\"#signup-box\">Đăng ký tài khoản</a>");
														out.println("</ul>");
													} else {
														out.println("<ul>");
														if (isAdmin)
															out.println("<li><a href=\"Manager/BangTin\">Trang quản lý</a>");
														out.println("<li><a href=\"ViewInfo\">Thông tin tài khoản</a>");
														out.println("<li><a href=\"logout\">Đăng xuất</a>");
														out.println("</ul>");
													}
												%>
											</div>
										</div>
									</li>
									<li>
										<div class="top-cart cart-icon">
											<a href="ViewCart"><i class="fa fa-briefcase"
												style="color: #92929D"></i></a>
											<div class="cart-count">
												<%
													int count = 0;
													Cookie[] arg_Cookies = request.getCookies();
													if (arg_Cookies != null) {
														for (int i = 0; i < arg_Cookies.length; i++) {
															Cookie cookie = arg_Cookies[i];
															if (arg_Cookies[i].getName().equalsIgnoreCase("countBook")) {
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
			<nav style="background: #F7F7F7">
				<div class="container">
					<!-- Menu -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-ms-12">
							<div class="navbar" style="border: none;">
								<ul class="nav nav-left">
									
									<%
										if (!isAdmin) {
											out.println("<li class=\"nav-item nav-item-lv1 active\"><a class=\"nav-link\" href=\"Home\">Trang chủ</a></li>");
											out.println(
													"<li class=\"nav-item nav-item-lv1\"><a class=\"nav-link\" href=\"Categories?danhMuc=yeuthich\">Sách yêu thích</a></li>");
											out.println(
													"<li class=\"nav-item nav-item-lv1\"><a class=\"nav-link\" href=\"Categories?danhMuc=banchay\">Sách bán chạy</a></li>");
										} else {
											out.println("<li class=\"nav-item nav-item-lv1 active\"><a class=\"nav-link\" href=\"../Home\">Trang chủ</a></li>");
											out.println(
													"<li class=\"nav-item nav-item-lv1\"><a class=\"nav-link\" href=\"BangTin\">Bảng Tin</a></li>");
											out.println(
													"<li class=\"nav-item nav-item-lv1\"><a class=\"nav-link\" href=\"DonHang\">Đơn hàng</a></li>");
											out.println(
													"<li class=\"nav-item nav-item-lv1\"><a class=\"nav-link\" href=\"KhachHang\">Khách hàng</a></li>");
											out.println(
													"<li class=\"nav-item nav-item-lv1\"><a class=\"nav-link\" href=\"KhoSach\">Kho sách</a></li>");
										}
									%>
								</ul>
								<div class="nav nav-toggle">
									<button id="btn-toggle">
										<i class="fa fa-align-justify"></i>
									</button>
									<div class="toggle-content">
										<%
											if (!isAdmin) {
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println("onclick=\"gotoPage('Home')\"><a href=\"Home\">Trang chủ</a></span> ");
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println(
														"onclick=\"gotoPage('Categories?danhMuc=yeuthich')\"><a href=\"Categories?danhMuc=yeuthich\">Sách yêu thích</a></span>");
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println(
														"onclick=\"gotoPage('Categories?danhMuc=banchay')\"><a href=\"Categories?danhMuc=banchay\">Sách bán chạy</a></span>");
											} else {
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println("onclick=\"gotoPage('../Home')\"><a href=\"./Home\">Trang chủ</a></span> ");
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println("onclick=\"gotoPage('BangTin')\"><a href=\"BangTin\">Bảng tin</a></span>");
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println("onclick=\"gotoPage('DonHang')\"><a href=\"DonHang\">Đơn hàng</a></span>");
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println("onclick=\"gotoPage('KhachHang')\"><a href=\"KhachHang\">Khách hàng</a></span>");
												out.print("<span class=\"toggle-item\" style=\"cursor: pointer;\"");
												out.println("onclick=\"gotoPage('KhoSach')\"><a href=\"KhoSach\">Kho sách</a></span>");
											}
										%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>
	</header>
	<div class="signup-container" id="signup-box">
		<h1>Đăng ký</h1>
		<span class="img-close"><i id="size-icon" class="fa fa-close"></i></span>
		<form class="signup-content">
			<div class="form-group">
				<label class="control-label" for="NameSignUp">Tên đăng nhập</label>
				<input type="text" name="NameSignUp" value=""
					placeholder="User name" maxlength="10" autocomplete="off"
					id="NameSignUp" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="UserSignUp">Tên người dùng</label>
				<input type="text" name="UserSignUp" value=""
					placeholder="Your name" maxlength="50" autocomplete="off"
					id="UserSignUp" required>
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
					id="typedate" type="date" name="Date" value="" id="BirthDate"
					required>
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
					placeholder=" Your phone number" maxlength="10" id="PhoneNumber"
					required>
			</div>
			<div class="form-group">
				<label class="control-label" for="Password">Mật khẩu đăng
					nhập</label> <input type="password" name="Password" value=""
					placeholder=" Your password" id="Password" maxlength="50">
			</div>
			<div class="form-group">
				<label class="control-label" for="Confirmpassword">Xác nhận
					mật khẩu</label> <input type="password" name="Confirmassword" value=""
					placeholder=" Confirm your password" id="Confirmpassword"
					maxlength="50">
			</div>
			<div style="position: relative; width: 100%; text-align: center">
				<button class="button submit-button" onclick="dangkytk()">Đăng
					ký</button>
			</div>
			</br>
		</form>
	</div>
	
	
	<script type="text/javascript">
		function checkStrongPass() {
			var password=$.trim($("#Password").val());
			var numbercheck = scorePassword(password);
			if(numbercheck<70){
				alert("mat khau k manh");
				return 0;
			}
			else{
				return 1;
			}
			
			
			
		}
		function scorePassword(pass) {
		    var score = 0;
		    if (!pass)
		        return score;

		    // award every unique letter until 5 repetitions
		    var letters = new Object();
		    for (var i=0; i<pass.length; i++) {
		        letters[pass[i]] = (letters[pass[i]] || 0) + 1;
		        score += 5.0 / letters[pass[i]];
		    }

		    // bonus points for mixing it up
		    var variations = {
		        digits: /\d/.test(pass),
		        lower: /[a-z]/.test(pass),
		        upper: /[A-Z]/.test(pass),
		        nonWords: /\W/.test(pass),
		    }

		    variationCount = 0;
		    for (var check in variations) {
		        variationCount += (variations[check] == true) ? 1 : 0;
		    }
		    score += (variationCount - 1) * 10;

		    return parseInt(score);
		}
		
	</script>	
	
	
	
	
	<script type="text/javascript">
			$(document).ready(function(){
				
				var child=$(".nav.nav-left").children();
				$(child).removeClass("active");
				var url = location.href;
				
				if (url.indexOf("Categories") != -1){
					if (url.indexOf("Categories?danhMuc=yeuthich") != -1) child.eq(1).addClass("active");
					else if (url.indexOf("Categories?danhMuc=banchay") != -1) child.eq(2).addClass("active");
				} else if (url.indexOf("Manager") == -1) child.eq(0).addClass("active");
				if (url.indexOf("Manager") != -1){
					if (url.indexOf("BangTin") != -1) child.eq(1).addClass("active");
					else if (url.indexOf("DonHang") != -1) child.eq(2).addClass("active");
					else if (url.indexOf("KhachHang") != -1) child.eq(3).addClass("active");
					else if (url.indexOf("KhoSach") != -1 || url.indexOf("Sach") != -1) child.eq(4).addClass("active");
				} else child.eq(0).addClass("active");
				
				
				$("#btn-toggle").click(function(){
					var height = $("#btn-toggle").next().css("height");
					if (height == '0px'){
						$("#btn-toggle").next().animate({"height":"40%"}, 450);
					} else {
						$("#btn-toggle").next().animate({"height":"0px"}, 450);
					}
				});
			});
		
			$(document).on("mouseover", ".dropdown", function(){
				$(".dropdown .right-dropdown-content").css({"display":"block"});
				$(".dropdown .right-dropdown-content").animate({"opacity":"1.0"}, 100);
			});
			
			$(document).on("mouseleave", ".dropdown, .right-dropdown-content", function(){
				$(".dropdown .right-dropdown-content").animate({"opacity":"0"}, 100, function(){
					$(".dropdown .right-dropdown-content").css({"display":"none"});
				});
			});
			
			function dangkytk(){
				if(checkStrongPass()==1)
				{
					
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
								}, function(){
									$('.signup-container').fadeOut(100);	
								});
							}
					alert("thanhcodn");
				}
				
			}
			function confirmpass(MatKhau,XNMatKhau)
			{
				return (MatKhau==XNMatKhau)
					
			}
		</script>
</body>
</html>