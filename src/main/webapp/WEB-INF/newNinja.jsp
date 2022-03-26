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
    <title>New Ninja</title>
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="bg-dark">
    <main>
        <div class="container py-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>New Ninja</h4>
                        </div>
                        <div class="card-body">
                            <form:form id="newNinjaForm" action="/newNinja" method="post" modelAttribute="ninja">
                                <div class="form-group row py-1">
                                    <form:label path="dojo" class="col-md-4 col-form-label">Dojo :</form:label>
                                    <div class="col-md-8">
                                        <form:select path="dojo" class="form-control">
                                            <form:option value="">Choose a Dojo</form:option>
                                            <c:forEach items="${dojos}" var="dojo">
                                            <form:option value="${dojo.id}">
                                                <c:out value="${dojo.name}"/>
                                            </form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group row py-1">
                                    <form:label path="firstName" class="col-md-4 col-form-label">First Name :</form:label>
                                    <div class="col-md-8">
                                        <form:input type="text" path="firstName" class="form-control" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row py-1">
                                    <form:label path="lastName" class="col-md-4 col-form-label">Last Name :</form:label>
                                    <div class="col-md-8">
                                        <form:input type="text" path="lastName" class="form-control" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row py-1">
                                    <form:label path="age" class="col-md-4 col-form-label">Age: </form:label>
                                    <div class="col-md-8">
                                        <form:input type="number" path="age" class="form-control" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group row py-2">
                                    <div class="col"></div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>