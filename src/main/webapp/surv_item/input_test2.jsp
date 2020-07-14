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


var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<input type=text name=addText[] style=width:350px; height:20px;> ";
  frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
  oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}

function frmCheck()
{
  var frm = document.form;
  
  for( var i = 0; i <= frm.elements.length - 1; i++ ){
     if( frm.elements[i].name == "addText[]" )
     {
         if( !frm.elements[i].value ){
             alert("텍스트박스에 값을 입력하세요!");
             frm.elements[i].focus();
             return;
          }
      }
   }
 }

</script>
</head>
<body>
<form name="form" method="post">
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2" align="left" bgcolor="#FFFFFF">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td colspan="5" bgcolor="#FFFFFF" height="25" align="left"><input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가">
         <font color="#FF0000">*</font>추가버튼을 클릭해 보세요.</td>
        </tr>
        <tr>
         <td height="25">
          <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
            <tr>
              <td><input type="text" name="addText[]" style="width:350px; height:20px;"></td>
              <td align="left"></td>
            </tr>
          </table></td>
        </tr>
       </table>
      </td>
   </tr>
 </table>
 <table width="400" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td height="10">
    </td>
    </tr>
    <tr>
    <td align="center">
    <input type="button" name="button" value="확인" onClick="frmCheck();">
    </td>
   </tr>
 </table>
</form>
</body>
</html>
