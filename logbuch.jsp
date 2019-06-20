<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:setDataSource
        driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:xe"
        user="bic4a19_04"
        password="geuShio2"
/>
<div class="container">
<h1 class="mt-5">Logb&uuml;cher</h1>
<sql:query var="logbuecher"
           sql="select Angestelltennr, code, svnr, vorname, nachname from entlehnung
           natural join angestellter
           natural join person" >
    </sql:query>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Code</th>
        <th scope="col">SVNr</th>
        <th scope="col">Vorname</th>
        <th scope="col">Nachname</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="logbuch" begin="0" items="${logbuecher.rows}">
    <tr>
        <th scope="row">${logbuch.angestelltennr}</th>
        <td>${logbuch.code}</td>
        <td>${logbuch.svnr}</td>
        <td>${logbuch.vorname}</td>
        <td>${logbuch.nachname}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
    </div>