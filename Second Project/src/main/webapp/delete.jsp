<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("d");

String DB_DRIVER = "org.postgresql.Driver";
String DB_HOST = "jdbc:postgresql://ec2-54-146-84-101.compute-1.amazonaws.com:5432" + "/d38i448keb3839";
String DB_USER = "ozmgzptfvjsyje";
String DB_PASSWORD = "49debb15c0caf37c0678ffffa7e0d3707669b2212c3eb42905a264ec261a9153";

Class.forName(DB_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_HOST,DB_USER,DB_PASSWORD);
Statement stat = conn.createStatement();
stat.executeUpdate("delete from crud where id='"+id+"'");
response.sendRedirect("index.jsp");
%>


