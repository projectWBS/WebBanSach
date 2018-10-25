<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
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
			</nav>
		</header>
<br>
<br>
<br>
<br>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <h4>Chức năng quản lý</h4>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="#section1">Home</a></li>
        <li><a href="#section2">Quản lý bản tin</a></li>
        <li><a href="#section3">Quản lý thu chi</a></li>
        <li><a href="#section3">Quản lý đơn hàng</a></li>
        <li class="active"><a href="#section3">Quản lý kho sách</a></li>
        <li><a href="#section3">Quản lý khách hàng</a></li>
      </ul>
    </div>

    <div class="col-sm-10">

    	<ul class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
						<li itemprop="itemListElement" itemtype="http://schema.org/ListItem">
							<a itemprop="item" href="#"> 
								<span itemprop="name"> <i></i>Quản lý kho sách</span>
							</a> <span><i class="fa fa-angle-right"></i></span>
							<meta itemprop="position" content="1">
						</li>
						<li itemprop="itemListElement" itemtype="http://schema.org/ListItem">
							<a itemprop="item" href="#">
								<strong itemprop="name">Nhập sách</strong>
							</a> <meta itemprop="position" content="3">
						</li>
					</ul>

      <hr>
      
      <div class="NhapSach">
      	<!--Button-->
      	<div class="col-sm-4 aSM" id="aSMHuy">
      		<a href="#">Hủy</a>
		</div>
		<div class="col-sm-4 tuade">
			Nhập sách vào kho hàng
		</div>
		<div class="col-sm-4 aSM" id="aSMAccpt">
			<a href="#">Chấp nhận</a>
		</div>
		<br>
      </div>

      <div class="NhapSach">
      	
		<!--Khung thông tin-->

      	<div class="col-sm-3">
      	
      	<div class="NhapSachIMG">
      	
      	<h3>IMAGE</h3>

      	 <input type="file" accept="image/* ">
      </div>
      </div>
      <div class="col-sm-9">
      	<div class="NhapSachINFO">
      		<div class="fixLB">
      			<i class="fa fa-book" aria-hidden="true"></i>
				<label for="name">Tên Sách</label>
      			<input type="text" name="name" placeholder="VD: Sherlock Holmes" id="name">
      		</div>
      		
      		<br>
      		<div class="fixLB">
      			<i class="fa fa-book" aria-hidden="true"></i>
      			<label for="price">Giá Sách</label>
      			<input type="text" name="price" placeholder="VD: 220000" id="price">
      		</div>
      		
      		<br>
      		<div class="fixLB">
      			<i class="fa fa-book" aria-hidden="true"></i>
      			<label for="NXB">Nhà Xuất Bản</label>
      			<input type="text" name="NXB" placeholder="VD: Nhà xuất bản Văn Học" id="NXB">
      		</div>
      		
      		<br>
      		<div class="fixLB">
      			<i class="fa fa-book" aria-hidden="true"></i>
      			<label for="category">Thể loại</label>
      			<input type="text" name="category" placeholder="VD: Sherlock Holmes" id="category">
      		</div>
      		
      		<br>
      		<div class="fixLB">
      			<i class="fa fa-book" aria-hidden="true"></i>
      			<label for="author">Tác giả</label>
      			<input type="text" name="author" placeholder="VD: Sherlock Holmes" id="author">
      		</div>
      		
      		<br>		
      	</div>      	
      </div>
      
      <div class="figureNhapSach">
      	<i class="fa fa-book" aria-hidden="true"></i>
      	<label for="figure">Mô tả</label>
      	<textarea placeholder="Mô tả" id="figure" style="width:800px; height:228px">
      		VD: Đối với các độc giả yêu thích dòng văn trinh thám nói riêng cũng như những người yêu sách trên toàn thế giới nói chung thì không phải nói nhiều về sức hút của hai cái tên: nhà văn Conan Doyle và “đứa con tinh thần” của cả cuộc đời ông - Sherlock Holmes.

Nhân vật Sherlock Holmes từ lâu đã trở thành nguồn cảm hứng cho hàng trăm, hàng ngàn tác phẩm ở nhiều loại hình nghệ thuật khác: từ âm nhạc, ca kịch đến điện ảnh… Bộ sách Sherlock Holmes Toàn Tập (Trọn Bộ 3 Tập) một lần nữa mang đến cho người đọc cơ hội được nhìn ngắm, ngưỡng mộ và đánh giá nhân vật độc đáo của nhà văn tài năng Conan Doyle. Chân dung cuộc đời, sự nghiệp và nhân cách của Sherlock Holmes chưa bao giờ được tái hiện chân thực, đầy đủ và sống động đến thế...
      	</textarea>

      </div>
      	
      </div>
      	
      </div>
      
		<hr>
		

      <hr>
    </div>
  </div>
</div>

	

	<!-- Phần footer cho trang Web -->
	<footer class="footer">
		<div class="content">
			<div class="site-footer">
				<div class="copyright clearfix">
					<div class="container">
						<div class="inner clearfix">
							<div class="row">
								<div class="col-md-12 text-center text-lg-left">
									<span>&copy; Copyright 2018</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>