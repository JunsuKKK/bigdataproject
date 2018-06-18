function enter() {
	if (window.event.keyCode == 13) {
		document.getElementById("keyword_input").value = "";
	}
}
function citysubmit(){
	var city= $.trim($("#city").val());
	
	$.ajax({
	    type : 'POST',
	    url : 'graph',
	    dataType : 'json',
	    data : {
	    	"data":city
	    },
	    success : function(data){
	    },
	}); 
	
}
/*
 * function hrefupdate() { $("#abc").attr("href", "http://www.google.com/");
 * alert("test"); }
 */
/*
function sc(){
	$.ajax({
		url : "sessionchk",
		type : "POST",
		data : {
			"session" : "chk"
		},
		success : function(data) {
			if (data != "") {
				var data = decodeURIComponent(data);
				var image = document.getElementById("img_" + data);
				var btn = document.getElementById(data);
				image.src = "resources/img/check.png";
				btn.disabled = false;
			} else {
				return;
			}
		},
		error : function(error) {
			alert(error.statusText);
		}
	});
}

function reload(){
	location.reload();
}
$(document).ready(function() {
	$(document).ready(function() {
		
		setInterval(reload, 5000);
	});
})
*/