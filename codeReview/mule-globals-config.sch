<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" queryBinding="xslt2">
    <sch:ns prefix="defaultNs" uri="http://www.mulesoft.org/schema/mule/core"/>
    <sch:ns prefix="ee" uri="http://www.mulesoft.org/schema/mule/ee/core"/>
    <sch:ns prefix="apikit" uri="http://www.mulesoft.org/schema/mule/mule-apikit"/>
    <sch:ns prefix="http" uri="http://www.mulesoft.org/schema/mule/http"/>
    <sch:ns prefix="tls" uri="http://www.mulesoft.org/schema/mule/tls"/>
    <sch:ns prefix="secure-properties" uri="http://www.mulesoft.org/schema/mule/secure-properties"/>
    
    <sch:pattern name="Check HTTP Listener Configurations">
        <sch:rule context="//http:listener-config//http:listener-connection">
            <sch:assert test="starts-with(@host,'$')">HTTP Listener host should be configurable and hence should be in YAML file</sch:assert>
            <sch:assert test="starts-with(@port,'$')">HTTP Listener port should be configurable and hence should be in YAML file</sch:assert>
            <sch:assert test="@protocol = 'HTTPS'">HTTP Listener protocol should be HTTPS</sch:assert>
            <sch:assert test="tls:context">TLS Should be set in HTTP Listener</sch:assert>
            <sch:assert test="tls:context/tls:key-store">Keystore Should be set in HTTP Listener</sch:assert>
        </sch:rule>
        <sch:rule context="//http:listener-config//http:listener-connection/tls:context/tls:key-store">
            <sch:assert test="starts-with(@path,'$')">HTTP Listener Keystore Path should be configurable and hence should be in YAML file</sch:assert>
            <sch:assert test="starts-with(@keyPassword,'${secure')">HTTP Listener Keystore Key password should be configurable and hence should be in YAML file with encyrpted value</sch:assert>
            <sch:assert test="starts-with(@password,'${secure')">HTTP Listener Keystore password should be configurable and hence should be in YAML file with encyrpted value</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern name="Check Secure Configurations">
        <sch:rule context="//secure-properties:config">
            <sch:assert test="@file='properties/${env}.yaml'">Properties files should be stored in properties package, hence set it as "properties/${env}.yaml"</sch:assert>
            <sch:assert test="@key='${secureKey}'">Use encryption key as "secureKey"</sch:assert>
            <sch:assert test="//secure-properties:encrypt">Use Blowfish encryption algorithm</sch:assert>
        </sch:rule>
         <sch:rule context="//secure-properties:config/secure-properties:encrypt">
            <sch:assert test="@algorithm='Blowfish'">Use Blowfish encryption algorithm</sch:assert>
         </sch:rule>
    </sch:pattern>
</sch:schema>
