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


<xsl:template match="interview">
    <oai:record>
      <oai:header>
        <oai:identifier></oai:identifier>
        <oai:datestamp></oai:datestamp>
      </oai:header>
      <oai:metadata>
        <!-- add paired value for schemaLocation below: -->
        <oai_dc:dc>
          <dc:id><xsl:for-each select="entry_id">
<xsl:value-of select="replace(current(),'-','_')"/>
</xsl:for-each></dc:id>
          <dc:identifier><xsl:for-each select="entry_id">
<xsl:value-of select="replace(current(),'-','_')"/>
</xsl:for-each></dc:identifier>
          <dc:publisher>Miller Center Oral History Program</dc:publisher>
          <dc:contributor><xsl:value-of select="interviewers"/></dc:contributor>
          <dc:description><xsl:value-of select="summary"/></dc:description>
          <dcterms:hasPart><xsl:value-of select="subject_photo_url"/></dcterms:hasPart>
          <dc:date><xsl:value-of select="date"/></dc:date>
          <dc:title><xsl:value-of select="subject"/></dc:title>
          <dc:source><xsl:value-of select="url"/></dc:source>
        </oai_dc:dc>
      </oai:metadata>
    </oai:record>
</xsl:template>
  
</xsl:stylesheet>
