$(function(){
	// 性别修改
	var $gender = $(".info-item.gender");
	var $change = $gender.find(".change");
	var $saveChange = $gender.find(".saveChange");
	var $val = $gender.find(".value");

	$change.click(function(){
		var newG = $val.html() == "男" ? "女" : "男";
		$val.html(newG);
		$saveChange.removeClass("hide");
	});
	$saveChange.click(function(){
		$.ajax({ 
            type: "POST",   
            url: "",
            data: {
                userGender: $val.html()
            },
            dataType: "json",
            success: function(data){
            	alert("性别修改成功！");   
                return true;
            },
            error: function(jqXHR){    // post请求失败
                alert("发生错误：" + jqXHR.status);
            }   
        });
        $(this).addClass("hide");
	});

	// 修改密码
    // 清空模态框的输入框
    $(document).on("click", ".btn-change-password", function(){
		$("#changePasswordModal input").val("");
		$("#changePasswordModal label.error").css("display", "none");
	});
	// jquery.validate插件进行表单验证
    // 自定义验证规则  function (value, element, params)
	jQuery.validator.addMethod("chrnum", function(value, element) {
        var chrnum = /^([a-zA-Z0-9]+)$/;
        return this.optional(element) || (chrnum.test(value));
    }, "只能输入数字和字母(字符A-Z, a-z, 0-9)");
    $("#passwordForm").validate({
        rules: {
            oldpass: "required",
            newpass: {
                required: true,
                minlength: 5,
                chrnum: true
            },
            againpass: {
                required: true,
                equalTo: "#newpass"
            }
        },
        messages: {
            oldpass: "请输入您的原密码",
            newpass: {
                required: "请设置您的新密码",
                minlength: "密码长度不能小于5个字母"
            },
            againpass: {
                required: "请再次输入您的新密码",
                equalTo: "两次密码输入不一致"
            }
        },
        // 表单验证成功后
        submitHandler: function () {
        	$.ajax({ 
	            type: "POST",   
	            url: "",
	            data: {
	                oldPass: $("#oldpass").val(),
	                newPass: $("#newpass").val()
	            },
	            dataType: "json",
	            success: function(data){   
	            	alert("密码修改成功！");
	            	$("#changePasswordModal").find(".close").click(); // 修改成功后关闭模态框
	                return true;
	            },
	            error: function(jqXHR){    // post请求失败
	                alert("发生错误：" + jqXHR.status);
	            }   
	        });
        }
    });    
});