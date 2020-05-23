$(function() {
	$('#log-out').click(function() {
		// 清除session
		$.ajax({
			url : "/mall/local/logout",
			type : "post",
			async : false,
			cache : false,
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					window.location.href = "/mall/local/clogin";
					return false;
				}
			},
			error : function(data, error) {
				alert(error);
			}
		});
	});
});