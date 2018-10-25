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
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<form action="" class="search-bar clearfix">
								<input type="text" id="search" placeholder="Search..."></input>
								<span><i class="fa fa-search"></i></span>
							</form>
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
							<div class="icon-bar">
								<ul>
									<li>
										<div class="i-right dropdown">
											<i class="fa fa-user"></i>
											<div class="right-dropdown-content">
												<%
													HttpSession ses = request.getSession();
													String user = (String)ses.getAttribute("User");
													if (user == null){
														out.println("<ul>");
														out.println("<li><a href=\"login\">Đăng nhập</a>");
														out.println("<li><a href=\"http://localhost:8080/Web_Ban_Sach/SignUp.jsp\">Đăng ký tài khoản</a>");
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
											<i class="fa fa-briefcase"></i>
											<div class="cart-count">
												<span>2</span>
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
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="navbar">
								<div class="navbar-brand">Logo</div>
								<ul class="nav nav-left">
									<li class="nav-item nav-item-lv1"><a class="nav-link"
										href="http://localhost:8080/Web_Ban_Sach">Trang chủ</a></li>
									<li class="nav-item nav-item-lv1"><a class="nav-link"
										href="#">Giới thiệu</a></li>
								</ul>
								<div class="nav nav-toggle">
									<button>
										<i class="fa fa-align-justify"></i>
									</button>
									<div class="toggle-content">
										<span class="toggle-item"><a
											href="http://localhost:8080/Web_Ban_Sach">Trang chủ</a></span> 
										<span class="toggle-item"><a
											href="http://localhost:8080/Web_Ban_Sach">Giới thiệu</a></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav></header>
</body>
</html>