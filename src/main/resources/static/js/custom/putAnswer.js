/**
 * Created by Administrator on 2017/1/7.
 */
$(function () {
    var currentPath = window.location.pathname;   //    /questions/question/{id}
    var questionId = currentPath.substr(20);

    var userId = $("#user_id").val();
    var userName = $("#user_name").val();

    var $popModal = $("#popModal");

    // 回答问题，先清除模态框中输入框的内容
    $(document).on("click", ".btn-answer", function(){
        $("#answerModal textarea").val("");
    });

    // 提交回答
    $(document).on("click", ".btn-submit-answer", function(){
        var $textarea = $(this).parents(".modal-content").find("textarea").eq(0);
        var answerContent = $textarea.val();
        var $this = $(this);
        if(checkEmpty($textarea)){
            alert("请输入你的回答！");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/comments/comment",
            contentType: "application/json",
            data: JSON.stringify({
                question: {
                    id: questionId
                },
                authorId: userId,
                authorName: userName,
                summary: answerContent
            }),
            dataType: "json",
            success: function (data) {
                // 关闭模态框
                $this.parents(".modal-content").find(".close").click();
                $popModal.find(".modal-body").html("回答成功");
                $popModal.modal("show");
            }
        });
    });

    $popModal.find(".modal-footer button").click(function () {
        $popModal.find(".close").click();
    });
});


// 检查是否为空
function checkEmpty(target) {
    var value = target.val().replace(/\s+/g,"");  /*消除字符串所有空格*/
    if(value == ""){
        return true;
    }else{
        return false;
    }
}
