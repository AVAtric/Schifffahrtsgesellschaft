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
        <h1 class="mt-5">Passagiere</h1>

        <sql:query var="passagiere"
                   sql="select pass.passagiernr, p.vorname, p.nachname, p.plz from passagier pass natural join person p order by Passagiernr" >
        </sql:query>
        <table class="table table-striped mt-4">
        <thead>
        <tr>
        <th scope="col">#</th>
        <th scope="col">Vorname</th>
        <th scope="col">Nachname</th>
        <th scope="col">PLZ</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="passagier" begin="0" items="${passagiere.rows}">
                <tr>
                <th scope="row">${passagier.passagiernr}</th>
                <td>${passagier.Vorname}</td>
                <td>${passagier.Nachname}</td>
                <td>${passagier.plz}</td>
                </tr>
        </c:forEach>
        </tbody>
        </table>
</div>