<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegistrationJSP</title>
</head>
<style>
body {
  background-image: url('https://www.avanade.com/-/media/images/content/background/thinking/the-everyday-bank.jpg');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

/* Add padding to containers */
.container {

  padding: 20px;
  width: 25%;
  margin:120px 480px;
   background: rgba(255, 255, 255, .5);
  
}

.loginbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px;
  margin: 0px 0 5px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}





</style>
<body>



<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<% 
String fName=request.getParameter("fname");
String lName=request.getParameter("lname");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String ssn=request.getParameter("ssn");
String username=request.getParameter("username");
String password=request.getParameter("password");
String deposit=request.getParameter("deposit");

 String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";

Class.forName("com.mysql.jdbc.Driver");
try {
Connection connection = DriverManager.getConnection(url,"root","root"); 
PreparedStatement ps;
ps = connection.prepareStatement("Insert into userInfo(firstname, lastname, username, password, address, phone, amount,SSN) values(?,?,?,?,?,?,?,?)");

ps.setString(1,fName);
ps.setString(2,lName);
ps.setString(3,username);
ps.setString(4,password);
ps.setString(5,address);
ps.setString(6,phone);
ps.setString(7,deposit);
ps.setString(8,ssn);
ps.executeUpdate();



//////////////////////////
PreparedStatement ps1;


ps1 = connection.prepareStatement("Insert into USERS(username, password, SSN) values(?,?,?)");

//ps.setInt(1,generatedKeys);
ps1.setString(1,username);
ps1.setString(2,password);
ps1.setString(3,ssn);
ps1.executeUpdate();

///////////////////////
PreparedStatement ps2;


ps2 = connection.prepareStatement("Insert into hasBalance(SSN, balance) values(?,?)");

//ps.setInt(1,generatedKeys);
ps2.setString(1,ssn);
ps2.setString(2,deposit);

ps2.executeUpdate();



} catch (SQLException e) {

	e.printStackTrace();
}



%>


<h2>Welcome, <%=fName %> <%=lName %></h2>
<p>Thank you for trusting us.</p>
		<p>We assure you the excellency.</p>
<form action="index.jsp" method="post">
<div class="container">
	<p>Please login using your username, password and SSN</p>
	 <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Please enter username" name="username" id="username" required>
    
    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Please enter password" name="password" id="password" required>
    <label   for="ssn"><b>SSN</b></label>
    <input  type="password" placeholder="Social Security Number" name="ssn" id="ssn" required>


 <button type="submit" class="loginbtn">Login</button>

 
</div>


</form>
</body>
</html>