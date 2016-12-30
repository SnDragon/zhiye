/**
 * Created by pc on 2016/12/30.
 */
var path="/zhiye";
$(document).ready(function(){
   $("#register").click(function(){
      var email=$("#email").val();
      var username=$("#username").val();
      var password1=$("#password").val();
      var password2=$("#password2").val();

      //加入一些判断
      console.log(email+" "+username+" "+password1+" "+password2);
       $.ajax({
           type:"POST",
           url:path+"/users/user",
           data:{
               email:email,
               username:username,
               password1:password1,
               password2:password2
           },
           dataType:"json",
           success:function(data){
               console.log(JSON.stringify(data));
               if(data.flag=="success"){
                   alert("注册成功");
               }else{
                   alert("注册失败，"+data.content)
               }
           }
       })
   });
});