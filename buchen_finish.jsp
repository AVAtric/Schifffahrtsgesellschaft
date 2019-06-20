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
    <sql:update var="insertBuchung"
                sql="INSERT INTO BUCHUNG VALUES (?, ?, ?, TO_DATE(?, 'MM/DD/YYYY'), ?)">
        <sql:param value="${param.buchungsnr}"/>
        <sql:param value="${param.passagiernr}"/>
        <sql:param value="${param.passagennr}"/>
        <sql:param value="${param.buchungsdatum}"/>
        <sql:param value="${param.klasse}"/>
    </sql:update>

    <div class="jumbotron jumbotron-fluid mt-4">
        <div class="container">
            <h1 class="display-4">Buchung abgeschlossen</h1>
            <p class="lead">F&uuml;r den Passagier ${param.Vorname} ${param.Nachname} wurde die Buchung erfolgreich durchgef&uuml;rt.</p>
        </div>
    </div>

</div>


