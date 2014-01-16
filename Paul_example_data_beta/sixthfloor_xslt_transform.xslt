<?xml version="1.0" encoding="UTF-8"?>


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
<xsl:output method="xml" indent="yes" />

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


<xsl:template match="record">
    <oai:record>
      <oai:header>
        <oai:identifier></oai:identifier>
        <oai:datestamp></oai:datestamp>
      </oai:header>
      <oai:metadata>
        <!-- add paired value for schemaLocation below: -->
        <oai_dc:dc>
          <dc:id>sfm_<xsl:value-of select="ObjectID"/></dc:id>
          <dc:identifier>sfm_<xsl:value-of select="ObjectID"/></dc:identifier>
          <dc:publisher>The Sixth Floor Museum at Dealey Plaza</dc:publisher>
          <dc:type><xsl:value-of select="Classification"/></dc:type>
          <dc:creator><xsl:value-of select="Creator"/></dc:creator>
          <dcterms:medium><xsl:value-of select="Medium"/></dcterms:medium>
          <dcterms:isPartOf><xsl:value-of select="CreditLine"/></dcterms:isPartOf>
          <dc:format><xsl:value-of select="Dimensions"/></dc:format>
          <dc:description><xsl:value-of select="Description"/></dc:description>
          <dc:rights><xsl:value-of select="Rights"/></dc:rights>
          <dc:date><xsl:value-of select="Dated"/></dc:date>
          <dc:title><xsl:value-of select="Title"/></dc:title>
          <dc:source><xsl:value-of select="Permalink"/></dc:source>
        </oai_dc:dc>
      </oai:metadata>
    </oai:record>
</xsl:template>
  
</xsl:stylesheet>
