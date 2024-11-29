var blog = {
    init: function () {
        blog.registerEvents();
    },
    registerEvents: function () {
        debugger;
        $('#btnCommentNew').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var blogid = btn.data('blogid');
            var userid = btn.data('userid');
            var commentmsg = document.getElementById('txtCommentNew');
            if (commentmsg.value == "") {

                bootbox.alert("Chưa nhập nội dung bình luận");
                return;
            }
            debugger;
            $.ajax({
                url: "/Blog/AddNewComment",
                data: {
                    blogid: blogid,
                    userid: userid,
                    parentid: 0,
                    commentmsg: commentmsg.value
                },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        commentmsg.value = "";
                        bootbox.alert({
                            message: "Bạn đã thêm bình luận thành công",
                            size: 'medium',
                            closeButton: false,
                        });
                        // Thay vì .load(), thêm bình luận mới một cách thủ công
                        $.get("/Blog/GetBlogComment?blogid=" + blogid, function (data) {
                            $("#div_allcomment").html(data);
                        });
                    }
                    else {
                        bootbox.alert("Thêm bình luận lỗi");
                    }
                }

            });
        });

        $('.abcdefghkj').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var blogid = btn.data('blogid');
            var userid = btn.data('userid');
            var parenid = btn.data('parentid');

            var commentmsg = btn.data('commentmsg');

            var commentmsgvalue = document.getElementById(commentmsg);


            if (commentmsgvalue.value == "") {

                bootbox.alert("Chưa nhập nội dung bình luận");
                return;
            }
            $.ajax({
                url: "/Blog/AddNewComment",
                data: {
                    blogid: blogid,
                    userid: userid,
                    parentid: parenid,
                    commentmsg: commentmsgvalue.value,
                },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        commentmsg.value = "";
                        bootbox.alert({
                            message: "Bạn đã thêm bình luận thành công",
                            size: 'medium',
                            closeButton: false
                        });
                        $("#div_allcomment").load("/Blog/GetBlogComment?blogid=" + blogid);
                    }
                    else {
                        bootbox.alert("Thêm bình luận lỗi");
                    }
                }
            });
        });


    }
}
blog.init();