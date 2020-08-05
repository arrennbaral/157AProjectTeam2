<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer</title>
</head>
<style>

body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.valuewalk.com%2Fwp-content%2Fuploads%2F2019%2F03%2FMoney_Transfer_1552398625.jpg&f=1&nofb=1');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

/* Add padding to containers */
.container {

  padding: 15px;
  width: 25%;
  margin:38px 480px;
   background: rgba(255, 255, 255, .5);
  
}

.scontainer {

  padding: 15px;
  width: 40%;
  margin:38px 380px;
   background: rgba(255, 255, 255, .5);
  
}

.mcontainer {

  padding: 20px;
  width: 25%;
  margin:50px 480px;
   background: rgba(255, 255, 255, .5);
  
}

.hbtn {

  background-color: #4CAF50;
  color: white;
  padding: 10px 70px 10px 40px;
margin:10px 1px;
  border: none;
  cursor: pointer;
  width: 20%;
  opacity: 0.9;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;

   outline: none;
}
.hbtn:hover {background-color: #3e8e41}

.hbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
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

.loginbtn:hover {background-color: #3e8e41}

.loginbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
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
.abtn {

  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin: 8px 210px;
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


.btn {

  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 210px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;

   outline: none;
}

.btn:hover {background-color: #8A0808}

.btn:active {
  background-color: #8A0808;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}



</style>

<body>
<h1 align="center">Transfer</h1>

<form action="transfer.jsp" method="post">

<div class="container">
		<label for="account"><b>Account No.</b></label>
    <input type="text" placeholder="Please enter your account number" name="account" id="account" required>

	 <label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="Please enter your SSN" name="ssn" id="ssn" required>
    
    <label for="name"><b>Receiver's Name</b></label>
    <input type="text" placeholder="Please enter receiver's name" name="name" id="name" required>
    
    <label for="phone"><b>Receiver's Phone Number</b></label>
    <input type="text" placeholder="Please enter any receiver's phone number" name="phone" id="phone" required>
    
    <label for="amount"><b>Amount</b></label>
    <input type="text" placeholder="Please enter any amount" name="amount" id="amount" required>
   


 <button type="submit" class="loginbtn">Transfer</button>
 
 </div></form>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<% 
String account=request.getParameter("account");
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String amount=request.getParameter("amount");
String ssn=request.getParameter("ssn");

String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");
try {
	java.util.Date now = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(now.getTime());
	Connection connection = DriverManager.getConnection(url,"root","root"); 
	PreparedStatement ps;


	ps = connection.prepareStatement("Insert into Transfers(account_id, recipient_name, recipient_phone, amount, DATE) values(?,?,?,?,?)");


	ps.setString(1,account);
	ps.setString(2,name);
	ps.setString(3,phone);
	ps.setString(4,amount);
	ps.setDate(5,sqlDate);

	ps.executeUpdate();
	

	
	String updateSql1 = "UPDATE hasBalance SET balance=balance-"+amount+" WHERE SSN="+ssn+"";
	Statement statement2 = connection.createStatement();
	statement2.execute(updateSql1);

	String querySql2 = "SELECT * FROM hasBalance WHERE SSN="+ssn+"";
	Statement st2=connection.createStatement();
	ResultSet rs3=st2.executeQuery(querySql2);
	while(rs3.next())
	{
	
		String balance = rs3.getString("balance");
		%>
			<div class="scontainer">

	
	<p style="color:BLUE">Thank you, $<%=amount%> is successfully transferred to <%=name%> from your account.
	 As of <%=sqlDate%>, your total balance is $<%=balance%>. </p>
 
			</div>
		<%
	
	}
	
} catch (SQLException e) {

	e.printStackTrace();
}



%>

<form action="home.jsp" method="post">
<div class="mcontainer">
	<h3 align="center" >For Homepage</h3>
	<label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="SSN" name="ssn1" id="ssn1" required>
   

 <button type="submit" class="hbtn">Home</button>
 </div></form>

<a href="file.jsp" class="abtn">Account Summary</a>
<a href="index.html" class="btn">Exit</a>


</body>
</html>