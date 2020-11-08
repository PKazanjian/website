// Based on older version PHP... use lint and update syntax
<?php
$host="localhost"; // Host name
$username="root"; // Mysql username
$password="P@ssw0rd"; // Mysql password
$db_name="siteauth"; // Database name
$tbl_name="authusrs"; // Table name

// Connect to server and select databse.
mysql_connect("$host", "$username", "$password")or die("cannot connect");
mysql_select_db("$db_name")or die("cannot select DB");

// username and password sent from form
$myusername=$_POST['myusername'];
$mypassword=$_POST['mypassword'];

// Escape variables; Formulate and send MySQL query
$myusername = mysql_real_escape_string($myusername);
$mypassword = mysql_real_escape_string($mypassword);
$sql="SELECT * FROM $tbl_name WHERE username='$myusername' and password='$mypassword'";
$result=mysql_query($sql);

// Check that the result is not = 0
$count=mysql_num_rows($result);
if ($count==TRUE) {

// Redirect successfully authenticated users to this page
header("location:login_success.php");
exit;
}
else {
echo "Wrong Username or Password";
}
?>
<br>
<br>
<br>
<?php
print_r(mysql_error());
?>
