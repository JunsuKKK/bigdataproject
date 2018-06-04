var sessionname=document.getElementById("sessionname").value;
var sessionemail=document.getElementById("sessionemail").value;

(function() {
	var reply, claerResizeScroll, conf, insertI, lol;

	conf = {
		cursorcolor : "#696c75",
		cursorwidth : "4px",
		cursorborder : "none"
	};

	lol = {
		cursorcolor : "#cdd2d6",
		cursorwidth : "4px",
		cursorborder : "none"
	};
	
	reply = "질문을 이해할 수 없습니다.";


	claerResizeScroll = function() {
		$("#texxt").val("");
		$(".messages").getNiceScroll(0).resize();
		return $(".messages").getNiceScroll(0).doScrollTop(999999, 999);
	};

	insertI = function() {
		var innerText, otvet;
		innerText = $.trim($("#texxt").val());
	
				$.ajax({
					url : "http://192.168.0.8:5000/api/message",
					type : "GET",
					data : {
						"msg":innerText
					},

					success : function(data) {
						reply=data;
						if (innerText !== "") {
							$(".messages")
									.append(
											"<li class=\"i\"><div class=\"head\"><span class=\"time\">"
													+ (new Date().getHours())
													+ ":"
													+ (new Date().getMinutes())
													+ " AM, Today</span><span class=\"name\"> "+sessionname+"["+sessionemail+"]</span></div><div class=\"message\">"
													+ innerText + "</div></li>");
							claerResizeScroll();
							return otvet = setInterval(
									function() {
										$(".messages")
												.append(
														"<li class=\"friend-with-a-SVAGina\"><div class=\"head\"><span class=\"name\">Servers Center</span><span class=\"time\">"
																+ (new Date().getHours())
																+ ":"
																+ (new Date().getMinutes())
																+ " AM, Today</span></div><div class=\"message\">"
																+ JSON.stringify(reply)
																+ "</div></li>");
										claerResizeScroll();
										return clearInterval(otvet);
									});
						}
					},
					error : function(error) {
						alert(error.statusText);
					}
				});
				return false;
	};

	$(document).ready(function() {
		$(".list-friends").niceScroll(conf);
		$(".messages").niceScroll(lol);
		$("#texxt").keypress(function(e) {
			if (e.keyCode === 13) {
				insertI();
				return false;
			}
		});
		return $(".send").click(function() {
			return insertI();
		});
	});

}).call(this);