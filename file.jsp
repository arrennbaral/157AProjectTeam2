<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Summary</title>
</head>

<style>
body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fecheck.org%2Fwp-content%2Fuploads%2F2017%2F04%2FBest-Business-Credit-Cards-For-2017.jpg&f=1&nofb=1');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

/* Add padding to containers */
.container {

  padding: 0px;
  width: 20%;
margin:50px 500px;
  background: rgba(255, 255, 255, .8);
  
}

.mcontainer {

  padding: 4px;
  width: 10%;
margin:200px 550px;
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
   background: rgba(255, 255, 255, .7);
  
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
margin: 20px 550px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;

   outline: none;
}
.abtn:hover {background-color: #8A0808}

.abtn:active {
  background-color: #8A0808;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}



.depositbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin:1px 250px;
  border: none;
  cursor: pointer;
  width: 8%;
  opacity: 0.9;
   text-decoration: none;
    display: inline-block;
  border-radius: 15px;

   outline: none;
 
    
}

.depositbtn:hover {background-color: #3e8e41}

.depositbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.wbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin:5px 250px;
  border: none;
  cursor: pointer;
  width: 8%;
  opacity: 0.9;
   text-decoration: none;
    display: inline-block;
  border-radius: 15px;

   outline: none;
 
    
}

.wbtn:hover {background-color: #3e8e41}

.wbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


.tbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
 
  border: none;
  cursor: pointer;
  width: 8%;
  opacity: 0.9;
   text-decoration: none;
    display: inline-block;
  border-radius: 15px;
 
   outline: none;
 
    
}

.tbtn:hover {background-color: #3e8e41}

.tbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


.sbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;

  border: none;
  cursor: pointer;
  width: 8%;
  opacity: 0.9;
   text-decoration: none;
   display: inline-block;
  border-radius: 15px;

   outline: none;
 
    
}

.sbtn:hover {background-color: #3e8e41}

.sbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


.obtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin:0px 0px 0px 10px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
   text-decoration: none;

  border-radius: 15px;

   outline: none;
    display: inline-block;
 
    
}

.obtn:hover {background-color: #3e8e41}

.obtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.dbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin:0px 0px 0px 10px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
   text-decoration: none;

  border-radius: 15px;

   outline: none;
    display: inline-block;
 
    
}

.dbtn:hover {background-color: #3e8e41}

.dbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}




</style>
<body>
<h1 align="center" style="color:White">Account Information</h1>
<form action="file.jsp" method="post">
<div class="container">
	
	<label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="Please enter your SSN" name="ssn" id="ssn" required>
    

 <button type="submit" class="btn">Go</button>
 </div>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
</form>

<% 
String ssn=request.getParameter("ssn");
String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection(url,"root","root"); 
try{
	String querySql = "SELECT * FROM userInfo WHERE SSN="+ssn+"";
	//String querySql = "SELECT * FROM userInfo JOIN hasBalance WHERE userInfo.SSN=hasBalance.SSN AND SSN="+ssn+"";
	Statement st=connection.createStatement();
	ResultSet rs1=st.executeQuery(querySql);
	while(rs1.next()){
		String accountNo = rs1.getString("idnewUser");
		String FN = rs1.getString("firstname");
		String LN = rs1.getString("lastname");
		String address = rs1.getString("address");
		String phone = rs1.getString("phone");
		String deposit = rs1.getString("amount");
		
		%>
		
	
		<p align="center">Account Number : <%=accountNo%></p>
		<p align="center">First Name : <%=FN%></p>
		<p align="center">Last Name : <%=LN%></p>
		<p align="center">Address : <%=address%></p>
		<p align="center">Phone Number : <%=phone%></p>

		
		<% 
	}
	

	
}catch (SQLException e) {

	e.printStackTrace();
}


%>


<form action="home.jsp" method="post">
<div class="mcontainer">
	
	<h3 align="center" >Homepage</h3>
	<label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="SSN" name="ssn1" id="ssn1" required>
   

 <button type="submit" class="hbtn">Home</button>
 </div>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
</form>

<% 
String ssn1=request.getParameter("ssn1");
String querySql2 = "SELECT * FROM userInfo WHERE SSN="+ssn1+"";
	
	Statement st1=connection.createStatement();
	ResultSet rs3=st1.executeQuery(querySql2);
	while(rs3.next()){
		String accountNo = rs3.getString("idnewUser");
		String FN = rs3.getString("firstname");
		String LN = rs3.getString("lastname");
		String address = rs3.getString("address");
		String phone = rs3.getString("phone");
		String deposit = rs3.getString("amount");
		%>
			<p align="center">Account Number : <%=accountNo%></p>
		<p align="center">Name : <%=FN%> <%=LN %> </p>
		
		
		<% 
	}
		String querySql1 = "SELECT balance FROM hasBalance WHERE SSN="+ssn1+"";
		Statement st2=connection.createStatement();
		ResultSet rs4=st2.executeQuery(querySql1);
		while(rs4.next()){
			String balance = rs4.getString("balance");
			
			%>
			<p align="center">Total Balance: <%=balance%></p>
			<% 
		}
		
		
	
	
	%>
<a href="update_address.jsp" class="depositbtn">Update Address</a>
<a href="update_phone.jsp" class="wbtn">Update Phone</a>
<a href="index.html" class="abtn">Exit</a>


</body>
</html>