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
<h1 class="mt-5">Fahrten</h1>
<sql:query var="passagen"
           sql="select * from passage" >
    </sql:query>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Abfahrtshafen</th>
        <th scope="col">Zielhafen</th>
        <th scope="col">Abfahrt</th>
        <th scope="col">Ankunft</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="passage" begin="0" items="${passagen.rows}">
    <tr>
        <th scope="row">{passage.passagennr}</th>
        <td>{passage.abfahrtshafen}</td>
        <td>{passage.zielhafen}</td>
        <td>{passage.abfahrtszeit}</td>
        <td>{passage.ankunftszeit}</td>
    </tr>
    </c:forEach>
    </tbody>
</table>