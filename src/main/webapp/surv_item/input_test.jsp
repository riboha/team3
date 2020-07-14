<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>서울 여행</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">        
        $(document).ready (function () {                
            $('.btnAdd').click (function () {                                        
                $('.buttons').append (                        
                    '<input type="text" name="surv_item_ans_2" class="form-control" placeholder="항목을 입력하세요" style="width: 50%;"> <input type="button" class="btnRemove" value="삭제"><br>'                    
                ); // end append                            
                $('.btnRemove').on('click', function () { 
                    $(this).prev().remove (); // remove the textbox
                    //$(this).next ().remove (); // remove the <br>
                    $(this).remove (); // remove the button
                });
            }); // end click                                            
        }); // end ready        
    </script>    
    </head>    
    <body>        
        <div class="buttons">            
        <input type="text" name="surv_item_ans_1" class="form-control"
            placeholder="항목을 입력하세요" style='width: 50%;'> 
        <input type="button" class="btnAdd" value="추가"><br>        
        </div>    
    </body>
</html>






'<input type="text" name="surv_item_ans_2" class="form=control" placeholder="항목을 입력하세요." required="required" style="width: 50%;"> <input type="button" class="btnRemove" value="삭제"><br>'