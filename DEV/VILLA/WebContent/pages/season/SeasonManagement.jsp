<jsp:include page="../common/include.jsp"></jsp:include>
<html>
<body>
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
</body>
</html>