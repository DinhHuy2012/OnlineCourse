var user = {
    init: function () {
        user.registerEvents();
    },
    registerEvents: function () {

        $('.abclaice').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            debugger;

            var listid = btn.data("listid");
            var image = btn.data('image');
    
            var valueimage = document.getElementById(image);

          
            var valueimageurl = document.getElementById('e_image');
            if (valueimageurl.value == "") {
                valueimageurl.value = valueimage.value;
            }
            var ContributeModel = {
                id: listid,
                image: valueimageurl.value,
            }
            if (image.value == "" ) {
                bootbox.alert("Chưa nhập thông tin cần thiết")
                return;
            }
            $.ajax({
                url: "/User/UpdateAvatar",
                data: JSON.stringify(ContributeModel),
                contentType: 'application/json; charset=utf-8',
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        bootbox.alert({
                            message: "Cập nhật ảnh đại diện thành công !",
                            size: 'medium',
                            closeButton: false
                        });
                        image.value = "";
                        valueimageurl.value = "";                  
                        window.location.href = "/trang-chu";
                    }
                    else {
                        bootbox.alert(
                            {
                                message: "Cập nhật hình ảnh lỗi ",
                                closeButton: false
                            }
                        );
                    }
                }
            });
        });
 
    }
}
user.init();