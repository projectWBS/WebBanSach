<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Yêu Sách Bookstore</title>

<link rel="stylesheet" type="text/css" href="lib/css/stylesheet.css" data-minify="1"/>
<link rel="stylesheet" type="text/css" href="lib/css/style.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="lib/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="lib/js/Cookies.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
	<%@ include file="/comp/Header.jsp" %>
	
	<div class="container-fluid" id="content">
		<section>
			<div clas="container-fluid">
				<div class="row khung">
					<div class="categories col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<div class="title">
							<p>Danh mục sách</p>
						</div>
						<ul class="detail">
							<li class="item"><a href="Bookshelf">Sách mới</a></li>
							<li class="item"><a href="Bookshelf">Sách bán chạy</a></li>
						</ul>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
						<div id="my-carousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#my-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#my-carousel" data-slide-to="1" class=""></li>
								<li data-target="#my-carousel" data-slide-to="2" class=""></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img src="image/banner-01.jpg"
										style="width: 100%; background-repeat: no-repeat;">
								</div>
								<div class="item">
									<img src="image/banner-02.jpg"
										style="width: 100%; background-repeat: no-repeat;">
								</div>
								<div class="item">
									<img src="image/banner-03.jpg"
										style="width: 100%; background-repeat: no-repeat;">
								</div>

								<a class="left carousel-control" href="#my-carousel"
									data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span></a> <a
									class="right carousel-control" href="#my-carousel"
									data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<article>
			<div class="row" style="margin:10px 0px;">
				<div class="col-sm-12">
					<ul class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
						<li itemprop="itemListElement"
							itemtype="http://schema.org/ListItem"><a itemprop="item"
							href="http://localhost:8080/Web_Ban_Sach/"> <span
								itemprop="name"> <i class="fa fa-home"></i> Trang chủ
							</span>
						</a> <span><i class="fa fa-angle-right"></i></span>
							<meta itemprop="position" content="1"></li>
						<li itemprop="itemListElement"
							itemtype="http://schema.org/ListItem"><a itemprop="item"
							href="#"> <strong itemprop="name">Sách mới</strong>
						</a>
							<meta itemprop="position" content="3"></li>
					</ul>
				</div>
			</div>

			<div class="container bookshelf" style="margin-top:0px;">
				<div class="row descrip">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Sách mới</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row content">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00001">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right">
												<a href="ViewBook?id=s00001"><a href="ViewBook?id=s00001"><i class="fa fa-info-circle"></i></a></i></a>
												<div class="content content-right"><span>Thông tin chi tiết</span></div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right">
												<i class="fa fa-cart-plus"  onclick="addBookToCart('s00001', 1)"></i>
											</div>
											<div class="content content-right"><span>Cho vào giỏ hàng</span></div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00001"> <img alt="s00001"
								src="lib/image/s00001.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 1</div>
								<div class="price">Giá: 20.000đ</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00002">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right">
												<a href="ViewBook?id=s00002"><i class="fa fa-info-circle"></i></a></i>
												<div class="content content-right"><span>Thông tin chi tiết</span></div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right">
												<i class="fa fa-cart-plus"  onclick="addBookToCart('s00002', 1)"></i>
											</div>
											<div class="content content-right"><span>Cho vào giỏ hàng</span></div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00002"> <img alt="s00002"
								src="lib/image/s00002.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 2</div>
								<div class="price">Giá: 50.000đ</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00003">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right">
												<a href="ViewBook?id=s00003"><i class="fa fa-info-circle"></i></a></i>
												<div class="content content-right"><span>Thông tin chi tiết</span></div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right">
												<i class="fa fa-cart-plus"  onclick="addBookToCart('s00003', 1)"></i>
											</div>
											<div class="content content-right"><span>Cho vào giỏ hàng</span></div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00003"> <img alt="s00003"
								src="lib/image/s00003.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 3</div>
								<div class="price">Giá: 35.000đ</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00004">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right">
												<a href="ViewBook?id=s00004"><i class="fa fa-info-circle"></i></a></i>
												<div class="content content-right"><span>Thông tin chi tiết</span></div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right">
												<i class="fa fa-cart-plus"  onclick="addBookToCart('s00004', 1)"></i>
											</div>
											<div class="content content-right"><span>Cho vào giỏ hàng</span></div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00004"> <img alt="s00004"
								src="lib/image/s00004.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 4</div>
								<div class="price">Giá: 60.000đ</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right">
												<a href="ViewBook?id=s00005"><i class="fa fa-info-circle"></i></a></i>
												<div class="content content-right"><span>Thông tin chi tiết</span></div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right">
												<i class="fa fa-cart-plus"  onclick="addBookToCart('s00005', 1)"></i>
											</div>
											<div class="content content-right"><span>Cho vào giỏ hàng</span></div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00005"> <img alt="s00005"
								src="lib/image/s00005.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 5</div>
								<div class="price">Giá: 45.000đ</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
						<div class="book" id="s00006">
							<div class="icon-bar vertical">
								<ul>
									<li>
										<div class="button-modify">
											<div class="button-arc forest right">
												<a href="ViewBook?id=s00006"><i class="fa fa-info-circle"></i></a></i>
												<div class="content content-right"><span>Thông tin chi tiết</span></div>
											</div>
										</div>
									</li>
									<li>
										<div class="button-modify">
											<div class="button-arc cool right">
												<i class="fa fa-cart-plus" onclick="addBookToCart('s00006', 1)"></i>
											</div>
											<div class="content content-right"><span>Cho vào giỏ hàng</span></div>
										</div>
									</li>
								</ul>
							</div>
							<a href="ViewBook?id=s00006"> <img alt="s00006"
								src="lib/image/s00006.jpeg">
							</a>
							<div class="info-book">
								<div class="title">Sách số 6</div>
								<div class="price">Giá: 25.000đ</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</article>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="/comp/Footer.jsp" %>
</body>
</html>