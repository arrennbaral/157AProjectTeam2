import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;


public class BankingSys {


	// JDBC Objects
	private static Connection con=null;
	private static Statement stmt;
	private static ResultSet rs;
	private static ResultSet rs1;
	private static ResultSet rs4;
	private static String url="jdbc:mysql://localhost:3306/ABCbank?serverTimezone=UTC";
	//private static String user="root";
	//private static String password="root";

	private static PreparedStatement pstate;

	public static void main(String args[]) throws Exception {


		//register("abc","def","abc","abc1","16 nowhere st","00033000",4000,2122);
		///////////////////////////////////////////////////////
		//accountInfo(55,"abc","abc1");
		///////////////////////////////////////////////////////
		//checkBalance(55,"abc","abc1",2121);
		///////////////////////////////////////////////////////
		//makeTransfer(57,"Extre","222-222-2222",50,2122);
		//makeDeposit(57,"abc","abc1",100,2122);
		//makeWithdrawal(57,"abc","abc1",50,2122);

		///////////////////////////////////////////////////////
		//updateAddress(55,"111 somewhere bld");
		///////////////////////////////////////////////////////
		//updatePhone(55,"1234567010");
		///////////////////////////////////////////////////////
		//deleteAccount(56,"abc",2121);
		///////////////////////////////////////////////////////
		//Statement(57,"abc", "def",2122);
		
		///////////////////////////////////////////////////////
//		orderCheque(21, "John","John13");

		
		///////////////////////////////////////////////////////
		//highToLowSort(6, "jackmill","milljack");
		///////////////////////////////////////////////////////
		//loanApply(8,"Home",1000000,1111);

		

	}


