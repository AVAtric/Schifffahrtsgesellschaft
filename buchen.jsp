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
        <sql:query var="passagier"
                   sql="select passagiernr from passagier order by Passagiernr desc">
        </sql:query>


            <c:if test="${!empty param.insertpass}">

                    <sql:update var="insertPerson"
                                sql="INSERT INTO PERSON VALUES (?, ?, ?, ?, ?, ?, ?)">
                            <sql:param value="${param.SVNr}" />
                            <sql:param value="${param.Vorname}" />
                            <sql:param value="${param.Nachname}" />
                            <sql:param value="${param.PLZ}" />
                            <sql:param value="${param.Ort}" />
                            <sql:param value="${param.Strasse}" />
                            <sql:param value="${param.Hausnummer}" />
                    </sql:update>

                    <sql:update var="insertPassagier"
                                sql="INSERT INTO PASSAGIER VALUES (?, ?)">
                            <sql:param value="${param.passagiernr}" />
                            <sql:param value="${param.SVNr}" />
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
            </c:if>


        <form action="index.jsp" method="post" class="mb-4">
            <input type="hidden" name="menu" id="menu" value="buchen"/>
            <input type="hidden" name="passagiernr" id="passagiernr" value="${passagier.rows[0].passagiernr +1}"/>
            <input type="hidden" name="insertpass" id="insertpass" value="1"/>


        <div class="form-group">
        <label for="SVNr">Bitte geben Sie Ihre Sozialversicherungsnummer ein</label>
        <input type="text" class="form-control" id="SVNr" name="SVNr" aria-describedby="SVNrHelp">
        <small id="SVNrHelp" class="form-text text-muted">Ihre SVNr muss 10-stellig sein</small>
        </div>

            <div class="form-group">
            <label for="Vorname">Bitte geben Sie Ihren Vornamen ein</label>
            <input type="text" class="form-control" id="Vorname" name="Vorname">
            </div>

            <div class="form-group">
            <label for="Nachname">Bitte geben Sie Ihren Nachnamen ein</label>
            <input type="text" class="form-control" id="Nachname" name="Nachname">
            </div>

            <div class="form-group">
            <label for="PLZ">Bitte geben Sie anschliessend Ihre Postleitzahl an</label>
            <input type="text" class="form-control" id="PLZ" name="PLZ" aria-describedby="PLZHelp" >
            <small id="PLZHelp" class="form-text text-muted">In &Ouml;sterreich muss die PLZ aus 4 Zahlen bestehen</small>
            </div>

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


        <button type="submit" class="btn btn-primary">Submit</button>
        </form>

        </div>

