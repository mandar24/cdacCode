

function validateForm3()
{
var user=document.myform.uname.value;;
var user=user.trim();
var pass=document.myform.password.value;;
 
if(user=='')
{
document.getElementById('error').innerHTML="Please Enter Username";
return false;
}
 
if(pass=='')
{
document.getElementById('error1').innerHTML="Please Enter Password";
return false;
}
}