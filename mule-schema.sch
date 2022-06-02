<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" queryBinding="xslt2">
    <sch:ns prefix="defaultNs" uri="http://www.mulesoft.org/schema/mule/core"/>
    <sch:ns prefix="ee" uri="http://www.mulesoft.org/schema/mule/ee/core"/>
    <sch:pattern name="Check Dataweave">
        <sch:rule context="//ee:transform//ee:set-payload">
            <sch:assert test="@resource">The Dataweave must be externalised</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
