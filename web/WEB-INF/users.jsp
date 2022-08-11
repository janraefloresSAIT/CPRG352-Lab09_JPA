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
                        <td><a href="user?action=edit&amp;email=${user.email}">Edit</a></td>
                        <td><a href="user?action=delete&amp;email=${user.email}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
        <div class="addUser">
            <h2>Add User:</h2>
            <form action="user" method="POST">
                <input type="text" name="addFName" value="${addFName}">
                <br>
                <input type="text" name="addLName" value="${addLName}">
                <br>
                <input type="email" name="addEmail" value="${addEmail}">
                <br>
                <input type="password" name="addPassword" value="${addPassword}">
                <br>
                <select name="addRole">
                    <option>Select Role</option>
                    <c:forEach items="${roles}" var="role">
                       <option ${addRole == "${role.rName}"?"selected":""} value="${role.rName}">${role.rName}</option>
                    </c:forEach>
                </select>
                <input type="radio" name="isActive" value="true"> Active
                <br>
                <input type="radio" name="isActive" value="false"> Inactive
                <br>
                <input type="submit" value="Add User">
                <input type="hidden" name="action" value="add">
            </form>
        </div>
        
        <div class="editUser">
            <h2>Edit Selected User:</h2>
            <form action="user" method="POST">
                <input type="text" name="editFName" value="${editFName}">
                <br>
                <input type="text" name="editLName" value="${editLName}">
                <br>
                <input type="email" name="editEmail" value="${editEmail}">
                <br>
                <input type="password" name="editPassword" value="${editPassword}">
                <br>
                <select name="editRole">
                    <option>Select New Role</option>
                    <c:forEach items="${roles}" var="role">
                       <option ${editRole == "${role.rName}"?"selected":""} value="${role.rName}">${role.rName}</option>
                    </c:forEach>
                </select>
                <input type="radio" name="editActive" value="true"> Active
                <br>
                <input type="radio" name="editActive" value="false"> Inactive
                <br>
                <input type="submit" value="Edit User">
                <input type="hidden" name="action" value="edit">
            </form>
        </div>
    </body>
</html>
