<!DOCTYPE html>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="de">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Fahrtenverwaltung</title>

    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="d-flex flex-column h-100">
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">Fahrtenverwaltung</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item ${param.menu=='fahrten' ? 'active' : ''}"">
                    <a class="nav-link href="index.jsp?menu=fahrten">Fahrten</a>
                </li>
                <li class="nav-item ${param.menu=='buchen' ? 'active' : ''}"">
                    <a class="nav-link" href="index.jsp?menu=buchen">Fahrt buchen</a>
                </li>
                <li class="nav-item ${param.menu=='logbuch' ? 'active' : ''}"">
                    <a class="nav-link" href="index.jsp?menu=logbuch">Logbücher</a>
                </li>
                <li class="nav-item ${param.menu=='passagiere' ? 'active' : ''}"">
                    <a class="nav-link" href="index.jsp?menu=passagiere">Passagierliste</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<!-- Begin page content -->
<main role="main" class="flex-shrink-0">

        <c:if test="${!empty param.menu}">
            <jsp:include page="${param.menu}.jsp" />
        </c:if>
        <c:if test="${empty param.menu}">
            <jsp:include page="start.jsp" />
        </c:if>
    </div>
</main>

<footer class="footer mt-auto py-3">
    <div class="container">
        <span class="text-muted">&copy; FH Technikum Wien</span>
    </div>
</footer>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
