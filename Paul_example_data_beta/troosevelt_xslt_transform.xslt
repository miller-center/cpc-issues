<?xml version="1.0" encoding="UTF-8"?>

<!-- Simple example that at least does something. -->
<xsl:stylesheet version="2.0"
                xmlns="http://www.openarchives.org/OAI/2.0/static-repository"
                xmlns:orig="http://www.dataformat.com/darma" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mml="http://www.w3.org/1998/Math/MathML"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.dataformat.com/darma http://www.dataformat.com/local/darma_data.xsd"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:dcterms="http://purl.org/dc/terms/"
                xmlns:oai="http://www.openarchives.org/OAI/2.0/" 
                xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
                
                exclude-result-prefixes="mml xsi" 
                >
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


<xsl:template match="orig:Object">
    <oai:record>
      <oai:header>
        <oai:identifier></oai:identifier>
        <oai:datestamp></oai:datestamp>
      </oai:header>
      <oai:metadata>
        <!-- add paired value for schemaLocation below: -->
        <oai_dc:dc>
          <dc:id>trc_<xsl:value-of select="orig:id"/></dc:id>
          <dc:publisher>Theodore Roosevelt Center</dc:publisher>
          <dc:rights><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Rights']"/></dc:rights>
          <!---NEED TO COPY URLS-->
          <dcterms:isPartOf><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Collection']"/></dcterms:isPartOf>
          <dcterms:isPartOf><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Repository']"/></dcterms:isPartOf>
          <dc:identifier>trc_<xsl:value-of select="orig:id"/></dc:identifier>
          <dc:description><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Description']"/></dc:description>
          <dc:creator><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Creator']"/></dc:creator> 
          <dc:date><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.CreationDate']"/></dc:date>
          <dc:title><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Title']"/></dc:title>
          <dc:contributor><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Recipient']"/></dc:contributor>
          <dc:type><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.ResourceType']"/></dc:type>
          <dc:language><xsl:value-of select="orig:InfoGroup/orig:field[@name='Original.Language']"/></dc:language>
          <dc:provenance></dc:provenance>
                    
          <xsl:for-each select="orig:InfoGroup/orig:field[@name='Original.SubjectTags']/orig:value"><dc:subject><xsl:value-of select="."/></dc:subject></xsl:for-each>

          <dc:source><xsl:value-of select="orig:InfoGroup/orig:field[@name='Digital.PublicSiteURL']"/></dc:source>
          <dcterms:hasPart><xsl:value-of select="orig:InfoGroup/orig:attachment/orig:field[@name='thumbnailURL']"/></dcterms:hasPart>


        </oai_dc:dc>
      </oai:metadata>
    </oai:record>
</xsl:template>




</xsl:stylesheet>
