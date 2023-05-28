<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
 <%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.lang.*" %>

 <%
	ResultSet resultset=null;
	Statement statement=null;
	java.sql.Connection connection=null;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdetails","root","17112001");
		statement=connection.createStatement();
		String sql="select * from studentprofile";
		resultset = statement.executeQuery(sql);
		%>
    <h1>Student Information</h1>
    <table>
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
            <th>Tamil Mark</th>
            <th>English Mark</th>
            <th>Maths Mark</th>
            <th>Science Mark</th>
            <th>Social Mark</th>
            <th>Total</th>
        </tr>
        <% 

        while(resultset.next())
		{
        %>
       		 <tr>
            <td><%= resultset.getInt(1) %></td>
            <td><%= resultset.getString(2) %></td>
            <td><%= resultset.getInt(3) %></td>
            <td><%= resultset.getInt(4) %></td>
            <td><%= resultset.getInt(5) %></td>
            <td><%= resultset.getInt(6) %></td>
            <td><%= resultset.getInt(7) %></td>
            <td><%= resultset.getInt(8)%></td>
       	 </tr>
       	 <%} %>
    </table>
    <% 	
		}
		catch(Exception e)
		{
			out.println("error: "+e);
		}
	%>
</body>
</html>