	//registration
	public static void register(String firstname, String lastname, String username,String password,String address,String phone,int amount, int SSN){

		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 
			PreparedStatement ps;


			ps = connection.prepareStatement("Insert into userInfo(firstname, lastname, username, password, address, phone, amount,SSN) values(?,?,?,?,?,?,?,?)");

			//ps.setInt(1,generatedKeys);
			ps.setString(1,firstname);
			ps.setString(2,lastname);
			ps.setString(3,username);
			ps.setString(4,password);
			ps.setString(5,address);
			ps.setString(6,phone);
			ps.setInt(7,amount);
			ps.setInt(8,SSN);
			//ps.setString(7,phone);

			ps.executeUpdate();
			
			String querySql = "SELECT idnewUser FROM userInfo WHERE phone="+phone+"";
			Statement st=connection.createStatement();
			rs=st.executeQuery(querySql);
			while(rs.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String accountNo = rs.getString("idnewUser");
			System.out.println("Account Number --> "+ accountNo);
			}

			
			PreparedStatement ps1;


			ps1 = connection.prepareStatement("Insert into USERS(username, password, SSN) values(?,?,?)");

			//ps.setInt(1,generatedKeys);
			ps1.setString(1,username);
			ps1.setString(2,password);
			ps1.setInt(3,SSN);
			ps1.executeUpdate();
			
			PreparedStatement ps2;


			ps2 = connection.prepareStatement("Insert into hasBalance(SSN, balance) values(?,?)");

			//ps.setInt(1,generatedKeys);
			ps2.setInt(1,SSN);
			ps2.setInt(2,amount);
			
			ps2.executeUpdate();
			
		
			

			
		} catch (SQLException e) {

			e.printStackTrace();
		}


	}

	//login check
	public static void accountInfo(int accountno,String username,String password){
		
		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 



			String querySql = "SELECT * FROM userInfo WHERE idnewUser="+accountno+"";
			Statement st=connection.createStatement();
			rs=st.executeQuery(querySql);
			while(rs.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String accountNo = rs.getString("idnewUser");
				String FN = rs.getString("firstname");
				String LN = rs.getString("lastname");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
			
				

				//String details=accountNo + " " + FN + " " + LN + " " + address + " " + phone + "\n";
				System.out.println("Account Number --> " + accountNo);
				System.out.println("Username --> " + username);
				System.out.println("First Name --> " + FN);
				System.out.println("Last Name --> " + LN);
				System.out.println("Address --> " + address);
				System.out.println("Phone Number --> " + phone);
				
				
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	//check balance
	public static void checkBalance(int accountno, String username, String password, int SSN) {

		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 
			
			

			String querySql = "SELECT * FROM hasBalance WHERE SSN="+SSN+"";
			Statement st=connection.createStatement();
			rs=st.executeQuery(querySql);
			while(rs.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String amount = rs.getString("balance");
				System.out.println("Total Balance for account number "+ accountno +" is "  +amount);

			}

		}catch (SQLException e) {
			e.printStackTrace();
		}


	}
	//make Deposit
	public static void makeDeposit(int accountno, String username,String password, int amount, int SSN) {

		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 

			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			String insertSql = "INSERT INTO deposits (account_id, amount, DATE) "
					+ "VALUES ("+accountno+", "+amount+", '" + sqlDate + "')";
			Statement statement = connection.createStatement();
			statement.execute(insertSql);
			/////////////
//			String querySql = "SELECT deposits.amount, deposits.DATE FROM deposits, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=deposits.account_id";
//			Statement st=connection.createStatement();
//			rs=st.executeQuery(querySql);
//			while(rs.next())
//			{
//				// rs.getString(1); //or rs.getString("column name");
//				String deposit = rs.getString("amount");
//				String date=rs.getString("DATE");
//
//
//				String deposits=deposit + " on " + date + "\n";
//				System.out.println(deposits);
//
//
//
//			}
			System.out.println("$"+amount +" has been successfully deposited.\n");
			
//			String updateSql = "UPDATE userInfo SET amount=amount+"+amount+" WHERE idnewUser="+accountno+"";
//			Statement statement1 = connection.createStatement();
//			statement1.execute(updateSql);
			
//			String updateSql2 = "UPDATE balance SET balance=balance+"+amount+" WHERE ssn="+accountno+"";
//			Statement statement2 = connection.createStatement();
//			statement2.execute(updateSql2);
/*
			String querySql1 = "SELECT userInfo.amount FROM userInfo WHERE idnewUser="+accountno+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String deposit = rs1.getString("amount");
				
				System.out.println("Total Balance after the deposit is $"+deposit);



			}
			*/
			String updateSql1 = "UPDATE hasBalance SET balance=balance+"+amount+" WHERE SSN="+SSN+"";
			Statement statement2 = connection.createStatement();
			statement2.execute(updateSql1);
			
			String querySql1 = "SELECT balance FROM hasBalance WHERE SSN="+SSN+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String deposit = rs1.getString("balance");
				
				System.out.println("Total Balance after the deposit is $"+deposit);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	//make Withdrawal
	public static void makeWithdrawal(int accountno, String username,String password, int amount,int SSN) {

		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 

			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			String insertSql = "INSERT INTO withdrawals (account_id, amount, DATE) "
					+ "VALUES ("+accountno+", "+amount+", '" + sqlDate + "')";
			Statement statement = connection.createStatement();
			statement.execute(insertSql);
			/////////////
//			String querySql = "SELECT withdrawals.amount, withdrawals.DATE FROM withdrawals, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=withdrawals.account_id";
//			Statement st=connection.createStatement();
//			rs=st.executeQuery(querySql);
//			while(rs.next())
//			{
//
//				String withdrawal = rs.getString("amount");
//				String date=rs.getString("DATE");
//
//
//				String withdrawals=withdrawal + " on " + date + "\n";
//				System.out.println(withdrawals);
//
//			}
				System.out.println("$"+amount +" has been successfully withdrawn.\n");
				
//			String updateSql = "UPDATE userInfo SET amount=amount-"+amount+" WHERE idnewUser="+accountno+"";
//			Statement statement1 = connection.createStatement();
//			statement1.execute(updateSql);
			
//			String querySql1 = "SELECT userInfo.amount FROM userInfo WHERE idnewUser="+accountno+"";
//			Statement st1=connection.createStatement();
//			rs1=st1.executeQuery(querySql1);
//			while(rs1.next())
//			{
//				// rs.getString(1); //or rs.getString("column name");
//				String withdrawn = rs1.getString("amount");
//				
//				System.out.println("Total Balance after the withdrawal is $"+withdrawn);
//
//
//
//			}

			String updateSql1 = "UPDATE hasBalance SET balance=balance-"+amount+" WHERE SSN="+SSN+"";
			Statement statement2 = connection.createStatement();
			statement2.execute(updateSql1);

			String querySql1 = "SELECT balance FROM hasBalance WHERE SSN="+SSN+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String withdrawn = rs1.getString("balance");
				
				System.out.println("Total Balance after the withdrawal is $"+withdrawn);



			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}


	//make Transfer
	public static void makeTransfer(int accountno, String rcv_name, String phone, int amount,int SSN) {

		try {
			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			Connection connection = DriverManager.getConnection(url,"root","root"); 
			PreparedStatement ps;


			ps = connection.prepareStatement("Insert into Transfers(account_id, recipient_name, recipient_phone, amount, DATE) values(?,?,?,?,?)");


			ps.setInt(1,accountno);
			ps.setString(2,rcv_name);
			ps.setString(3,phone);
			ps.setInt(4,amount);
			ps.setDate(5,sqlDate);

			ps.executeUpdate();
			
			
			System.out.println("$"+amount +" has been successfully transferred to " + rcv_name +".\n");
//			String updateSql = "UPDATE userInfo SET amount=amount-"+amount+" WHERE idnewUser="+accountno+"";
//			Statement statement1 = connection.createStatement();
//			statement1.execute(updateSql);
//			
//			String querySql1 = "SELECT userInfo.amount FROM userInfo WHERE idnewUser="+accountno+"";
//			Statement st1=connection.createStatement();
//			rs1=st1.executeQuery(querySql1);
//			while(rs1.next())
//			{
//				// rs.getString(1); //or rs.getString("column name");
//				String transfer = rs1.getString("amount");
//				
//				System.out.println("Total Balance after the transfer is $"+transfer);
//
//
//
//			}
			

			String updateSql1 = "UPDATE hasBalance SET balance=balance-"+amount+" WHERE SSN="+SSN+"";
			Statement statement2 = connection.createStatement();
			statement2.execute(updateSql1);
			
			String querySql1 = "SELECT balance FROM hasBalance WHERE SSN="+SSN+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String transfer = rs1.getString("balance");
				
				System.out.println("Total Balance after the transfer is $"+transfer);



			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	//Update address
	public static void updateAddress(int accountno, String new_address)

	{

		try {

			Connection connection = DriverManager.getConnection(url,"root","root"); 
			PreparedStatement ps;
			//			
			//
			ps = connection.prepareStatement("UPDATE userInfo SET address=? WHERE idnewUser=?");

			//ps.setInt(1,generatedKeys);
			ps.setString(1,new_address);
			ps.setInt(2, accountno);


			ps.executeUpdate();

			String querySql1 = "SELECT address FROM userInfo WHERE idnewUser="+accountno+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				
				String address = rs1.getString("address");
				
				System.out.println("Address is updated to "+address + " for the account number "+accountno);



			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}


	//Update phone number
	public static void updatePhone(int accountno, String new_phone)

	{

		try {

			Connection connection = DriverManager.getConnection(url,"root","root"); 
			PreparedStatement ps;
			//			
			//
			ps = connection.prepareStatement("UPDATE userInfo SET phone=? WHERE idnewUser=?");

			//ps.setInt(1,generatedKeys);
			ps.setString(1,new_phone);
			ps.setInt(2, accountno);


			ps.executeUpdate();

			String querySql1 = "SELECT phone FROM userInfo WHERE idnewUser="+accountno+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				
				String phone = rs1.getString("phone");
				
				System.out.println("Phone number is updated to "+phone + " for the account number "+accountno);



			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	//close the account

	public static void deleteAccount(int accountno, String username, int SSN) {
		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 
			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());
			PreparedStatement ps;
			ps = connection.prepareStatement("INSERT INTO deletedAccount(accountno,username,DATE) VALUES" +
					"(?,?,?)");
			ps.setInt(1,accountno);
			ps.setString(2, username);
			ps.setDate(3,sqlDate);
			ps.executeUpdate();
				System.out.println("Account number " + accountno +" is successfully deleted.");

			PreparedStatement ps1;
			ps1 = connection.prepareStatement("DELETE FROM userInfo WHERE idnewUser=?");

			ps1.setInt(1,accountno);

			ps1.executeUpdate();
			
			PreparedStatement ps2;
			ps2 = connection.prepareStatement("DELETE FROM deposits WHERE account_id=?");

			ps2.setInt(1,accountno);
		
			ps2.executeUpdate();
			
			PreparedStatement ps3;
			ps3 = connection.prepareStatement("DELETE FROM withdrawals WHERE account_id=?");

			ps3.setInt(1,accountno);
		
			ps3.executeUpdate();
			
			PreparedStatement ps4;
			ps4 = connection.prepareStatement("DELETE FROM Transfers WHERE account_id=?");

			ps4.setInt(1,accountno);
		
			ps4.executeUpdate();
			
			PreparedStatement ps5;
			ps5 = connection.prepareStatement("DELETE FROM hasBalance WHERE SSN=?");

			ps5.setInt(1,SSN);
		
			ps5.executeUpdate();
			
			PreparedStatement ps6;
			ps6 = connection.prepareStatement("DELETE FROM Statements WHERE account_id=?");

			ps6.setInt(1,accountno);
		
			ps6.executeUpdate();
			
			PreparedStatement ps7;
			ps7 = connection.prepareStatement("DELETE FROM chequeBookOrder WHERE account_id=?");

			ps7.setInt(1,accountno);
		
			ps7.executeUpdate();
			
			PreparedStatement ps8;
			ps8 = connection.prepareStatement("DELETE FROM USERS WHERE SSN=?");

			ps8.setInt(1,SSN);
		
			ps8.executeUpdate();

			PreparedStatement ps9;
			ps9 = connection.prepareStatement("DELETE FROM Statements WHERE account_id=?");

			ps9.setInt(1,accountno);
		
			ps9.executeUpdate();
			
			PreparedStatement ps10;
			ps10 = connection.prepareStatement("DELETE FROM chequeBookOrder WHERE account_id=?");

			ps10.setInt(1,accountno);
		
			ps10.executeUpdate();


			

		}
		catch (SQLException e) {

			e.printStackTrace();
		}
	}


	public static void Statement(int accountno,String username, String password,int SSN) {

		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 

			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());

			System.out.println("You requested statement on " + sqlDate + "\n");

			PreparedStatement ps;
			ps = connection.prepareStatement("INSERT INTO Statements(account_id,orderDate) VALUES" +
					"(?,?)");
			ps.setInt(1,accountno);

			ps.setDate(2,sqlDate);
			ps.executeUpdate();

			/////////////
			String querySql = "SELECT withdrawals.amount, withdrawals.DATE FROM withdrawals, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=withdrawals.account_id";
			Statement st=connection.createStatement();
			rs=st.executeQuery(querySql);
			System.out.println("Withdrawals");
			while(rs.next())
			{

				String withdrawal = rs.getString("amount");
				String date=rs.getString("DATE");


				String withdrawals=withdrawal + " on " + date + "\n";
				System.out.println(withdrawals);

			}

			String querySql1 = "SELECT deposits.amount, deposits.DATE FROM deposits, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=deposits.account_id";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			System.out.println("Deposits");

			while(rs1.next())
			{

				String deposit = rs1.getString("amount");
				String date=rs1.getString("DATE");


				String deposits=deposit + " on " + date + "\n";
				System.out.println(deposits);

			}
			
			String querySql4 = "SELECT transfers.amount, transfers.DATE FROM transfers, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=transfers.account_id";
			Statement st4=connection.createStatement();
			rs4=st4.executeQuery(querySql4);
			System.out.println("Transfers");

			while(rs4.next())
			{

				String transfer = rs4.getString("amount");
				String date=rs4.getString("DATE");


				String transfers=transfer + " on " + date + "\n";
				System.out.println(transfers);

			}
			String querySql2 = "SELECT balance FROM hasBalance WHERE SSN="+SSN+"";
			Statement st2=connection.createStatement();
			rs=st2.executeQuery(querySql2);
			while(rs.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String amount = rs.getString("balance");
				System.out.println("Total Balance --> "  +amount);

			}


		} catch (SQLException e) {

			e.printStackTrace();
		}


	}

	public static void orderCheque(int accountno, String username, String password) {
		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 

			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());

			System.out.println("You requested chequebook on " + sqlDate + "\n");

			PreparedStatement ps;
			ps = connection.prepareStatement("INSERT INTO chequeBookOrder(account_id,username, orderDate) VALUES" +
					"(?,?,?)");
			ps.setInt(1,accountno);
			ps.setString(2,username);
			ps.setDate(3,sqlDate);
			ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	
	public static void highToLowSort(int accountno, String username, String password) {
		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 

			java.util.Date now = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(now.getTime());

			System.out.println("You requested statement on " + sqlDate + "\n");

			PreparedStatement ps;
			ps = connection.prepareStatement("INSERT INTO Statements(account_id,orderDate) VALUES" +
					"(?,?)");
			ps.setInt(1,accountno);

			ps.setDate(2,sqlDate);
			ps.executeUpdate();

			/////////////
			String querySql = "SELECT withdrawals.amount, withdrawals.DATE FROM withdrawals, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=withdrawals.account_id ORDER BY amount DESC";
			Statement st=connection.createStatement();
			rs=st.executeQuery(querySql);
			System.out.println("Withdrawals");
			while(rs.next())
			{

				String withdrawal = rs.getString("amount");
				String date=rs.getString("DATE");


				String withdrawals=withdrawal + " on " + date + "\n";
				System.out.println(withdrawals);

			}

			String querySql1 = "SELECT deposits.amount, deposits.DATE FROM deposits, userInfo WHERE userInfo.idnewUser="+accountno+" AND userInfo.idnewUser=deposits.account_id ORDER BY amount DESC";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			System.out.println("Deposits");

			while(rs1.next())
			{

				String deposit = rs1.getString("amount");
				String date=rs1.getString("DATE");


				String deposits=deposit + " on " + date + "\n";
				System.out.println(deposits);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	
	public static void loanApply(int accountno, String loan_type, int amount,int SSN) {
		try {
			Connection connection = DriverManager.getConnection(url,"root","root"); 

			PreparedStatement ps;
			ps = connection.prepareStatement("INSERT INTO Loan(account_id, loantype, loan_amount) VALUES" +
					"(?,?,?)");
			ps.setInt(1,accountno);
			ps.setString(2,loan_type);
			ps.setInt(3, amount);
			
			ps.executeUpdate();
			
			String querySql = "SELECT * FROM Loan WHERE account_id="+accountno+"";
			Statement st=connection.createStatement();
			rs=st.executeQuery(querySql);
			while(rs.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				String loanNo = rs.getString("loan_number");
				String loanType = rs.getString("loantype");
				
			System.out.println("Loan Number for "+ loanType+" is "+ loanNo);
			}
			
			String querySql1 = "SELECT amount FROM userInfo WHERE SSN="+SSN+"";
			Statement st1=connection.createStatement();
			rs1=st1.executeQuery(querySql1);
			while(rs1.next())
			{
				// rs.getString(1); //or rs.getString("column name");
				int loan_status = rs1.getInt("amount");
				if(loan_status>4000) {
					System.out.println("\nYou are eligible for " + loan_type + " loan.");
					break;
				}
				else {
					System.out.println("\nYou are not eligible for " + loan_type + " loan.");
					break;
				}
				
				
			
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	
	


}
