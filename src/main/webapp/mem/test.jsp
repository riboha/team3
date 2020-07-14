<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" id="openBtn">Button</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">알림</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="confirm-ok">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id="confirm-cancle">취소</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
</html>


<script>
$(document).ready(function() {
	$("#openBtn").click(function() {


		/*if(!confirm("계속 진행하시겠습니까?")) {
			return;
		}*/

		//위에 방식처럼 동작하게끔 confirmModal 를 만들고 싶습니다. 
		if(!confirmModal("계속 진행하시겠습니까?")) {
			return;
		}

		alert("완료하였습니다.");
	});
});


function confirmModal(text, title) {
	
	var result = false;
	
	if(title === "undefined")
		title = "알림";
	
	$(".modal-title").text(title);
	$(".modal-body").text(text);
	
	modalConfirm(function(confirm){
		if(confirm){
			result = true;
			console.log("confirm : true");
		}else{
			result = false;
			console.log("confirm : false");
		}
	});
	

	return result;	
}

var modalConfirm = function (callback){
	
	$("#myModal").modal("show");

	$("#confirm-ok").on("click", function(){
		callback(true);
		$("#confirmModal").modal('hide');
	});
	
	$("#confirm-cancle").on("click", function(){
		callback(false);
		$("#confirmModal").modal('hide');
	});
};

</script>