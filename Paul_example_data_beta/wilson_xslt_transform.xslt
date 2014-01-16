<?xml version="1.0" encoding="UTF-8"?>

<!-- Simple example that at least does something. -->
<xsl:stylesheet version="2.0"
                xmlns="http://www.openarchives.org/OAI/2.0/static-repository"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mml="http://www.w3.org/1998/Math/MathML"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:dcterms="http://purl.org/dc/terms/"
                xmlns:oai="http://www.openarchives.org/OAI/2.0/" 
                xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"  
                exclude-result-prefixes="mml xsi" >
<xsl:strip-space elements="*" />
<xsl:output method ="xml" indent="yes" />

    <!-- start processing at the top-level element -->
<xsl:template match="/">
<Repository>
    <Identify>
    <oai:repositoryName></oai:repositoryName>
    <oai:baseURL></oai:baseURL>
    <oai:protocolVersion>2.0</oai:protocolVersion>
    <oai:adminEmail></oai:adminEmail>
    <oai:earliestDatestamp></oai:earliestDatestamp>

    <oai:deletedRecord>no</oai:deletedRecord>
    <oai:granularity>YYYY-MM-DD</oai:granularity>
  </Identify>
  <ListMetadataFormats>
    <oai:metadataFormat>
      <oai:metadataPrefix>oai_dc</oai:metadataPrefix>
      <oai:schema>http://www.openarchives.org/OAI/2.0/oai_dc.xsd</oai:schema>
      <oai:metadataNamespace>http://www.openarchives.org/OAI/2.0/oai_dc/</oai:metadataNamespace>
    </oai:metadataFormat>

  </ListMetadataFormats>

  <ListRecords metadataPrefix="oai_dc">
    <xsl:apply-templates/>
  </ListRecords>
</Repository>
</xsl:template>


<xsl:template match="doc">
    <oai:record>
      <oai:header>
        <oai:identifier></oai:identifier>
        <oai:datestamp></oai:datestamp>
      </oai:header>
      <oai:metadata>
        <!-- add paired value for schemaLocation below: -->
        <oai_dc:dc>
          <dc:identifier>wwp_<xsl:value-of select="@entry"/></dc:identifier>
          <dc:id>wwp_<xsl:value-of select="@entry"/></dc:id>
          <dc:title><xsl:value-of select="@docDesc"/></dc:title>
          <dc:type><xsl:value-of select="@docClass"/></dc:type>
<!---          xsl:variable name="myVarA" select="/root/DataSet/Data[@Value1='2']/@Value2"/>-->
          <dc:publisher>Woodrow Wilson Presidential Library and Museum</dc:publisher>
          <dc:rights><xsl:value-of select="Header/copyright"/></dc:rights>
          <dcterms:isPartOf><xsl:value-of select="Header/AccessionInfo/bibl/CollectionName"/></dcterms:isPartOf>
          <dc:description><xsl:value-of select="Header/abstract"/></dc:description>
          <dc:creator><xsl:value-of select="Header/docAuthor"/></dc:creator> 
          <dc:date><xsl:value-of select="@isoDate"/></dc:date>
          <xsl:for-each select="Header/keywords/keyword"><dc:subject><xsl:value-of select="."/></dc:subject></xsl:for-each>

          <dc:contributor><xsl:value-of select="Header/addressee"/></dc:contributor>
          <dc:source>http://wwl2.dataformat.com/Document.aspx?doc=<xsl:value-of select="@entry"/></dc:source>
        </oai_dc:dc>
      </oai:metadata>
    </oai:record>
</xsl:template>
<!---
<xsl:template match="doc/Header/keyword" name="keyword">
  <dc:subject><xsl:value-of select="keyword"/></dc:subject>
</xsl:template>
-->
</xsl:stylesheet>
