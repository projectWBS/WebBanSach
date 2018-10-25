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
</head>
<body class="common-home">

	<!-- Phần header cho trang Web -->
	<%@ include file="comp/Header.jsp" %>

	<div class="container" id="content">
		<section>
			<div class="row khung">
				<div class="categories col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="title">
						<p>Danh mục sách</p>
					</div>
					<ul class="detail">
						<li class="item"><a href="">Sách giáo khoa</a></li>
						<li class="item"><a href="">Sách tham khảo</a></li>
						<li class="item"><a href="">Văn học trong nước</a></li>
						<li class="item"><a href="">Văn học nước ngoài</a></li>
					</ul>
				</div>
				<div class="carousel col-lg-8 col-md-8 col-sm-8 col-xs-12">
					<ul class="detail">
						<li><img alt="banner-001" src="image/banner-01.jpg">
					</ul>
					<div class="btn">
						<div class="prev"><i class="fa fa-angle-left"></i></div>
						<div class="next"><i class="fa fa-angle-right"></i></div>
					</div>
				</div>
			</div>
		</section>
		<article>
			<div class="bookshelf">
				<div class="row content">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="title">Sách bán chạy</div>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
						<div class="view-detail">
							<a href="">Xem chi tiết >></a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="book" id="s00001">
							<img alt="s00001" src="lib/image/s00001.jpg">
							<div class="info-book">
								<div class="title">Sách số 1</div>
								<div class="price">Giá: 20.000đ</div>
							</div>
							<div class="options">
								<div class="view-detail">
									<i class="fa fa-info-circle"></i>
									<div class="i-content">
										<p>Xem chi tiết</p>
									</div>
								</div>
								<div class="buy">
									<i class="fa fa-cart-plus"></i>
									<div class="i-content">
										<p>Cho vào giỏ hàng</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="book" id="s00002">
							<img alt="s00002" src="lib/image/s00002.jpg">
							<div class="info-book">
								<div class="title">Sách số 2</div>
								<div class="price">Giá: 50.000đ</div>
							</div>
							<div class="options">
								<div class="view-detail">
									<i class="fa fa-info-circle"></i>
									<div class="i-content">
										<p>Xem chi tiết</p>
									</div>
								</div>
								<div class="buy">
									<i class="fa fa-cart-plus"></i>
									<div class="i-content">
										<p>Cho vào giỏ hàng</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="book" id="s00003">
							<img alt="s00003" src="lib/image/s00003.jpg">
							<div class="info-book">
								<div class="title">Sách số 3</div>
								<div class="price">Giá: 35.000đ</div>
							</div>
							<div class="options">
								<div class="view-detail">
									<i class="fa fa-info-circle"></i>
									<div class="i-content">
										<p>Xem chi tiết</p>
									</div>
								</div>
								<div class="buy">
									<i class="fa fa-cart-plus"></i>
									<div class="i-content">
										<p>Cho vào giỏ hàng</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="book" id="s00004">
								<img alt="s00004" src="lib/image/s00004.jpg">
							<div class="info-book">
								<div class="title">Sách số 4</div>
								<div class="price">Giá: 60.000đ</div>
							</div>
							<div class="options">
								<div class="view-detail">
									<i class="fa fa-info-circle"></i>
									<div class="i-content">
										<p>Xem chi tiết</p>
									</div>
								</div>
								<div class="buy">
									<i class="fa fa-cart-plus"></i>
									<div class="i-content">
										<p>Cho vào giỏ hàng</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="book">
							<img alt="s00005" src="lib/image/s00005.jpg">
							<div class="info-book">
								<div class="title">Sách số 5</div>
								<div class="price">Giá: 45.000đ</div>
							</div>
							<div class="options">
								<div class="view-detail">
									<i class="fa fa-info-circle"></i>
									<div class="i-content">
										<p>Xem chi tiết</p>
									</div>
								</div>
								<div class="buy">
									<i class="fa fa-cart-plus"></i>
									<div class="i-content">
										<p>Cho vào giỏ hàng</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="book" id="s00006">
							<img alt="s00006" src="lib/image/s00006.jpg">
							<div class="info-book">
								<div class="title">Sách số 6</div>
								<div class="price">Giá: 25.000đ</div>
							</div>
							<div class="options">
								<div class="view-detail">
									<i class="fa fa-info-circle"></i>
									<div class="i-content">
										<p>Xem chi tiết</p>
									</div>
								</div>
								<div class="buy">
									<i class="fa fa-cart-plus"></i>
									<div class="i-content">
										<p>Cho vào giỏ hàng</p>
									</div>
								</div>
							</div>
						</div>
					</div>
 				</div>
			</div>
		</article>
	</div>

	<!-- Phần footer cho trang Web -->
	<%@ include file="comp/Footer.jsp" %>
</body>
</html>