<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		<hr></hr>
		<h3>1. Kuvada iga reisi sihtkoht pealkirjana, kasutades h1.</h3>
		<h3>2. Komponendid peavad olema kuvatud täpploeteluna ul.</h3>
		<h3>3. Kolmanda taseme struktuuri andmed tuleb kuvada kollasel taustal.</h3>
		<h3>4. Lisa oma tingimus (nt reisi hind või eriline soovitus peab olema esile tõstetud teatud tingimustel).</h3>
		<h3>5. Kuva iga reisi kogumaksumuse, liites transport, majutuse, ekskursioonide ja muude kulude hinnad kokku.</h3>
		<h3>6. Filtreeri ja kuva ainult need reisid, mille transport sisaldab lennureisi.</h3>
		<h3>7. Sorteeri kõik reisid vastavalt hinnangule (nt kliendihinnang, kui selline väli on olemas XML-is, kui ei ole kasuta teine numbriline väli).</h3>
		<h1>Sihtkoht</h1>
		<xsl:for-each select="reisid/reis">
			<xsl:sort select="hinnad" order="ascending"/>
			<xsl:if test="number(hinnad) &lt; 1000">
				<tr>
					<h1>
						<xsl:value-of select="sihtkoht"/>
					</h1>
					<ul>
						<li>
							<th>Reisi number : </th>
							<xsl:value-of select="reisinumber"/>
						</li>

						<li>
							<th>Lennujaama Kood: </th>
							<xsl:value-of select="lennujaamKood"/>
						</li>

						<li>
							<th>Lennujaam: </th>
							<span style="background-color: yellow;">
								<xsl:value-of select="lennujaamKood/lennujaam"/>
							</span>
						</li>

						<li>
							<th>
								Reisi aeg:
								<xsl:value-of select="reisiaeg"/>
								min
							</th>
						</li>

						<li>
							<th>
								Hinnad:
								<xsl:value-of select="hinnad"/>
								eur
							</th>
						</li>

						<li>
							<th>Ettevõtte: </th>
							<xsl:value-of select="ettevotteNimi"/>
						</li>
						<xsl:if test="number(reisiaeg) >= 160">
							<li>
								<h2>See lend kestab üle 3 tundi!!!</h2>
							</li>
						</xsl:if>
					</ul>
				</tr>
			</xsl:if>
		</xsl:for-each>
		<h2>
			Kõikide lendude summa: <xsl:value-of select="round(sum(//hinnad))"/>eur
		</h2>

		<hr></hr>

		<h1>Reisi tabel</h1>
		<h3>8. Kuva kõik xml andmed tabelina, kus read on üle rea erineva värviga.</h3>
		<table style="border:solid 1px black;">
			<tr>
				<th style="border:solid 1px black;">Reisi number</th>
				<th style="border:solid 1px black;">Lennujaama Kood</th>
				<th style="border:solid 1px black;">Lennujaam</th>
				<th style="border:solid 1px black;">Reisi aeg</th>
				<th style="border:solid 1px black;">Sihtkoht</th>
				<th style="border:solid 1px black;">Hinnad</th>
				<th style="border:solid 1px black;">Ettevõtte</th>
			</tr>
			<xsl:for-each select="reisid/reis">
				<tr>
					<xsl:attribute name="style">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 1">
								<xsl:text>background-color: #d3e3d7;</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>background-color: #ffffff;</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<td style="border:solid 1px black;">
						<xsl:value-of select="reisinumber"/>
					</td>
					<td style="border:solid 1px black;">
						<xsl:value-of select="lennujaamKood"/>
					</td>
					<td style="border:solid 1px black;">
						<xsl:value-of select="lennujaamKood/lennujaam"/>
					</td>
					<td style="border:solid 1px black;">
						<xsl:value-of select="reisiaeg"/>
					</td>
					<td style="border:solid 1px black;">
						<xsl:value-of select="sihtkoht"/>
					</td>
					<td style="border:solid 1px black;">
						<xsl:value-of select="hinnad"/>
					</td>
					<td style="border:solid 1px black;">
						<xsl:value-of select="ettevotteNimi"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
