import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.Scanner;


/**
 * Manage connection to database and perform SQL statements.
 */
public class BankingSystem {
	// Connection properties
	private static String driver;
	private static String url;
	private static String username;
	private static String password;

	// JDBC Objects
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	private static ResultSet rs1;

	private static String cusID;
	private static String cusPin;
	private static String Acc;



	/**
	 * Initialize database connection given properties file.
	 * @param filename name of properties file
	 */
	public static void init(String filename) {
		try {
			Properties props = new Properties();						// Create a new Properties object
			FileInputStream input = new FileInputStream(filename);	// Create a new FileInputStream object using our filename parameter
			props.load(input);										// Load the file contents into the Properties object
			driver = props.getProperty("jdbc.driver");				// Load the driver
			url = props.getProperty("jdbc.url");						// Load the url
			username = props.getProperty("jdbc.username");			// Load the username
			password = props.getProperty("jdbc.password");			// Load the password
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * Test database connection.
	 */
	public static void testConnection() {
		System.out.println(":: TEST - CONNECTING TO DATABASE");
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
			//con.close();
			System.out.println(":: TEST - SUCCESSFULLY CONNECTED TO DATABASE");
		} catch (Exception e) {
			System.out.println(":: TEST - FAILED CONNECTED TO DATABASE");
			e.printStackTrace();
		}
	}

	/**
	 * Create a new customer.
	 * @param name customer name
	 * @param gender customer gender
	 * @param age customer age
	 * @param pin customer pin
	 */
	public static void newCustomer(String name, String gender, String age, String pin){ 
		
		if (name.isEmpty() == false && gender.isEmpty() == false && age.isEmpty() == false && pin.isEmpty() == false ){
			System.out.println(":: CREATE NEW CUSTOMER - RUNNING");
			try {
				PreparedStatement ps = con.prepareStatement("Insert into P1.Customer(Name, Gender, Age, Pin) Values (?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2,gender);
				ps.setString(3,age);
				ps.setString(4,pin);

				ps.executeUpdate();
				ps.close();

			} catch (Exception e) {
				System.out.println("Exception in main()");
				e.printStackTrace();
			}
		}

		System.out.println(":: CREATE NEW CUSTOMER - SUCCESS");
	}


	/*Customer login
	 * @param id customer id
	 * @param pin customer pin
	 */
	public static boolean islogged(String id, String pin) {
		if (id.isEmpty() == false && pin.isEmpty() == false){
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery("select ID,Pin from P1.Customer where Id = " + id);
				while (rs.next()){
					cusID = rs.getString(1);
					cusPin = rs.getString(2);	
				}
				rs.close();
				stmt.close();
			} catch (Exception e) {
				System.out.println("Exception in main()");
				e.printStackTrace();
			}
		}
		if (pin.equals(cusPin)){
			System.out.println(":: Login - SUCCESS");
			return true ;
		} else {
			System.out.println(":: Login - FAILED");
			return false;		
		}
	}

	

	public static boolean validateAccount(String id, String AccNum){
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery("select Num from P1.Account where Id = " + cusID);
			while (rs.next()){
				Acc = rs.getString(1);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		return AccNum.contains(Acc);
	}



	/**
	 * Open a new account.
	 * @param id customer id
	 * @param type type of account
	 * @param amount initial deposit amount
	 */
	public static void openAccount(String id, String type, String amount)
	{
		if (id.isEmpty() == false && type.isEmpty() == false && amount.isEmpty() == false){
			try { 
				System.out.println(":: OPEN ACCOUNT - RUNNING");
				PreparedStatement ps = con.prepareStatement("Insert into P1.Account(Id, Balance , Type, Status) Values (?,?,?,?)");
				ps.setString(1, id);
				ps.setString(2,amount);
				ps.setString(3,type);
				ps.setString(4,"A");

				ps.executeUpdate();
				ps.close();
			} catch (Exception e) {
				System.out.println("Exception in main()");
				e.printStackTrace();
			}
		}

		System.out.println(":: OPEN ACCOUNT - SUCCESS");
	}



	/**
	 * Close an account.
	 * @param accNum account number
	 */
	public static void closeAccount(String accNum)
	{
		// if (validateAccount(cusID,accNum) == true){
		try {
			PreparedStatement ps = con.prepareStatement("update P1.Account set Status = ? , Balance = ? where Num = ?");
			ps.setString(1, "I");
			ps.setInt(2,0);
			ps.setString(3,accNum);

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		System.out.println(":: CLOSE ACCOUNT - SUCCESS");
//		} else {
//			System.out.println(":: CLOSE ACCOUNT - FAILED");
//		}

		
	}

	/**
	 * Deposit into an account.
	 * @param accNum account number
	 * @param amount deposit amount
	 */
	public static void deposit(String accNum, String amount)
	{
		try {
			System.out.println(":: DEPOSIT - RUNNING");
			PreparedStatement ps = con.prepareStatement("update P1.Account set Balance = Balance + ? where Num = ?");

			ps.setString(1, amount);
			ps.setString(2,accNum);

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		System.out.println(":: DEPOSIT - SUCCESS");
	}


	/**
	 * Withdraw from an account.
	 * @param accNum account number
	 * @param amount withdraw amount
	 */
	public static void withdraw(String accNum, String amount){
	//	if (validateAccount(cusID,accNum) == true){
		try {
			System.out.println(":: WITHDRAW - RUNNING");
			PreparedStatement ps = con.prepareStatement("update P1.Account set Balance = Balance - ? where Num = ?");

			ps.setString(1, amount);
			ps.setString(2,accNum);

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		System.out.println(":: WITHDRAW - SUCCESS");
//	} else {
//		System.out.println(":: WITHDRAW - FAILED");
//	}
	}


	/**
	 * Transfer amount from source account to destination account.
	 * @param srcAccNum source account number
	 * @param destAccNum destination account number
	 * @param amount transfer amount
	 */
	public static void transfer(String srcAccNum, String destAccNum, String amount)
	{  //if (validateAccount(cusID,srcAccNum) == true){
		try {
			PreparedStatement ps = con.prepareStatement("update P1.Account set Balance = Balance - ? where Num = ?");

			ps.setString(1, amount);
			ps.setString(2,srcAccNum);

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}

		try {
			PreparedStatement ps1 = con.prepareStatement("update P1.Account set Balance = Balance + ? where Num = ?");

			ps1.setString(1, amount);
			ps1.setString(2,destAccNum);

			ps1.executeUpdate();
			ps1.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		System.out.println(":: TRANSFER - SUCCESS");
//	} else {
//		System.out.println(":: TRANSFER - FAILED");
//	}
	}


	/**
	 * Display account summary.
	 * @param cusID customer ID
	 */
	public static void accountSummary(String cusID)
	{ 
		try {
			System.out.println(":: ACCOUNT SUMMARY - RUNNING");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select Num, Balance from P1.Account where STATUS != 'I' AND ID = " + cusID );					

			System.out.printf( "%-10s %-10s  ", "AccNum ", "Balance");
			System.out.printf( "\n%-10s %-10s  ", "----------", "---------");

			while(rs.next()) {
				int num = rs.getInt(1);
				int balance = rs.getInt(2);
				System.out.printf("\n%10s %10s",num , balance );
			}	
			 System.out.printf("\n%10s","--------------------------");
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		
		try {
			stmt = con.createStatement();
			 rs = stmt.executeQuery("select P1.Account.Id, sum (Balance) as total from P1.Account where id = "+ Integer.parseInt(cusID) + " group by P1.Account.Id");

			
			System.out.printf( "\n%-10s",  "TotalBalance");
			// System.out.printf( "\n%-10s", "---------");

			while(rs.next()) {
				int total = rs.getInt(2);
				System.out.printf("%10s ",total);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		System.out.println("\n:: ACCOUNT SUMMARY - SUCCESS");
	}

	/**
	 * Display Report A - Customer Information with Total Balance in Decreasing Order.
	 */
	public static void reportA()
	{
		try {
			System.out.println(":: REPORT A - RUNNING");
			stmt = con.createStatement();
	
			rs = stmt.executeQuery("select * from ReportA order by AccountBalance desc");
			System.out.printf( "\n%-10s %-10s %-10s %-10s %-10s ", "Id", "Name", "Gender","Age", "Balance");
			System.out.printf( "\n%-10s %-10s %-10s %-10s %-10s ", "----------", "---------", "----------","---------", "----------");

			
			while(rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				String age = rs.getString(3);
				String gender = rs.getString(4);
				int balance = rs.getInt(5);
				System.out.printf("\n%10s %-10s %-10s %10s %10s",id ,name, gender, age, balance);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}
		System.out.println("\n:: REPORT A - SUCCESS");
	}


	/**
	 * Display Report B - Customer Information with avg within age groups.
	 * @param min minimum age
	 * @param max maximum age
	 */
	public static void reportB(String min, String max)
	{
		try {
			stmt = con.createStatement();

			rs = stmt.executeQuery("select avg(AccountBalance) as Avg from reportA " + "where Age between " + Integer.parseInt(min) + "  AND "  + Integer.parseInt(max));
			System.out.printf( "\n%-10s", "Avg");
			System.out.printf( "\n%-10s", "----------");

			 while(rs.next()) {
				String avg = rs.getString(1);
				System.out.printf("\n%10s", avg);
			 }
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println("Exception in main()");
			e.printStackTrace();
		}

		System.out.println("\n:: REPORT B - SUCCESS");
	}
}
