package test;

// 加载必需的库
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 
public class ShowStudent extends HttpServlet{
    
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
      //JDBC驱动器名称和数据库的 URL
      final String JDBC_DRIVER="com.mysql.jdbc.Driver";
      final String DB_URL="jdbc:mysql://localhost:3306/student";

      //数据库的凭据
      final String USER = "root";
      final String PASS = "root";

      //设置响应内容类型
      response.setContentType("text/html;charset=utf8");
      PrintWriter out = response.getWriter();
      String title = "数据库结果";
      String docType =
        "<!doctype html public \"-//w3c//dtd html 4.0 " +
         "transitional//en\">\n";
      out.println(docType +
         "<html>\n" +
         "<head><title>" + title + "</title></head>\n" +
         "<body bgcolor=\"#f0f0f0\">\n" +
         "<h1 align=\"center\">" + title + "</h1>\n");
      Connection conn = null;
      Statement stmt = null;
      try{
         //注册JDBC驱动器
         Class.forName(JDBC_DRIVER);
         //打开一个连接
         conn = DriverManager.getConnection(DB_URL,USER,PASS);
         //执行SQL查询
         stmt = conn.createStatement();
         String sql;
         sql = "SELECT * FROM newstudent";
         ResultSet rs = stmt.executeQuery(sql);
         //从结果集中提取数据
         while(rs.next()){
            //根据列名称检索
            int age = rs.getInt("age");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            //显示值
            out.println("Age: " + age + "<br>");
            out.println("Name: " + name + "<br>");
            out.println("Phone: " + phone + "<br>");
            out.println("<hr>");
         }
         out.println("</body></html>");
         //清理环境
         rs.close();
         stmt.close();
         conn.close();
      }catch(SQLException se){
         //处理JDBC错误
         se.printStackTrace();
      }catch(Exception e){
         //处理Class.forName错误
         e.printStackTrace();
      }finally{
         //最后是用于关闭资源的块
         try{
            if(stmt!=null)
               stmt.close();
         }catch(SQLException se2){
         }
         try{
            if(conn!=null)
            conn.close();
         }catch(SQLException se){
            se.printStackTrace();
         }
      }
   }
} 