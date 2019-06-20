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

    <sql:query var="passage"
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

    <c:if test="${insertPerson == 1 && insertPassagier == 1}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            Es wurde erfolgreich ein Passagier hinzugef&uuml;gt!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>

    <c:if test="${insertPerson != 1 && insertPassagier != 1}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            Es ist ein Fehler beim Speichern aufgetreten!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>

    <form action="index.jsp" method="post" class="mb-4">
        <input type="hidden" name="menu" id="menu" value="buchen_finish"/>
        <input type="hidden" name="passagiernr" id="passagiernr" value="${param.passagiernr}"/>
        <input type="hidden" name="Vorname" id="Vorname" value="${param.Vorname}"/>
        <input type="hidden" name="Nachname" id="Nachname" value="${param.Nachname}"/>


        <div class="form-group">
            <label for="Ort">Wohnort</label>
            <input type="text" class="form-control" id="Ort" name="Ort">
        </div>

        <div class="form-group">
            <label for="Strasse">Strassenname</label>
            <input type="text" class="form-control" id="Strasse" name="Strasse">
        </div>

        <div class="form-group">
            <label for="Hausnummer">Hausnummer</label>
            <input type="text" class="form-control" id="Hausnummer" name="Hausnummer">
        </div>

        <button type="submit" class="btn btn-primary">Weiter</button>
    </form>
</div>


