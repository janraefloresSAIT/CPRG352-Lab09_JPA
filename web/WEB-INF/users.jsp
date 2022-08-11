<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Database</title>
    </head>
    <body>
        <div class="viewManage">
            <h1>View & Manage Users</h1>
            <table cellpadding="5" border="1">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.fName}</td>
                        <td>${user.lName}</td>
                        <td>${user.email}</td>
                        <td>${user.role}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.active == false}">
                                    Inactive
                                </c:when>
                                <c:otherwise>
                                    Active
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:url value="/users" var="editURL">
                                <c:param name="action" value="edit"/>
                                <c:param name="email" value="${user.email}"/>
                            </c:url>
                            <a href="${editURL}">Edit</a>
                        </td>
                        <td>
                            <c:url value="/users" var="deleteURL">
                                <c:param name="action" value="delete"/>
                                <c:param name="email" value="${user.email}"/>
                            </c:url>
                            <a href="${deleteURL}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="addUser">
            <h2>Add User:</h2>
            <form action="" method="POST">
                <label>First Name:</label>
                <input type="text" name="addFName" value="${addFName}">
                <br>
                <label>Last Name:</label>
                <input type="text" name="addLName" value="${addLName}">
                <br>
                <label>Email:</label>
                <input type="email" name="addEmail" value="${addEmail}">
                <br
                <label>Password:</label>
                <input type="password" name="addPass" value="${addPass}">
                <br>
                <select name="addRole">
                    <option>Select Role</option>
                    <c:forEach items="${roles}" var="role">
                        <option ${addRole == "${role.rName}"?"selected":""} value="${role.rName}">${role.rName}</option>
                    </c:forEach>
                </select>
                <br>
                <label>User Activity:</label>
                <input type="radio" name="isActive" value="true"> Active
                <input type="radio" name="isActive" value="false"> Inactive
                <br>
                <input type="submit" value="Add User">
                <input type="hidden" name="action" value="add">
            </form>
        </div>

        <div class="editUser">
            <h2>Edit Selected User:</h2>
            <form action="" method="POST">
                <label>First Name:</label>
                <input type="text" name="editFName" value="${user.fName}">
                <br>
                <label>Last Name:</label>
                <input type="text" name="editLName" value="${user.lName}">
                <br>
                <label>Email:</label>
                <input type="email" name="editEmail" value="${user.email}">
                <br>
                <label>Password:</label>
                <input type="password" name="editPass" value="${user.password}">
                <br>
                <select name="editRole">
                    <option>Select Role</option>
                    <c:forEach items="${roles}" var="role">
                        <option value="${role.rName}">${role.rName}</option>
                    </c:forEach>
                </select>
                <br>
                <label>User Activity:</label>
                <input type="radio" name="editActive" value="true"> Active
                <input type="radio" name="editActive" value="false"> Inactive
                <br>
                <input type="submit" value="Edit User">
                <input type="hidden" name="action" value="edit">
            </form>
        </div>
    </body>
</html>
