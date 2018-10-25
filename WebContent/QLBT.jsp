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
<script type="text/javascript" src="lib/js/vu.js"></script>
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
      <h4> Chức năng quản lý</h4>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="#section1">Home</a></li>
        <li class="active"><a href="#section2">Quản lý bản tin</a></li>
        <li><a href="#section3"> Quản lý thu chi</a></li>
        <li><a href="#section3"> Quản lý đơn hàng</a></li>
        <li><a href="#section3"> Quản lý kho sách</a></li>
        <li><a href="#section3"> Quản lý khách hàng</a></li>
      </ul>
    </div>

    <div class="col-sm-10">
      <h4><small>Quản lý bản tin</small></h4>
      <hr>

      	<div id="my-carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#my-carousel" data-slide-to="0" class=""></li>
                <li data-target="#my-carousel" data-slide-to="1" class=""></li>
                <li data-target="#my-carousel" data-slide-to="2" class="active"></li>
            </ol>
            <div class="carousel-inner" ">
          <div class=" item ">
            <img src=" 1.jpg ">
            <div class=" container ">
              <div class=" carousel-caption d-none d-md-block ">
                <h1>Book</h1>
                <p>Vé Máy Bay trong tầm tay</p>
              </div>
            </div>
          </div>
          <div class=" item ">
            <img src=" 4.jpg ">
            <div class=" container ">
              <div class=" carousel-caption d-none d-md-block ">
                <h1>Book</h1>
                <p>Bay ngay hôm nay nhận ngay quà khủng</p>
              </div>
            </div>
          </div>
          <div class=" item active ">
            <img src=" 5.jpg " ">
                <div class="container">
                    <div class="carousel-caption d-none d-md-block">
                        <h1>Book</h1>
                        <p>Dịch vụ trong tầm tay</p>
                    </div>
                </div>
            </div>
        </div>
        <a class="left carousel-control" href="#my-carousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#my-carousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
      <hr>
      <h3 style="text-align: center; color: black;">Thêm tin</h3>
      <hr>
      <div class="txtThemTin">
      	<input type="text" class="form-control" size="60" placeholder="Title" required>
      	<input type="text" class="form-control" size="60" placeholder="Image URL" required>
      	<i style="color:red; text-align: center" >
      		(Nên chọn ảnh có kích thước: px x px)
      	</i> 
      </div>
      <div class="btnThemTin">
      	<div class="col-sm-6">
      		<button type="button" class="btn btn-danger" id="btnhuytt">Hủy</button>
      	</div>
      	<div class="col-sm-6">
      		<button type="button" class="btn btn-primary" id="btnthemtt">Thêm</button>
      	</div>
      	<br>			
      </div>
      <hr>
      <h3 style="text-align: center; color: black;">Tin đang hoạt động</h3>
      <hr>
      <div class="tinhethong" style="background-image: url(1.jpg);">
      	<div class="tininfo">
      		<div class="container">
      			<div class="intro-text">
      				<h3>BOOK!</h3>
      				<p>It's Nice To Meet You</p>
      				<button onclick="myFunction()" class="btn" id="xoabt">Xoá</button>
      				<button class="btn" ">Sửa</button>
      			</div>
      		</div>
      	</div>
      </div>
      <br>
      <div class="tinhethong" style="background-image: url(4.jpg);">
      	<div class="tininfo">
      		<div class="container">
      			<div class="intro-text">
      				<h3>BOOK!</h3>
      				<p>It's Nice To Meet You</p>
      				<button class="btn"">Xoá</button>
      				<button class="btn" ">Sửa</button>
      			</div>
      		</div>
      	</div>
      </div>
      <br>
      <div class="tinhethong" style="background-image: url(5.jpg);">
      	<div class="tininfo">
      		<div class="container">
      			<div class="intro-text">
      				<h3>BOOK!</h3>
      				<p>It's Nice To Meet You</p>
      				<button class="btn"">Xoá</button>
      				<button class="btn" ">Sửa</button>
      			</div>
      		</div>
      	</div>
      </div>


  </div>

      <br>
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