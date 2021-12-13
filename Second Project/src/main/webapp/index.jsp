<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

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
                    <h3 class="text-center">List of Admin Details</h3>
                    <hr>
    <div class="col-md-6">
         <a href="addnew.jsp" class="btn btn-primary">Add New Data</a>
    </div>
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead>
       <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Email</th>
         <th>Phone</th>
         <th>Address</th>
         <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
       <%
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-54-146-84-101.compute-1.amazonaws.com:5432" + "/d38i448keb3839";
       String DB_USER = "ozmgzptfvjsyje";
       String DB_PASSWORD = "49debb15c0caf37c0678ffffa7e0d3707669b2212c3eb42905a264ec261a9153";
       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       stat = conn.createStatement();
       String data = "select * from crud order by id asc";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td><%=res.getString("id")%></td>
         <td><%=res.getString("name")%></td>
         <td><%=res.getString("email")%></td>
         <td><%=res.getString("phone")%></td>
         <td><%=res.getString("address")%></td>
         <td class="text-center">
           <a href='edit.jsp?u=<%=res.getString("id")%>' class="btn btn-warning">Edit</a>
           <a href='delete.jsp?d=<%=res.getString("id")%>' class="btn btn-danger">Delete</a>
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
</div>
</body>
</html>