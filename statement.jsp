<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statement</title>
</head>

<style>

body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs-i.huffpost.com%2Fgen%2F1410691%2Fimages%2Fo-CREDIT-CARDS-facebook.jpg&f=1&nofb=1');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

.scontainer {

  padding: 0px;
  width: 35%;
margin:10px 400px;
  background: rgba(255, 255, 255, .9);
  
}
.pcontainer {

  padding: 0px;
  width: 60%;
margin:10px 260px;
  background: rgba(255, 255, 255, .9);
  
}


/* Add padding to containers */
.container {

 padding: 15px;
  width: 25%;
  margin:38px 480px;
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



</style>
<body>
<h1 align="center">Statements</h1>
<form action="statement.jsp" method="post">
<div class="container">
		<label for="account"><b>Account No.</b></label>
    <input type="text" placeholder="Please enter your account number" name="account" id="account" required>

	 <label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="Please enter your SSN" name="ssn" id="ssn" required>
    

 <button type="submit" class="loginbtn">Get Statement</button>
 </div></form>
 <%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<% 

String account=request.getParameter("account");
String username=request.getParameter("username");
String password=request.getParameter("password");
String ssn=request.getParameter("ssn");

String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");


try{
	Connection con = DriverManager.getConnection(url,"root","root"); 
	
	
	
	//////////////
	String querySql = "SELECT * FROM withdrawals WHERE account_id="+account+"";
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery(querySql);
	%>
	<div  class="pcontainer">
	<h2 align="center" style="color:#DF0101">Withdrawals/Deposits/Transfers Report
		</h2>
	</div>
	
	<% 
	while(rs1.next()){
		String amount = rs1.getString("amount");
		String date = rs1.getString("DATE");
		
		%>
		<div class="scontainer">
	<p align="center">-$<%=amount%> withdrawn on <%=date%>. </p>
	</div>
		<%
	
	}
	
	//////////////
	String querySql1 = "SELECT * FROM deposits WHERE account_id="+account+"";
	Statement st1=con.createStatement();
	ResultSet rs2=st1.executeQuery(querySql1);
	%>
	
	
	<% 
	while(rs2.next()){
		String amount = rs2.getString("amount");
		String date = rs2.getString("DATE");
		
			%>
		<div class="scontainer">
	<p align="center">$<%=amount%> deposited on <%=date%>. </p></div>
		<%
	
	}
	
	String querySql4 = "SELECT * FROM Transfers WHERE account_id="+account+"";
	Statement st4=con.createStatement();
	ResultSet rs4=st4.executeQuery(querySql4);

	while(rs4.next()){
		String transfer = rs4.getString("amount");
		String date = rs4.getString("DATE");
		String receiver = rs4.getString("recipient_name");
		
			%>
			<div class="scontainer">
		
	<p align="center">$<%=transfer%> transferred to <%=receiver %> on <%=date%>. </p></div>
		<%
	}
	String query = "SELECT * FROM userInfo WHERE SSN="+ssn+"";
	Statement state=con.createStatement();
	ResultSet result=state.executeQuery(query);
 
	while(result.next()){
		String amount = result.getString("amount");

		
		%>
		<div class="scontainer">
		
		<p align="center">$<%=amount%> first deposit. </p></div>
			<%
	
	}
	////////////
	
	java.util.Date now = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(now.getTime());

	String querySql2 = "SELECT * FROM hasBalance WHERE SSN="+ssn+"";
	Statement st2=con.createStatement();
	ResultSet rs3=st2.executeQuery(querySql2);
	while(rs3.next())
	{
		
		String amount = rs3.getString("balance");
		%>
		<div class="scontainer">
		
		<p align="center" style="color:BLue"> As of <%=sqlDate%>, your total balance is $<%=amount%> </p></div>
		
		<%
	}
	/////////////////
		PreparedStatement ps;
				ps = con.prepareStatement("INSERT INTO Statements(account_id,orderDate) VALUES" +
						"(?,?)");
				ps.setString(1,account);

				ps.setDate(2,sqlDate);
				ps.executeUpdate();
				
				
	///////////////////////			
				
				
	
}catch (SQLException e) {

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
<a href="file.jsp" class="abtn">Account Information</a>
<a href="index.html" class="btn">Exit</a>

</body>
</html>