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
  background-image: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.atlas-cybersecurity.com%2Fwp-content%2Fuploads%2F2018%2F10%2Fbackground-1920x1080.jpg&f=1&nofb=1');
 font-family: Comic sans MS;
}
* {box-sizing: border-box}

/* Add padding to containers */
.container {

  padding: 20px;
  width: 20%;
margin:120px 550px;
  background: rgba(255, 255, 255, .7);
  
}

.mcontainer {

  padding: 0px;
  width: 40%;
margin:50px 420px;
  background: rgba(255, 255, 255, .6);
  
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



</style>
<body>
<form action="update_address.jsp" method="post">
<div class="container">
	
	<label for="ssn"><b>SSN</b></label>
    <input type="password" placeholder="Please enter your SSN" name="ssn" id="ssn">
    
    <label for="old address"><b>Old Address</b></label>
    <input type="text" placeholder="Please enter your old address" name="oaddress" id="oaddress">
    
      <label for="old address"><b>New Address</b></label>
    <input type="text" placeholder="Please enter your new address" name="naddress" id="naddress">
    
    

 <button type="submit" class="btn">Update Address</button>
 
 </div>
 

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>


<% 


String ssn=request.getParameter("ssn");
String oldaddress=request.getParameter("oaddress");
String newaddress=request.getParameter("naddress");



String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
Class.forName("com.mysql.jdbc.Driver");
try {

	Connection connection = DriverManager.getConnection(url,"root","root"); 
	PreparedStatement ps;
	//			
	//
	ps = connection.prepareStatement("UPDATE userInfo SET address=? WHERE SSN=?");

	//ps.setInt(1,generatedKeys);
	ps.setString(1,newaddress);
	ps.setString(2, ssn);


	ps.executeUpdate();

	String querySql1 = "SELECT address FROM userInfo WHERE SSN="+ssn+"";
	Statement st1=connection.createStatement();
	ResultSet rs1=st1.executeQuery(querySql1);
	while(rs1.next())
	{
		
		String address = rs1.getString("address");
		
		%>
		 <div class="mcontainer">
		 <p style="color:BLue"> Your address is successfully updated from <%=oldaddress %> to <%=address %>.
		 
		 </p>
		 </div>
		
		<% 



	}

} catch (SQLException e) {

	e.printStackTrace();
}


%>
<a href="file.jsp" class="abtn">Account Information</a>
<a href="index.html" class="abtn">Exit</a>

</form>
</body>
</html>
