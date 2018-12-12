<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<footer class="footer">
		<div class="content">
			<div class="site-footer">
				<div class="copyright clearfix">
					<div class="container">
						<div class="inner clearfix">
							<div class="row">
								<div class="col-md-12 text-center text-lg-left">
									<span>&copy; Copyright 2018
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script>
		$(document).ready(function() {
			$('a.signup-window').click(function() {
				//lấy giá trị thuộc tính href - chính là phần tử "#signup-box"
				var signupBox = $(this).attr('href');
				//cho hiện hộp đăng nhập trong 300ms
				$(signupBox).fadeIn(400);
				// thêm phần tử id="over" vào sau body
				$('body').append('<div id="over">');
				$('#over').fadeIn(400);
				return false;
			});
			// khi click đóng hộp thoại
			$(document).on('click', "span.img-close, #over", function() {
				$('#over, .signup-container').fadeOut(200, function() {
					$('#over').remove();
				});
				return false;
			});
		});

		function addCart() {
			var url = 'ViewCart?action=add'
			var name = $('#username').val();
			var address = $('#address').val();
			var phone = $('#phone').val();

			$.post(url, {
				name : name,
				address : address,
				phone : phone
			}, function() {
				alert('Đặt hàng thành công!');

				var url = location.href;
				deleteAllCookie();
				location.href = url.substring(0, url.lastIndexOf('/'));
			});
		}

		function buyNow(id, soluong) {
			addBookToCart(id, soluong);
			showPayDialog();
		}

		function showPayDialog() {
			//cho hiện hộp đăng nhập trong 300ms
			$('.dialog').fadeIn(300);

			// thêm phần tử id="over" vào sau body
			$('body').append('<div id="over">');
			$('#over').fadeIn(300);
		}

		function addBookToCart(id, soluong) {
			var count = getCookie("countBook");
			if (count.length == 0)
				count = 1;
			else
				count++;

			setCookie("book" + count, "id:" + id + "-count:" + soluong); //Thêm sách đã mua vào cookie
			setCookie("countBook", count);
			$(".cart-count").load(document.URL + " #number");
			$("#countInput").load(document.URL + " #count");
		}

		//Goto url
		function gotoPage(url) {
			document.location.href = url;
		}

		//Use in ViewBook.jsp
		function getNumberBuy() {
			var inputNumber = document.getElementById("count");
			return inputNumber.value;
		}

		//Use in ViewBook.jsp
		function zoomImage(mini_image, zoom_image, name) {
			var url = "url" + "(lib/image/" + name + ")";
			var image = document.getElementById(zoom_image);
			image.style.content = url; //Thay đổi đường dẫn của zoom-image 

			/*Thay đổi active image*/
			var oldActiveImage = document
					.getElementsByClassName("mini-image active")[0];
			oldActiveImage.className = "mini-image"; //Xóa trạng thái active hình hiện tại
			mouseOutImage(oldActiveImage);//Chỉnh sửa thuộc tính cho hình
			mini_image.className = "mini-image active"; //Kích hoạt trạng thía active mới
		}

		//Use in ViewBook.jsp
		function mouseHoverImage(img) {
			if (img.className == "mini-image") {
				img.style.opacity = 1.0;
				img.children[0].border = "1px solid gray";
			}
		}

		//Use in ViewBook.jsp
		function mouseOutImage(img) {
			if (img.className == "mini-image") {
				img.style.opacity = 0.75;
				img.children[0].border = "none";
			}
		}
		//
		function sendSearch() {
			var temp = document.getElementById("Search").value;
			window.location.href = "Search?strSearch=" + temp;
		}
	</script>
</body>
</html>