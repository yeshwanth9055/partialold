<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>CCH Scan</label>
    <protected>false</protected>
    <values>
        <field>copado__Active__c</field>
        <value xsi:type="xsd:boolean">true</value>
    </values>
    <values>
        <field>copado__Description__c</field>
        <value xsi:type="xsd:string">Compliance Scan Result</value>
    </values>
    <values>
        <field>copado__Subject__c</field>
        <value xsi:type="xsd:string">Compliance Scan Result - {ResultName}</value>
    </values>
    <values>
        <field>copado__Template__c</field>
        <value xsi:type="xsd:string">Hi {UserName},

&lt;br/&gt;&lt;br/&gt;

The Copado Compliance Scan &lt;b&gt;&lt;a href=&quot;{ResultLink}&quot;&gt;{ResultName}&lt;/a&gt;&lt;/b&gt; was completed, there is at least one Rule out of Compliance. 

&lt;br/&gt;

Please visit the &lt;b&gt;&lt;a href=&quot;{JobExecutionLink}&quot;&gt;Job Execution&lt;/a&gt;&lt;/b&gt; or the &lt;b&gt;&lt;a href=&quot;{ResultLink}&quot;&gt;Result&lt;/a&gt;&lt;/b&gt; for more information and the full list of violations.</value>
    </values>
</CustomMetadata>
