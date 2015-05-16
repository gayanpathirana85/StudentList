<%--
  Created by IntelliJ IDEA.
  User: gayanp
  Date: 5/15/15
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Students List</title>
    <script src="/js/jquery.min.js" type="text/javascript"></script>
    <script src="/js/jquery-1.10.2.js"></script>
    <script src="/js/jquery-ui.js"></script>
    <link rel="stylesheet" href="/css/layout.css"/>
    <link rel="stylesheet" href="/css/jquery-ui.css">

</head>
<body class="thebody">
<div>
    <h2>Add New Student</h2>
</div>
<!-- Table goes in the document BODY -->
<div>


    <table class="student_table" align="center">

        <tr>
            <th>Student Number</th>
            <th>Preferred Name</th>
            <th>Birth Date</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Disability Status</th>
            <th>Email</th>

        </tr>

        <tr>
            <td><input type='text' id="studentNumber"/></td>
            <td><input type='text' id="preferredName"/></td>
            <td><input type='text' id="birthDate"/></td>
            <td><input type='text' id="firstName"/></td>
            <td><input type='text' id="lastName"/></td>
            <td><select id='gender'>
                <option value="null">Select</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>

            </select></td>
            <td><select id='disability'>
                <option value="null">Select</option>
                <option value="True">True</option>
                <option value="False">False</option>

            </select>
            </td>


            <td><input type='text' id="email"/></td>
        </tr>

    </table>

    <p align="center">
        <button type="button" onclick="addStudent()">save</button>
        <button type="button" onclick="window.location.href='/displayAllStudents'">Cancle</button>
    </p>

</div>

<script type="text/javascript">


    function addStudent() {

        if (!$("#studentNumber").val().match(/^\d+/)) {
            alert("Please only enter numeric characters only for Student Number (Allowed input:0-9)")
        } else if (!validateEmail($("#email").val())) {

            alert("Please only enter valid Email Address")
        }
         else if ($("#birthDate").val()=="" ||$("#birthDate").val()==null) {

            alert("Please select Birth Date")
        }
        else {

            $.post("/addStudent",
            {
                number:  $("#studentNumber").val(),
                preferredName: $("#preferredName").val(),
                birthDate: $("#birthDate").val(),
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                gender: $("#gender").val(),
                disability: $("#disability").val(),
                email: $("#email").val()
            },
                  function(data, status) {
                      alert("New Student added Succesfully !!")
                      window.location.href = '/displayAllStudents'
                  });
        }
    }

    $(function() {
        $("#birthDate").datepicker();
    });

    function validateEmail(email) {

        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }


</script>

</body>
</html>
