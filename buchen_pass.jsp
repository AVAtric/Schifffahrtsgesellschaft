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
    <h1 class="mt-5">Fahrt buchen</h1>

    <sql:query var="passagen"
               sql="select * from passage">
    </sql:query>

    <sql:query var="buchungen"
               sql="select BUCHUNGSNR + 1 buchungs_num  from buchung WHERE ROWNUM = 1 order by BUCHUNGSNR desc">
    </sql:query>

    <sql:update var="insertPerson"
                sql="INSERT INTO PERSON VALUES (?, ?, ?, ?, ?, ?, ?)">
        <sql:param value="${param.SVNr}"/>
        <sql:param value="${param.Vorname}"/>
        <sql:param value="${param.Nachname}"/>
        <sql:param value="${param.PLZ}"/>
        <sql:param value="${param.Ort}"/>
        <sql:param value="${param.Strasse}"/>
        <sql:param value="${param.Hausnummer}"/>
    </sql:update>

    <sql:update var="insertPassagier"
                sql="INSERT INTO PASSAGIER VALUES (?, ?)">
        <sql:param value="${param.passagiernr}"/>
        <sql:param value="${param.SVNr}"/>
    </sql:update>

    <form action="index.jsp" method="post" class="mb-4">
        <input type="hidden" name="menu" id="menu" value="buchen_finish"/>
        <input type="hidden" name="passagiernr" id="passagiernr" value="${param.passagiernr}"/>
        <input type="hidden" name="buchungsnr" id="buchungsnr" value="${buchungen.rows[0].buchungs_num}"/>
        <input type="hidden" name="Vorname" id="Vorname" value="${param.Vorname}"/>
        <input type="hidden" name="Nachname" id="Nachname" value="${param.Nachname}"/>

        <div class="form-group">
            <label for="passagennr">Passage</label>
            <select class="form-control" id="passagennr" name="passagennr">
                <c:forEach var="passage" begin="0" items="${passagen.rows}">
                    <option value="${passage.passagennr}">${passage.abfahrtshafen} - ${passage.zielhafen} (${passage.abfahrtszeit} - ${passage.ankunftszeit})</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="klasse">Klasse</label>
            <select class="form-control" id="klasse" name="klasse">
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
            </select>
        </div>

        <div class="form-group">
            <label for="buchungsdatum">Datum</label>
            <input data-provide="datepicker" class="form-control" id="buchungsdatum" name="buchungsdatum">
        </div>

        <button type="submit" class="btn btn-primary">Buchen</button>
    </form>
</div>


