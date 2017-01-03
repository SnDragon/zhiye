/**
 * Created by Administrator on 2017/1/1.
 */
$(document).ready(function(){
    var finish=false;
    if($(".feed-item").length < 5){
        if($(".feed-item").length == 0){
            $("#none-dynamic-ans").removeClass("hide");
        }
        $(".load-more").addClass("hide");
        finish = true;
    }
    $(window).scroll(function() {
        var ks_area = $(window).height();
        var wholeHeight = $(document).height();
        var scrollTop = $(window).scrollTop();

        if(ks_area + scrollTop >= wholeHeight){
            if(finish){
                return;
            }
            if(!this.page){
                this.page = 2;  // 若是第一次加载
            }else{
                this.page ++;   // 更新加载次数
            }
            var page = this.page;

            var $more = $(".more");
            var $loading = $(".loading");
            $more.addClass("hide");
            $loading.removeClass("hide");

            var userId = $("#user_id").val();
            $.ajax({
                type:"POST",
                url:"/questions/all",
                contentType:"application/json",
                data: {
                    uid: userId,
                    page: page
                },
                dataType: "json",
                success: function(data){
                    // 若已没有可加载的数据
                    if(data.length == 0){
                        $(".loading").addClass("hide");
                        finish = true;
                        return;
                    }
                    $.each(data, function(){
                        var str = '<div class="feed-item common-box" id="dynamic-ans-"' + this.id + '><div class="feed-item-inner"><div class="feed-main">';
                        // 区分是不是用户自己“回答”的，加上“删除”
                        if(this.authorId == userId) {
                            str += '<button class="delete del-answers commentBox-textButton" data-toggle="modal" data-target="#deleteModal">删除</button>';
                        }
                        str = str + '<div class="feed-source"><span class="author-link-line"><a href="users/u/'
                            + this.authorId + '" class="author-link">'
                            + this.authorName + '</a></span><span class="author-do">回答了问题</span></div><div class="feed-vote" title="赞一个">'
                            +  + '</div><h2 class="feed-title"><a href="questions/'
                            + this.id + '" class="question-link" target="_blank">'
                            + this.title + '</a></h2><div class="feed-content">';




                            //
                            // <div class="feed-summary">'
                            // + this.content + '...<span class="expand">显示全部</span></div><div class="feed-summary-whole clearfix hide">'
                            // + this.content + '<button type="button" class="btn pack-up">收起</button></div></div><div class="feed-meta"><span class="meta-item meta-answer"><span class="answer-count">'
                            // + this.numOfAnswers + '</span>个评论 </span></div></div></div></div>';




                            str=str+'<div class="dynamic-head"><h1 class="dynamic-title">'
                                +'<a href="'+$("#basePath").val()+'/poem/pid/'+this.poemId+'" class="poem-title">'+this.poemTitle
                                +'</a></h1><div class="dynamic-meta"><span class="dynamic-author">作者:<a target="_blank" href="'
                                +$("#basePath").val()+'/user/aid/'+this.userId+'">'+this.userName
                                +'</a></span><time id="time_'+this.poemId+'" class="dynamic-time">'+this.poemPublishTime
                                +'</time></div></div><div class="dynamic-content">';
                            if(this.poemRow.length<=5){
                                for(var i in this.poemRow){
                                    str+='<p>'+this.poemRow[i]+'</p>';
                                }
                            }else{
                                for(var i=0;i<5;i++){
                                    str+='<p>'+this.poemRow[i]+'</p>';
                                }
                                str+='<span class="expand">展开全文</span>';
                                for(var i=5;i<this.poemRow.length;i++){
                                    str+='<p class="hide">'+this.poemRow[i]+'</p>';
                                }
                                str+='<span class="pack-up hide">收起全文</span>';
                            }

                            str=str+'</div>';
                            if(this.poemImg){
                                str=str+'<div class="row"><div class="dynamic-img col-sm-7 col-xs-9">'
                                    +'<img src="'+$("#basePath").val()+'/img/poem/'+this.poemImg+'" alt="这也是一切" />'
                                    +'</div></div>';
                            }
                            str=str+'<div class="dynamic-action"><div class="row">'
                                +'<ul id="'+this.poemId+'"><li class="col-xs-3 keep collection ';
                            if(this.isCollected){
                                str+='orangeLi';
                            }else{
                                str+='grayLi';
                            }
                            str=str+'" ><span class="glyphicon glyphicon-heart-empty"></span><span>收藏</span></li>'
                                +'<li class="col-xs-3 share "><a href="#" data-toggle="modal" data-target="#myModal" class="';
                            if(this.userId==$("#userId").val()){
                                str+='btn disabled';
                            }
                            str=str+'"><span class="glyphicon glyphicon-share"></span><span class="share-number" id="share-span-'
                                +this.poemId+'">'+this.poemNumTransmit
                                +'</span></a></li><li class="col-xs-3 comment" >'
                                +'<span class="glyphicon glyphicon-comment"></span><span class="comment-number" id="comment-span-'
                                +this.poemId+'">'+this.poemNumComment+'</span></li><li class="col-xs-3 thumb support ';
                            if(this.isSupported){
                                str+='orangeLi';
                            }else{
                                str+='grayLi';
                            }
                            str=str+'"><span class="glyphicon glyphicon-thumbs-up"></span><span class="thumb-number">'
                                +this.poemNumSupport+'</span></li></ul></div></div>';
                            str=str+'<div class="comment-wrap"><div class="dynamic-comment"><div class="send-comment">'
                                +'<a class="head-icon" href="'+$("#basePath").val()+'/user/aid/'+this.userId
                                +'" target="_blank"><img src="'+$("#basePath").val()+'/img/user/'+$("#userIcon").val()+'" alt="进入我的个人中心" />'
                                +'</a><textarea name="comment" class="input-comment" rows="2"></textarea><br />'
                                +'<button class="btn-comment btn btn-default">评论</button>'
                                +'</div>'
                                +'<div class="more-comment"><span class="more-comment-span">加载更多</span>'
                                +'</div></div></div></article>';

                            $("#articleDiv").append(str);
                            $("#time_"+this.poemId).html(transferTime(this.poemPublishTime));

                    });

                    $loading.addClass("hide");
                    $more.removeClass("hide");
                }
            });
        }
    });

});