<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
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
  width: 50%;
  margin:120px 350px;
   background: rgba(255, 255, 255, .5);
  
}



p {

   padding: 10px 70px;
   background: rgba(255, 255, 255, .5);
  
}


.btn {

  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 550px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;

   outline: none;
}





</style>
<body>


<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");

String account=request.getParameter("account");
String username=request.getParameter("username");
String ssn=request.getParameter("ssn");
try {
	Connection connection = DriverManager.getConnection(url,"root","root"); 
	java.util.Date now = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(now.getTime());
	PreparedStatement ps;
	ps = connection.prepareStatement("INSERT INTO deletedAccount(accountno,username,DATE) VALUES" +
			"(?,?,?)");
	ps.setString(1,account);
	ps.setString(2, username);
	ps.setDate(3,sqlDate);
	ps.executeUpdate();
		

	PreparedStatement ps1;
	ps1 = connection.prepareStatement("DELETE FROM userInfo WHERE idnewUser=?");

	ps1.setString(1,account);

	ps1.executeUpdate();
	
	PreparedStatement ps2;
	ps2 = connection.prepareStatement("DELETE FROM deposits WHERE account_id=?");

	ps2.setString(1,account);

	ps2.executeUpdate();
	
	PreparedStatement ps3;
	ps3 = connection.prepareStatement("DELETE FROM withdrawals WHERE account_id=?");

	ps3.setString(1,account);

	ps3.executeUpdate();
	
	PreparedStatement ps4;
	ps4 = connection.prepareStatement("DELETE FROM Transfers WHERE account_id=?");

	ps4.setString(1,account);

	ps4.executeUpdate();
	
	PreparedStatement ps5;
	ps5 = connection.prepareStatement("DELETE FROM hasBalance WHERE SSN=?");

	ps5.setString(1,ssn);

	ps5.executeUpdate();
	
	PreparedStatement ps6;
	ps6 = connection.prepareStatement("DELETE FROM Statements WHERE account_id=?");

	ps6.setString(1,account);

	ps6.executeUpdate();
	
	PreparedStatement ps7;
	ps7 = connection.prepareStatement("DELETE FROM chequeBookOrder WHERE account_id=?");

	ps7.setString(1,account);

	ps7.executeUpdate();
	
	PreparedStatement ps8;
	ps8 = connection.prepareStatement("DELETE FROM USERS WHERE SSN=?");

	ps8.setString(1,ssn);

	ps8.executeUpdate();

	PreparedStatement ps9;
	ps9 = connection.prepareStatement("DELETE FROM Statements WHERE account_id=?");

	ps9.setString(1,account);

	ps9.executeUpdate();
	
	PreparedStatement ps10;
	ps10 = connection.prepareStatement("DELETE FROM chequeBookOrder WHERE account_id=?");

	ps10.setString(1,account);

	ps10.executeUpdate();

	%>
	<div class="container">
	<p align="center">Your account has been successfully deleted.
	Sorry to see you go, <%=username %>. 
	If you change your mind, you can always register again.
	Thank you for trusting us.
						
	</p>
	</div>
	
		<%
	

}
catch (SQLException e) {

	e.printStackTrace();
}


%>
<a href="Registration.html" class="btn">Register</a>
<a href="index.html" class="btn">Exit</a>
</body>
</html>