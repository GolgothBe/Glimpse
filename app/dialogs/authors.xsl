<?xml version="1.0" encoding="UTF-8"?>

<!--  XSL transformation to create a header file from authors.xml  -->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dc="http://purl.org/dc/elements/1.1/">

  <xsl:output method="text" />

  <xsl:template name="recent-contributor">
    <xsl:param name="role" />
    <xsl:apply-templates select="dc:contributor[contains(@role, $role) and
                                 number(@last-active) >= 0             and
                                 number(substring-after(@last-active, &quot;.&quot;)) >= 0]" />
  </xsl:template>

  <xsl:template name="recent-upstream-contributor">
    <xsl:param name="role" />
    <xsl:for-each select="dc:upstream[contains(@role, $role) and
                            number(@last-active) >= 2             and
                            number(substring-after(@last-active, &quot;.&quot;)) >= 8]">
        <xsl:value-of select="concat('  &quot;', .,' (GNU I.M.P)&quot;,&#10;')"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="/dc:glimpse-authors">
<xsl:text>
/* NOTE: This file is auto-generated from authors.xml, do not edit it. */

static const gchar * const creators[] =
{
</xsl:text>
  <xsl:apply-templates select="dc:creator" />
<xsl:text>  NULL
};
</xsl:text>

<xsl:text>
static const gchar * const maintainers[] =
{
</xsl:text>
  <xsl:apply-templates select="dc:maintainer" />
<xsl:text>  NULL
};
</xsl:text>

<xsl:text>
static const gchar * const glimpse_authors[] =
{
</xsl:text>
  <xsl:apply-templates select="dc:creator" />
  <xsl:apply-templates select="dc:maintainer" />
  <xsl:call-template name="recent-contributor">
    <xsl:with-param name="role" select="'author'"/>
  </xsl:call-template>
<xsl:text>  NULL
};
</xsl:text>

<xsl:text>
static const gchar * const authors[] =
{
</xsl:text>
  <xsl:apply-templates select="dc:creator" />
  <xsl:apply-templates select="dc:maintainer" />
  <xsl:call-template name="recent-contributor">
    <xsl:with-param name="role" select="'author'"/>
  </xsl:call-template>
  <xsl:call-template name="recent-upstream-contributor">
    <xsl:with-param name="role" select="'author'"/>
  </xsl:call-template>
<xsl:text>  NULL
};
</xsl:text>

<xsl:text>
static const gchar * const artists[] =
{
</xsl:text>
  <xsl:call-template name="recent-contributor">
    <xsl:with-param name="role" select="'artist'"/>
  </xsl:call-template>
  <xsl:call-template name="recent-upstream-contributor">
    <xsl:with-param name="role" select="'artist'"/>
  </xsl:call-template>
<xsl:text>  NULL
};
</xsl:text>

<xsl:text>
static const gchar * const documenters[] =
{
</xsl:text>
  <xsl:call-template name="recent-contributor">
    <xsl:with-param name="role" select="'documenter'"/>
  </xsl:call-template>
  <xsl:call-template name="recent-upstream-contributor">
    <xsl:with-param name="role" select="'documenter'"/>
  </xsl:call-template>
<xsl:text>  NULL
};
</xsl:text>
  </xsl:template>

  <xsl:template match="dc:creator">  "<xsl:apply-templates />",
</xsl:template>
  <xsl:template match="dc:maintainer">  "<xsl:apply-templates />",
</xsl:template>
  <xsl:template match="dc:contributor">  "<xsl:apply-templates />",
</xsl:template>
  <xsl:template match="dc:upstream">  "<xsl:apply-templates />",
</xsl:template>

</xsl:stylesheet>
