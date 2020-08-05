<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdrawal</title>
</head>
<style>

body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.kennisnetwerk-amsterdam.nl%2Fwordpress%2Fwp-content%2Fuploads%2F2017%2F07%2Fbroken-piggy-bank-1680x858.jpg&f=1&nofb=1');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

/* Add padding to containers */
.container {

  padding: 20px;
  width: 25%;
  margin:50px 480px;
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
<h1 align="center">Withdrawal</h1>
<form action="withdraw.jsp" method="post">
<!-- SSN : <input type="text" name="ssn"><br>
Amount : <input type="text" name="amount"><br> -->
<!-- 
<input type="submit" value="Deposit"><br> -->
<div class="container">
		<label for="account"><b>Account No.</b></label>
    <input type="text" placeholder="Please enter your account number" name="account" id="account" required>

	 <label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="Please enter your SSN" name="ssn" id="ssn" required>
    
    <label for="amount"><b>Amount</b></label>
    <input type="text" placeholder="Please enter any amount" name="amount" id="amount" required>
   


 <button type="submit" class="loginbtn">Withdraw</button>

 
</div></form>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<% 

String account=request.getParameter("account");
String ssn=request.getParameter("ssn");
String amount=request.getParameter("amount");


String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection connection = DriverManager.getConnection(url,"root","root"); 

	java.util.Date now = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(now.getTime());
	String insertSql = "INSERT INTO withdrawals (account_id, amount, DATE) "
			+ "VALUES ("+account+", "+amount+", '" + sqlDate + "')";
	Statement statement = connection.createStatement();
	statement.execute(insertSql);
	
	


	
	String updateSql1 = "UPDATE hasBalance SET balance=balance-"+amount+" WHERE SSN="+ssn+"";
	Statement statement2 = connection.createStatement();
	statement2.execute(updateSql1);

	
	/////////////
	String querySql2 = "SELECT * FROM hasBalance WHERE SSN="+ssn+"";
	Statement st2=connection.createStatement();
	ResultSet rs3=st2.executeQuery(querySql2);
	while(rs3.next())
	{
	
		String balance = rs3.getString("balance");
		%>
		
		<div class="container">

	
	<p style="color:BLUE">Thank you, $<%=amount%> is successfully withdrawn from your account.
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