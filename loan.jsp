<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan</title>
</head>
<style>
body {
  background-image: url('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmarketingland.com%2Fwp-content%2Fml-loads%2F2014%2F08%2Fecommerce-credit-cards-ss-1920.jpg&f=1&nofb=1');
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

.btn:hover {background-color: #3e8e41}

.btn:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

 img{
 margin:8px 480px;
 }


</style>


<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<% 

String account=request.getParameter("account");
String ssn=request.getParameter("ssn");
String loan_type=request.getParameter("apply");
String amount=request.getParameter("amount");

String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");
try {
	
	java.util.Date now = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(now.getTime());
	
	Connection connection = DriverManager.getConnection(url,"root","root"); 

	
	PreparedStatement ps;
	ps = connection.prepareStatement("INSERT INTO Loan(account_id, loantype, loan_amount, DATE) VALUES" +
			"(?,?,?,?)");
	ps.setString(1,account);
	ps.setString(2,loan_type);
	ps.setString(3, amount);
	ps.setDate(4, sqlDate);
	
	
	ps.executeUpdate(); 
	
	
	
	String querySql = "SELECT * FROM Loan WHERE account_id="+account+"";
	Statement st=connection.createStatement();
	ResultSet rs=st.executeQuery(querySql);
	while(rs.next())
	{
		// rs.getString(1); //or rs.getString("column name");
		String loanNo = rs.getString("loan_number");
		String loanType = rs.getString("loantype");
		String date = rs.getString("DATE");
		
		%>
		<div class="mcontainer">
		
		<p> Thank you for applying loan with us.</p>
		<p>Loan number: <%=loanNo %></p>
		<p>You applied for <%=loanType%> loan on <%=date %> </p>
		</div>
		<%
		

	}
	
	String querySql1 = "SELECT balance FROM hasBalance WHERE SSN="+ssn+"";
	Statement st1=connection.createStatement();
	ResultSet rs1=st1.executeQuery(querySql1);
	while(rs1.next())
	{
		// rs.getString(1); //or rs.getString("column name");
		int loan_status = rs1.getInt("balance");
		if(loan_status>4000) {
			
			%>
			<div class="mcontainer">
			<p>Congratulations. You are eligible for <%=loan_type %> loan. </p>
			
			</div>
			<% 
		
			
			break;
		}
		else {
			
			%>
			<div class="mcontainer">
			<p>We are sorry. You are not eligible for <%=loan_type %> loan.
			Please check back again in few months. </p>
				
			</div>
			<% 
		
			break;
		}
		
		
	
	}

} catch (SQLException e) {

	e.printStackTrace();
}



%>


<a href="file.jsp" class="abtn">Account Summary</a>
<a href="index.html" class="btn">Exit</a>


</body>
</html>