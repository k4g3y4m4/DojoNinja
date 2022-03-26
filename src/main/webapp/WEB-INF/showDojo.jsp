<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formato (fechas) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- para errores de renderizado en rutas PUT -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${dojo.name} Location Ninjas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/styles.css"> <!-- change to match your file/naming structure -->
</head>
<body class="bg-dark">
    <main>
        <div class="container py-5">
            <div class="card">
                <div class="card-header">
                    <h1>${dojo.name} Location Ninjas</h1>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">First Name</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">Age</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${dojo.getListaNinjas()}" var="ninja">
                            <tr>
                                <td><c:out value="${ninja.firstName }"/></td>
                                <td><c:out value="${ninja.lastName }"/></td>
                                <td><c:out value="${ninja.age }"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                   <div class="row">
                       <div class="col"></div>
                       <div class="col-auto">
                           <a href="/"><button type="button" class="btn btn-primary">Back</button></a>
                           <a href="/ninjas/new"><button type="button" class="btn btn-success">New Ninja</button></a>
                       </div>
                   </div>
                </div>
            </div>
        </div>
    </main>


</body>
</html>