<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" queryBinding="xslt2">
    <sch:ns prefix="defaultNs" uri="http://www.mulesoft.org/schema/mule/core"/>
    <sch:ns prefix="ee" uri="http://www.mulesoft.org/schema/mule/ee/core"/>
    <sch:ns prefix="apikit" uri="http://www.mulesoft.org/schema/mule/mule-apikit"/>
    <sch:ns prefix="http" uri="http://www.mulesoft.org/schema/mule/http"/>

    <sch:pattern name="Check Dataweave">
        <sch:rule context="//ee:transform//ee:set-payload">
            <sch:assert test="@resource">The Dataweave must be externalised</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Check HTTPS Listener">
        <sch:rule context="//http:listener">
            <sch:assert test="starts-with(@path,'$')">HTTP Listener path should not be hardcoded</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Check HTTPS Requestor">
        <sch:rule context="//http:request">
            <sch:assert test="starts-with(@path,'$')">HTTP Requestor path should not be hardcoded</sch:assert>
            <sch:assert test="starts-with(@method,'$')">HTTP Requestor method should not be hardcoded</sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Check Parallel For Each">
        <sch:rule context="//parallel-foreach ">
           <sch:assert test="@maxConcurrency">Parallel for each should be configured with maxConcurrency</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
