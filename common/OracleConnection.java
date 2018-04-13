import java.sql.*;

/**
- install JDK
- download ojdbc7.jar from http://download.oracle.com/otn/utilities_drivers/jdbc/121020/ojdbc7.jar
$ echo "7c9b5984b2c1e32e7c8cf3331df77f31e89e24c2" "ojdbc7.jar" | tee ojdbc7.sha1
$ sha1sum --check ojdbc7.sha1
$ export CLASSPATH=$(pwd):$(pwd)/ojdbc7.jar
$ javac OracleConnection.java
$ java -Djava.security.egd=file:///dev/urandom OracleConnection
*/

public class OracleConnection {
    public static void main(String[] args) throws Exception {
        System.out.println("Connecting to Oracle ...");
        //connect to database
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String serverName = "localhost";
        String portNumber = "1521";
        String sid = "orcl";
        String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
        String username = "scott";
        System.out.println("using URL "+ url +" and user "+ username +"...");
        String password = "passw0rt";
        Connection conn = DriverManager.getConnection(url, username, password);
        boolean reachable = conn.isValid(10);// 10 sec
        if ( reachable )
          System.out.println("INFO: connected");
        else
          System.out.println("ERROR: problems connecting, timout after 10 sec");
    }
}