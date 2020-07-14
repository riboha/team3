
<script>
$(document).ready(function() {
                    $('#uploadModalBtn').on('click', function() {
                        $('#uploadModal').modal();
                    });
                    var storedFiles = [];
                    //$('.cvf_order').hide();
                    // Apply sort function  
                    function cvf_reload_order() {
                        var order = $('.cvf_uploaded_files').sortable('toArray', {
                            attribute: 'item'
                        });
                        $('.cvf_hidden_field').val(order);
                    }

                    function cvf_add_order() {
                        $('.cvf_uploaded_files li').each(function(n) {
                            $(this).attr('item', n);
                        });
                    }
                    
                    $(function() {
                        $('.cvf_uploaded_files').sortable({
                            cursor: 'move',
                            placeholder: 'highlight',
                            start: function(event, ui) {
                                ui.item.toggleClass('highlight');
                            },
                            stop: function(event, ui) {
                                ui.item.toggleClass('highlight');
                            },
                            update: function() {
                                cvf_reload_order();
                            },
                            create: function() {
                                var list = this;
                                resize = function() {
                                    $(list).css('height', 'auto');
                                    $(list).height($(list).height());
                                };
                            }
                        });
                        $('.cvf_uploaded_files').disableSelection();
                    });
                    
                    $('body').on('change', '.user_picked_files', function() {
                        var files = this.files;
                        var i = 0;
                        for (i = 0; i < files.length; i++) {
                            var readImg = new FileReader();
                            var file = files[i];
                            if (file.type.match('image.*')) {
                                storedFiles.push(file);
                                readImg.onload = (function(file) {
                                    return function(e) {
                                        $('.cvf_uploaded_files').append(
                                            "<li file = '" + file.name + "'>" + 
                                            "<img class = 'img-thumb' src = '" + e.target.result + "' />" + 
                                            "<a href = '#' class = 'cvf_delete_image' title = 'Cancel'>" + 
                                            "<img class = 'delete-btn' src = '${pageContext.request.contextPath}/resources/images/delete-btn.png' /></a>" + 
                                            "<p>" + file.name + "</p></li>");
                                    };
                                })(file);
                                readImg.readAsDataURL(file);
                            } else {
                                alert('the file ' + file.name + ' is not an image');
                                location.reload();
                            }
                            if (files.length === (i + 1)) {
                                setTimeout(function() {
                                    cvf_add_order();
                                }, 1000);
                            }
                        }
                    });
                    
                    
                    // Delete Image from Queue
                    $('body').on('click', 'a.cvf_delete_image', function(e) {
                        e.preventDefault();
                        $(this).parent().remove('');
                        var file = $(this).parent().attr('file');
                        for (var i = 0; i < storedFiles.length; i++) {
                            if (storedFiles[i].name == file) {
                                storedFiles.splice(i, 1);
                                break;
                            }
                        }
                        //cvf_reload_order();
                    });
                    
                    
                    // AJAX Upload
                    $('body').on('click', '.cvf_upload_btn', function(e) {
                        e.preventDefault();
                        cvf_reload_order();
                        //$(".cvf_uploaded_files").html('<p><img src = "loading.gif" class = "loader" /></p>');
                        var formdata = $('#uploadForm')[0];
                        var data = new FormData(formdata);
                        var items_array = $('.cvf_hidden_field').val();
                        var items = items_array.split(',');
                        for (var i in items) {
                            var item_number = items[i];
                            data.append('files', storedFiles[item_number]);
                            data.append('index', item_number);
                        }
                        $.ajax({
                            url: '${pageContext.request.contextPath}/upload_test',
                            type: 'POST',
                            contentType: false,
                            data: data,
                            processData: false,
                            cache: false,
                            success: function(result) {
                                //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                                //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                                //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                                if (result === -1) {
                                    alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                                    // 이후 동작 ...
                                } else if (result === -2) {
                                    alert('파일이 10MB를 초과하였습니다.');
                                    // 이후 동작 ...
                                } else {
                                    alert('이미지 업로드 성공');
                                    location.reload();
                                    // 이후 동작 ...
                                }
                            }
                        });
                    });
                    
                    </script>