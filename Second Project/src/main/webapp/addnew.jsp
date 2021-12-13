<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>
  <title>G-Icon Pickup System</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #4CAF50">
         <div>
            <a href="index.jsp" class="navbar-brand"> G-Icon Pickup System </a>
          </div>
        </nav>
      </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Add Admin Details</h3>
                    <hr>
					<form action="" method="post">
					   <div class="form-group">
					   <label>Id</label>
					     <input type="text" class="form-control" name="id" placeholder="Your id"/>
					   </div>
					   	<div class="form-group">
					     <label>Name</label>
					     <input type="text" class="form-control" name="nm" placeholder="Your name"/>
					   </div>
					   <div class="form-group">
					     <label>Email</label>
					     <input type="email" class="form-control" name="em" placeholder="Your email"/>
					   </div>
					   <div class="form-group">
					     <label>Phone Number</label>
					     <input type="tel" class="form-control" name="pn" placeholder="Your phone number"/>
					   </div>
					   <div class="form-group">
					     <label>Address</label>
					     <textarea type="text" class="form-control" name="ad" placeholder="Your address"></textarea>
					   </div>
					   <button type="submit" class="btn btn-primary">Submit</button>
					   <a href="index.jsp" class="btn btn-default">Back</a>
					</form>
                </div>
</body>
</html>
<%
String a =request.getParameter("id");
String b = request.getParameter("nm");
String c = request.getParameter("em");
String d = request.getParameter("pn");
String e = request.getParameter("ad");


String DB_DRIVER = "org.postgresql.Driver";
String DB_HOST = "jdbc:postgresql://ec2-54-146-84-101.compute-1.amazonaws.com:5432" + "/d38i448keb3839";
String DB_USER = "ozmgzptfvjsyje";
String DB_PASSWORD = "49debb15c0caf37c0678ffffa7e0d3707669b2212c3eb42905a264ec261a9153";

Connection conn = null;
PreparedStatement stat = null;
Class.forName(DB_DRIVER).newInstance();
if(a!=null && b!=null && c!=null && d!=null & e!=null){
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	String data = "insert into crud(id,name,email,phone,address) values(?,?,?,?,?)";
	stat = conn.prepareStatement(data);
	stat.setString(1,a);
	stat.setString(2,b);
	stat.setString(3,c);
	stat.setString(4,d);
	stat.setString(5,e);
	stat.executeUpdate();
	response.sendRedirect("index.jsp");
}
%>
