<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml">
    
    <xsl:output indent="no"/>

    <xsl:template match="link"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="table[@class='attList']"/>
    
    <xsl:template match="head">
        <xsl:element name="meta" namespace="http://www.w3.org/1999/xhtml">
            <xsl:element name="title" namespace="http://www.w3.org/1999/xhtml">
                <xsl:text>SegmOnto: A controlled vocabulary to describe the layout of pages</xsl:text>
            </xsl:element>
            <xsl:element name="link" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="rel">
                    <xsl:text>stylesheet</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:text>text/css</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:text>css/style.css</xsl:text>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="script" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="src">
                    <xsl:text>js/scripts.js</xsl:text>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Nav -->
    
    <xsl:template match="body">
        <xsl:element name="body" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>simple</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:text>TOP</xsl:text>
            </xsl:attribute>
            
            <!-- Navbar-->
            <xsl:apply-templates select="div[@class='tei_toc']"/>

            <!-- Everything in a main div-->            
            <xsl:element name="div">
                <xsl:attribute name="class">
                    <xsl:text>main</xsl:text>
                </xsl:attribute>
                <xsl:apply-templates select="div[not(@class='tei_toc')]"/>
            </xsl:element>
            
            <!-- For the images -->
            <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="id">
                    <xsl:text>modal01</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>modal</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="onclick">
                    <xsl:text>this.style.display='none'</xsl:text>
                </xsl:attribute>
                <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>close</xsl:text>
                    </xsl:attribute>
                    <xsl:text>X</xsl:text>
                </xsl:element>
                <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>modal-content</xsl:text>
                    </xsl:attribute>
                    <xsl:text>X</xsl:text>
                    <xsl:element name="img" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:attribute name="id">
                            <xsl:text>img01</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="script" namespace="http://www.w3.org/1999/xhtml">
                <xsl:value-of select="document('../js/scripts.js')" disable-output-escaping="yes"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Navbar -->
    
    <xsl:template match="div[@class='tei_toc']">
        <xsl:element name="nav" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>menu</xsl:text>
            </xsl:attribute>
            <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">
                    <xsl:text>nav_header</xsl:text>
                </xsl:attribute>
                <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>project</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="//h1[@class='maintitle']"/>
                </xsl:element>
                <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>version</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="document('../SegmOnto.odd')//tei:edition[parent::tei:editionStmt]"/>
                </xsl:element>
            </xsl:element>
            <xsl:apply-templates/>
            <!-- logos-->
            <xsl:element name="img" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="src">
                    <xsl:text>media/logos/unige.png</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:text>logo_unige</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:text>30</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="style">
                    <xsl:text>padding:8px;</xsl:text>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="img" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="src">
                    <xsl:text>media/logos/enc.png</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:text>logo_enc</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:text>30</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="style">
                    <xsl:text>padding:8px; float:right;</xsl:text>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="div[@class='stdheader autogenerated']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="h1">
        <xsl:element name="h1" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>maintitle</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:element name="span">
                <xsl:attribute name="class">
                    <xsl:text>subtitle</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="document('../SegmOnto.odd')//tei:title[@type='sub']"/>
            </xsl:element>
        </xsl:element>
        <xsl:element name="hr"/>
    </xsl:template>
    
    <xsl:template match="ul[@class='toc toc_body']">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>menu</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="h2[parent::div/@class='tei_toc']"/>
    
    <xsl:template match="ul[@class='toc']">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>items</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="li[@class='toc']">
        <xsl:choose>
            <xsl:when test="parent::ul[@class='toc toc_body']">
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>list</xsl:text>
                    </xsl:attribute>
                   <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="parent::ul[@class='toc']">
                <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>sublist</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="span[parent::li/@class]">
        <xsl:choose>
            <xsl:when test="../../@class='toc toc_body'">
                <xsl:element name="button" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>accordion</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:attribute name="href">
                            <xsl:value-of select="../a/@href"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/><xsl:value-of select="../a"/>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:when test="../../@class='toc'">
                <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="href">
                        <xsl:value-of select="../a/@href"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/><xsl:value-of select="../a"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="a">
        <!-- Courier style only for TEI elements, not bib ref -->
        <xsl:choose>
            <xsl:when test="@href/starts-with(., '#TEI')">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@href"/>
                    </xsl:attribute>
                    <xsl:attribute name="class">
                        <xsl:text>element</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test=".[parent::li/@class='toc']"></xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- Biblio -->
    
    <xsl:template match="q[@class='titlea']">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>
  
    <xsl:template match="span[@class='titlea']">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    
    <xsl:template match="span[@class='titlem']">
        <xsl:element name="i" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- Images -->
    
    <xsl:template match="div[@class='figure']">
        <xsl:choose>
            <xsl:when test="img[contains(./@src,'people')]">
                <xsl:element name="span" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>thumbnail</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="img[contains(./@src,'zone') or contains(./@src,'line') or contains(./@src,'intro')]">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="img">
        <xsl:choose>
            <xsl:when test="contains(./@src,'zone') or contains(./@src,'line')  or contains(./@src,'intro')">
                <xsl:element name="div"  namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="class">
                        <xsl:text>container1</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="img" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:attribute name="src">
                            <xsl:value-of select="./@src"/>
                        </xsl:attribute>
                        <xsl:attribute name="style">
                            <xsl:text>height:200px</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="onclick">
                            <xsl:text>onClick(this)</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="class">
                            <xsl:text>modal-hover-opacity</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="./@alt"/>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="img" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="src">
                        <xsl:value-of select="./@src"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="./@alt"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>