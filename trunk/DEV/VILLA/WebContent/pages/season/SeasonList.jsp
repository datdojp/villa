<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<f:view>
<h:outputText value="#{msg.hello}" style="font-weight:bold" />
<h:outputText value="#{seasonBean.something}" style="font-weight:bold" />
<h:dataTable id="table1" value="#{seasonBean.allSeasons}" var="season">
	<f:facet name="header" />
	<h:column>
		<f:facet name="header">
			<h:outputText value="Begin year" />
		</f:facet>
		<h:outputText value="#{season.beginYear}" />
	</h:column>
	<h:column>
		<f:facet name="header">
			<h:outputText value="End year" />
		</f:facet>
		<h:outputText value="#{season.endYear}" />
	</h:column>
</h:dataTable>
</f:view>
</body>
</html>