
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

//Use in ViewBook.jsp
function getUserRate() {
	var rate = 0, danhGia = document.getElementById("danhGia")
			.getElementsByTagName("i");
	for (var i = 0; i < danhGia.length; i++) {
		var color = danhGia[i].style.color;
		if (color == "gold")
			rate++;
		else
			break;
	}
	return rate;
}

function setUserRate(rate) {
	var danhGia = document.getElementById("danhGia").getElementsByTagName("i");
	var text = document.getElementById("danhGia").getElementsByTagName("span");
	var temp = rate;
	for (var i = 0; i < 5; i++) {
		if (temp > 0) {
			danhGia[i].style.color = "gold";
			temp--;
		} else {
			danhGia[i].style.color = "";
		}
	}
	text[0].innerText = "(" + rate + "/5 sao)";
}

function sendUserRate() {
	var rate = getUserRate();
	var url = window.location.href;
	$.post(url, {rate: rate}, function(){
		alert("Đã gửi đánh giá");
	});
}

function sendCommentOfUser(bool){
	var url = window.location.href;
	var tenTaiKhoan, noiDung, maSach, comment;
	
	maSach = (window.location.search).split("=")[1];
	comment = document.getElementsByClassName("comment__new")[0];
	noiDung = comment.getElementsByClassName("comment__new__content")[0].value;
	if (bool == false) tenTaiKhoan = comment.getElementsByClassName("comment__new__name")[0].value;
	$.post(url, {
		userName: tenTaiKhoan,
		noiDung: noiDung
	}, function(){
		reloadComment();
	});
}

function reloadComment(){
	$("#board_comment").load(window.location.href + " .comment")
}