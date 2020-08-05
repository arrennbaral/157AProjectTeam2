<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Cheque Book</title>
</head>
<style>
body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3.amazonaws.com%2Fwp-uploads.benzinga-money.prod%2Fwp-content%2Fuploads%2F2018%2F01%2F25212648%2Fcredit-cards.jpg&f=1&nofb=1');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

/* Add padding to containers */
.container {

  padding: 10px;
  width: 20%;
margin:80px 550px;
  background: rgba(255, 255, 255, .8);
  
}

.mcontainer {

  padding: 10px;
  width: 55%;
margin:80px 320px;
  background: rgba(255, 255, 255, .8);
  
}
input[type=text], input[type=password] {
  width: 100%;
  padding: 5px;
  margin: 0px 0 5px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
   padding: 5px;
}

p {

   padding: 10px 70px;
   background: rgba(255, 255, 255, .5);
  
}



.btn {

  background-color: #4CAF50;
  color: white;
  padding: 5px 10px;

  border: none;
  cursor: pointer;
  width: 25%;
  opacity: 0.9;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;

   outline: none;
}
.btn:hover {background-color: #3e8e41}

.btn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.abtn {

  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin: 8px 590px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;

   outline: none;
}
.abtn:hover {background-color: #3e8e41}

.abtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
 img{
 margin:8px 480px;
 }


</style>
<body>
<form action="cheque.jsp" method="post">
<div class="container">
	<label for="account"><b>Account No.</b></label>
    <input type="text" placeholder="Please enter your account number" name="account" id="account" required>

	 <label  for="name"><b>Username</b></label>
    <input type="text" placeholder="Please enter username" name="name" id="name" required>
    
    

 <button type="submit" class="btn">Order</button>
 </div></form>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>



<%

String account=request.getParameter("account");
String name=request.getParameter("name");
String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");

try {
	
	Connection connection = DriverManager.getConnection(url,"root","root"); 

	java.util.Date now = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(now.getTime());

	

	PreparedStatement ps;
	ps = connection.prepareStatement("INSERT INTO chequeBookOrder(account_id,username, orderDate) VALUES" +
			"(?,?,?)");
	ps.setString(1,account);
	ps.setString(2,name);
	ps.setDate(3,sqlDate);
	ps.executeUpdate();
	
	String querySql = "SELECT * FROM userInfo WHERE idnewUser="+account+"";
	
	Statement st=connection.createStatement();
	ResultSet rs1=st.executeQuery(querySql);
	while(rs1.next()){
		String FN = rs1.getString("firstname");
		String address = rs1.getString("address");
		
	
	%>
	<div class="mcontainer">


	<p>Thank you, <%=FN %>. Your chequebook order has been successfully placed. Your cheque will be mailed to <%=address %>.
	Please allow us 2-3 business days to process.
	Below is a sample of your chequebook.
	  </p>
	
		</div>
		  <p align="center" style="color:BLUE">SAMPLE CHEQUE BOOK</p>
		<img src="https://i.pinimg.com/originals/8b/e6/9a/8be69adf119b2cd278e381d1013e9643.jpg" width="400" height="200" >
		<% 

	}

}
catch (SQLException e) {

	e.printStackTrace();
}



%>
<a href="file.jsp" class="abtn">Account Summary</a>
<a href="index.html" class="abtn">Exit</a>


</body>
</html>