/**
 * Created by pc on 2017/1/1.
 */
$(document).ready(function(){
    $("#add_question").click(function(){
        var $questionTitle = $(this).parents(".modal-content").find("textarea").eq(0);
        var $questionDesc = $(this).parents(".modal-content").find("textarea").eq(1);
        if(checkEmpty($questionTitle)){
            alert("请输入你的问题！");
            return false;
        }else if(checkEmpty($questionDesc)){
            alert("请输入你的问题描述！");
            return false;
        }


        var authorId=$("#user_id").val();
        var authorName = $("#user_name").val();
        var title = $("#q_title").val();
        var content=$("#q_content").val();

        $.ajax({
            url:"/questions/question",
            type:"POST",
            contentType:"application/json",
            data:JSON.stringify({
                authorId:authorId,
                authorName:authorName,
                title:title,
                summary:content
            }),
            dataType:"json",
            success:function(data){
                console.log(JSON.stringify(data));
            }
        })
        // 关闭模态框
        $(this).parents(".modal-content").find(".close").click();
    });
});