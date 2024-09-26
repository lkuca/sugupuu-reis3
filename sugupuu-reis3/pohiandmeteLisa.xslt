<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
        Kuvame 1.inimese nimi:
		<xsl:value-of select="sugupuu/paar/inimene[1]/nimi"/>
		<br />
		<table>
			<tr>
				<th>Vanavanem</th>
				<th>Vanem</th>
				<th>Laps</th>
				<td>
					<xsl:value-of select="nimi"/>,
				</td>
				<td>
					<xsl:value-of select="nimi"/>,
				</td>
				<td>
					<xsl:value-of select="nimi"/>,
				</td>
			</tr>
			<xsl:for-each select="sugupuu/paar/inimene">
				<tr>
					<td>
						<xsl:value-of select="nimi"/>,
					</td>
				</tr>
			
			<xsl:for-each select="lapsed/inimene">
				<tr>
					<td>
						<xsl:value-of select="nimi"/>,
					</td>
				</tr>
			
			<xsl:for-each select="lapsed/inimene">
				<tr>
					<td>
						<xsl:value-of select="nimi"/>,
					</td>
				</tr>
			</xsl:for-each>
			</xsl:for-each>
			</xsl:for-each>
		</table>
		vana vanem:
		<ul>
			<xsl:for-each select="sugupuu/paar/inimene">
				<li>
					<xsl:value-of select="nimi"/>,
					
					<xsl:value-of select="synniaasta"/>,
					
					<xsl:value-of select="synnikoht"/>,
				 
					<ul>
						vanem:
						<xsl:for-each select="lapsed/inimene">
							<li>
								<xsl:value-of select="nimi"/>,

								<xsl:value-of select="synniaasta"/>,

								<xsl:value-of select="synnikoht"/>,
								<ul>
									Lapsed:
									<xsl:for-each select="lapsed/inimene">
										<li>
											<xsl:value-of select="nimi"/>,

											<xsl:value-of select="synniaasta"/>,

											<xsl:value-of select="synnikoht"/>,
										</li>
									</xsl:for-each>
								</ul>
							</li>
						</xsl:for-each>
					</ul>
				</li>
				
			</xsl:for-each>
			
		</ul>
		
		
    </xsl:template>
</xsl:stylesheet>
