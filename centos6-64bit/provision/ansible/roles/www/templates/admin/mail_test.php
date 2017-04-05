<?php

mb_language("ja");
mb_internal_encoding("UTF-8");

$to = "webmaster-to@example.com";
$from = "webmaster-from@example.com";

$subject = "テストのサブジェクト";
$body = "テスト\nテストテスト\nテストテストテスト\nテストテスト\nテスト";

mb_send_mail($to,$subject,$body,"From:".$from);


$subject = "TEST SUBJECT";
$body = "TEST BODY";

echo "Send mail: ";
$result =  mail($to,$subject,$body,"From:".$from);

if($result){
 echo "Success";
}else{
 echo "failed";
}

