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


<xsl:template match="ppdata">
    <oai:record>
      <oai:header>
        <oai:identifier></oai:identifier>
        <oai:datestamp></oai:datestamp>
      </oai:header>
      <oai:metadata>
        <!-- add paired value for schemaLocation below: -->
        <oai_dc:dc>
          <dc:id>rbh_<xsl:value-of select="objectid"/></dc:id>
          <dc:publisher>Rutherford B. Hayes Presidential Center</dc:publisher>
          <dcterms:isPartOf><xsl:value-of select="collection"/></dcterms:isPartOf>
          <dc:identifier>rbh_<xsl:value-of select="objectid"/></dc:identifier>
          <dc:description><xsl:value-of select="descrip"/></dc:description>
          <dc:creator><xsl:value-of select="creator"/></dc:creator> 
          <dc:date><xsl:value-of select="date"/></dc:date>
          <dc:format><xsl:value-of select="heightin"/> inches high</dc:format>
          <dc:format><xsl:value-of select="lengthin"/> inches long</dc:format>
          <dc:format><xsl:value-of select="widthin"/> inches wide</dc:format>
          <dcterms:medium><xsl:value-of select="material"/></dcterms:medium>
<!-- notes -->
          <dc:title><xsl:value-of select="objname"/></dc:title>
<!--othername-->
          <xsl:variable name="line"><xsl:value-of select="people"/></xsl:variable> 
            <xsl:for-each select="tokenize($line, '\n')"><dc:contributor><xsl:value-of select="."/></dc:contributor></xsl:for-each>

          <dc:provenance><xsl:value-of select="provenance"/></dc:provenance>
<!--signloc-->
      <!-- NTJ: looks like this is space or new-line delimited in the source 
           might be a good idea to split it into seperate sterms in the
           output. Same is true of contributor. -->
          <xsl:variable name="line"><xsl:value-of select="sterms"/></xsl:variable> 
            <xsl:for-each select="tokenize($line, '\n')"><dc:subject><xsl:value-of select="."/></dc:subject></xsl:for-each>




          <!---<xsl:value-of select="sterms"/>, '\n')></dc:subject>-->
<!-- title -->
          <dc:source><xsl:value-of select="source"/></dc:source>
        </oai_dc:dc>
      </oai:metadata>
    </oai:record>
</xsl:template>
  
</xsl:stylesheet>
