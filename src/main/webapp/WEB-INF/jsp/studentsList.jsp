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
    <h2>Students Information System</h2>
</div>
<!-- Table goes in the document BODY -->
<div>
    <table class="imagetable" align="center">
        <tr>
            <th>
                <button type="button" onclick="window.location.href='/addNewStudent'">Add New</button>
            </th>

        </tr>
        <tr>
            <th>Student Number</th>
            <th>Preferred Name</th>
            <th>Birth Date</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Disability Status</th>
            <th>Email</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>

        <c:forEach items="${studentsMap}" var="entry" varStatus="status">

            <tr id="${entry.value.studentNumber}">
                <td><input size="20" type='text' value='${entry.value.studentNumber}' disabled="true"
                           id="studentNumber${entry.value.studentNumber}"/></td>
                <td><input type='text' value='${entry.value.preferredName}' disabled="true"
                           id="preferredName${entry.value.studentNumber}"/></td>
                <td><input type='text' value='${entry.value.birthDate}' disabled="true"
                           id="birthDate${entry.value.studentNumber}" onclick="pickDate(${entry.value.studentNumber})"/>
                </td>
                <td><input type='text' value='${entry.value.firstName}' disabled="true"
                           id="firstName${entry.value.studentNumber}"/></td>
                <td><input type='text' value='${entry.value.lastName}' disabled="true"
                           id="lastName${entry.value.studentNumber}"/></td>

                <td><select disabled="true" id="gender${entry.value.studentNumber}">
                    <option value='${entry.value.gender}'>${entry.value.gender}</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>

                </select></td>
                <td><select id="disability${entry.value.studentNumber}" disabled="true">
                    <option value='${entry.value.disability}'>${entry.value.disability}</option>
                    <option value="True">True</option>
                    <option value="False">False</option>

                </select>
                </td>

                <td><input type='text' value='${entry.value.email}' disabled="true"
                           id="email${entry.value.studentNumber}"/></td>
                <td>
                    <button type="button" onclick="editStudent(${entry.value.studentNumber})">Edit</button>
                </td>
                <td>
                    <button type="button" onclick="saveStudent(${entry.value.studentNumber})"
                            style="background:#7fff00">save
                    </button>
                </td>
                <td>
                    <button type="button" onclick="deleteStudent(${entry.value.studentNumber},${status.index})"
                            style="background:red">Delete!
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>


</div>

<script type="text/javascript">

    // enable all the input boxes
    function editStudent(id) {


        $("#preferredName" + id).removeAttr("disabled");
        $("#birthDate" + id).removeAttr("disabled");
        $("#firstName" + id).removeAttr("disabled");
        $("#lastName" + id).removeAttr("disabled");
        $("#gender" + id).removeAttr("disabled");
        $("#disability" + id).removeAttr("disabled");
        $("#email" + id).removeAttr("disabled");
    }


    function saveStudent(id) {


        if (!validateEmail($("#email" + id).val())) {

            alert("Please only enter valid Email Address")
        }
        else {

            $.post("/updateStudent",
            {
                number:  $("#studentNumber" + id).val(),
                preferredName: $("#preferredName" + id).val(),
                birthDate: $("#birthDate" + id).val(),
                firstName: $("#firstName" + id).val(),
                lastName: $("#lastName" + id).val(),
                gender: $("#gender" + id).val(),
                disability: $("#disability" + id).val(),
                email: $("#email" + id).val()
            },
                  function(data, status) {


                      $("#preferredName" + id).attr("disabled", true);
                      $("#birthDate" + id).attr("disabled", true);
                      $("#firstName" + id).attr("disabled", true);
                      $("#lastName" + id).attr("disabled", true);
                      ;
                      $("#gender" + id).attr("disabled", true);
                      $("#disability" + id).attr("disabled", true);
                      $("#email" + id).attr("disabled", true);
                  });
        }
    }

    function deleteStudent(id, rwID) {

        $.post("/deleteStudent",
        {
            number:  $("#studentNumber" + id).val()
        },
              function(data, status) {
                  $("#" + id).remove();

              });


    }
    function pickDate(id) {
        $("#birthDate" + id).datepicker();
    }

    function validateEmail(email) {

        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

</script>

</body>
</html>
