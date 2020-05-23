$(function() {
	//绑定帐号的controller url
	var bindUrl = '/mall/local/register';
	// 从地址栏的URL里获取usertype
	// usertype=1则为前端展示系统,其余为店家管理系统
	var userType = getQueryString('usertype');
	$('#submit').click(function() {
		// 获取输入的帐号
		var userName = $('#userName').val();
		// 获取输入的密码
		var password = $('#password').val();

		var email = $('#email').val();

		var gender = $('#gender').val();//获取当前选中的值

		// 获取输入的验证码
		var verifyCodeActual = $('#j_captcha').val();
		var needVerify = false;
		if (!verifyCodeActual) {
			$.toast('请输入验证码！');
			return;
		}
		// 访问后台，绑定帐号
		$.ajax({
			url : bindUrl,
			async : false,
			cache : false,
			type : "post",
			dataType : 'json',
			data : {
				userName : userName,
				password : password,
				userType : userType,
				email : email,
				gender : gender,
				verifyCodeActual : verifyCodeActual
			},
			success : function(data) {
				if (data.success) {
					$.toast('注册成功！');
					if (userType == 1) {
						// 若用户在前端展示系统页面则自动退回到前端展示系统首页
						window.location.href = '/mall/frontend/index';
					} else {
						// 若用户是在店家管理系统页面则自动回退到店铺列表页中
						window.location.href = '/mall/shopadmin/shoplist';
					}

				} else {
					$.toast('提交失败！' + data.errMsg);
					$('#captcha_img').click();
				}
			}
		});
	});
});