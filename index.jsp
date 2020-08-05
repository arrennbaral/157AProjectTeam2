<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<style>
body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.dentons.com%2F-%2Fmedia%2Fimages%2Fwebsite%2Fbackground-images%2Fpractices%2Fbanking-and-finance%2Fbanking_1.jpg&f=1&nofb=1');
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

p {

   padding: 10px 70px;
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

.depositbtn {
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


.lbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
margin:0px 0px 0px 1200px;
  border: none;
  cursor: pointer;
  width: 8%;
  opacity: 0.9;
   text-decoration: none;

  border-radius: 15px;

   outline: none;
    display: inline-block;
 
    
}

.lbtn:hover {background-color: #3e8e41}

.lbtn:active {
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
margin:0px 0px 0px 8px;
  border: none;
  cursor: pointer;
  width: 15%;
  opacity: 0.9;
   text-decoration: none;

  border-radius: 15px;

   outline: none;
    display: inline-block;
 
    
}

.dbtn:hover {background-color: #8A0808}

.dbtn:active {
  background-color: #8A0808;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.abtn {

  background-color: #4CAF50;
  color: white;
  padding: 8px 20px;
margin: 2px 1100px;
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
.topright {
  position: absolute;
  top: 8px;
  right: 16px;
  font-size: 18px;
}


.bbtn {
  background-color: #4CAF50;
  color: white;
  padding: 2px 50px 0px 20px;

  border: none;
  cursor: pointer;
  width: 8%;
  opacity: 0.9;
   text-decoration: none;
    display: inline-block;
  border-radius: 15px;

   outline: none;
 
    
}

.bbtn:hover {background-color: #3e8e41}

.bbtn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>
<body>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String ssn=request.getParameter("ssn");


String url="jdbc:mysql://localhost:3306/ABCbank";
Connection connection = DriverManager.getConnection(url,"root","root"); 
Class.forName("com.mysql.jdbc.Driver");


try {
	Connection con = DriverManager.getConnection(url,"root","root"); 
	
	PreparedStatement ps=con.prepareStatement("Select * from "+
			"userInfo where username = ? and password =? AND SSN=?");
	
	ps.setString(1,username);
	ps.setString(2,password);
	ps.setString(3,ssn);

	
	ResultSet rs=null;
	rs=ps.executeQuery();
	 boolean more = rs.next();


	   if (!more) 
       {
		  
        
          
%>


<form action="index.jsp" method="post">
<div class="container">
<h3>Sorry</h3>
<p style="color:RED">Invalid ID/Password or you are not registered.
</p>
<p>Please register to get a new account.</p>


	 <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Please enter username" name="username" id="username" required>
    
    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Please enter password" name="password" id="password" required>
    <label   for="ssn"><b>SSN</b></label>
    <input  type="password" placeholder="Social Security Number" name="ssn" id="ssn" required>


 <button type="submit" class="loginbtn">Login</button>

  <p>Need an account? <a href="Registration.html">Register here</a></p>

 
</div>

<% 
       } 
	   
	   else{
		  
		   %>
		   <h2 >Welcome, <%=username%>
		   </h2>
		   <h2 align="center" style="color:RED">Home </h2>
		   <% 
		   
		   
	   
	

	String querySql = "SELECT * FROM userInfo WHERE SSN="+ssn+"";
	
	Statement st=con.createStatement();
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
		<p align="center">Name : <%=FN%> <%=LN %> </p>
		
		
		<% 

		String querySql1 = "SELECT balance FROM hasBalance WHERE SSN="+ssn+"";
		Statement st2=connection.createStatement();
		ResultSet rs4=st2.executeQuery(querySql1);
		while(rs4.next()){
			String balance = rs4.getString("balance");
			
			%>
			<p align="center">Total Balance: <%=balance%></p>
			<% 
		}
		
		
	
	}
	%>
<div class="topright"	>
<a href="loan.html" class="bbtn">Apply Loan</a></div>
<a href="deposit.jsp" class="depositbtn">Deposit</a>
<a href="withdraw.jsp" class="wbtn">Withdraw</a>
<a href="transfer.jsp" class="tbtn">Transfer</a>
<a href="statement.jsp" class="sbtn">Statement</a> 
<a href="file.jsp" class="abtn">Account Information</a>
<br><a href="index.html" class="lbtn">Log Out</a>
<a href="cheque.jsp" class="obtn">Order ChequeBook</a> 
<a href="delete.html" class="dbtn">Delete Account</a>
	<% 
}

	
} catch (Exception e) {
e.printStackTrace();
}
%>






</form>
</body>
</html>