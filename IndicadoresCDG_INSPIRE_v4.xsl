<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gml="http://www.opengis.net/gml" xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:template match="/">
		<xsl:element name="records">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
		<xsl:template match="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:hierarchyLevel/gmd:MD_ScopeCode[@codeListValue='service']]"></xsl:template>

	<xsl:template match="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:hierarchyLevel/gmd:MD_ScopeCode[@codeListValue='dataset' or @codeListValue='series']]">
	<xsl:variable name="idcdg">
		<xsl:value-of select="gmd:fileIdentifier/gco:CharacterString"/>
	</xsl:variable>
		<xsl:element name="record">
			<xsl:element name="fileIdentifier">
				<xsl:value-of select="$idcdg"/>
			</xsl:element>
			<xsl:element name="title">
				<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>
			</xsl:element>
			<xsl:element name="contacto">
				<xsl:value-of select="gmd:contact/gmd:CI_ResponsibleParty/gmd:organisationName/gco:CharacterString"/>
			</xsl:element>
				<xsl:element name="sigla">
<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString[text()='ACSS' or text()='APA' or text()='ANAC' or text()='ANPC' or text()='AT' or text()='CIGeoE' or text()='DGEG' or text()='DGEEC' or text()='DGRM' or text()='DGPC' or text()='DGT' or text()='DGADR' or text()='DGS' or text()='GEP' or text()='IP' or text()='ICNF'  or text()='IMT'  or text()='IVV'  or text()='IFAP'  or text()='IH'  or text()='INEM'  or text()='INE' or text()='INIAV' or text()='IPMA' or text()='LNEG' or text()='RAM' or text()='RAA' or text()='IPMA, I.P.']"/>
</xsl:element>
			<xsl:variable name="vartema">
				<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/*/gmd:MD_Keywords[gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString/text()='GEMET - INSPIRE themes, version 1.0']/gmd:keyword/gco:CharacterString"/>
			</xsl:variable>
			<xsl:element name="tema">
				<xsl:value-of select="$vartema"/>
			</xsl:element>
			<xsl:element name="numeroTema">
				<xsl:if test="$vartema = 'Sistemas de referencia'">I.1</xsl:if> 
				<xsl:if test="$vartema = 'Sistemas de quadrículas geográficas'">I.2</xsl:if> 
				<xsl:if test="$vartema = 'Toponímia'">I.3</xsl:if> 
				<xsl:if test="$vartema = 'Unidades administrativas'">I.4</xsl:if> 
				<xsl:if test="$vartema = 'Endereços'">I.5</xsl:if> 
				<xsl:if test="$vartema = 'Parcelas cadastrais'">I.6</xsl:if> 
				<xsl:if test="$vartema = 'Redes de transporte'">I.7</xsl:if> 
				<xsl:if test="$vartema = 'Hidrografia'">I.8</xsl:if> 
				<xsl:if test="$vartema = 'Sítios protegidos'">I.9</xsl:if> 
				<xsl:if test="$vartema = 'Altitude'">II.1</xsl:if> 
				<xsl:if test="$vartema = 'Ocupação do solo'">II.2</xsl:if> 				
				<xsl:if test="$vartema = 'Ortoimagens'">II.3</xsl:if> 
    			<xsl:if test="$vartema = 'Geologia'">II.4</xsl:if> 
    			<xsl:if test="$vartema = 'Unidades estatísticas'">III.1</xsl:if> 
    			<xsl:if test="$vartema = 'Edifícios'">III.2</xsl:if> 
    			<xsl:if test="$vartema = 'Solo'">III.3</xsl:if> 
    			<xsl:if test="$vartema = 'Uso do solo'">III.4</xsl:if> 
    			<xsl:if test="$vartema = 'Saúde humana e segurança'">III.5</xsl:if> 
    			<xsl:if test="$vartema = 'Serviços de utilidade pública e do Estado'">III.6</xsl:if> 
    			<xsl:if test="$vartema = 'Instalações de monitorização do ambiente'">III.7</xsl:if> 
    			<xsl:if test="$vartema = 'Instalações industriais e de produção'">III.8</xsl:if> 
    			<xsl:if test="$vartema = 'Instalações agrícolas e aquícolas'">III.9</xsl:if> 
    			<xsl:if test="$vartema = 'Distribuição da população — demografia'">III.10</xsl:if> 
    			<xsl:if test="$vartema = 'Zonas de gestão/restrição/regulamentação e unidades de referência'">III.11</xsl:if> 
    			<xsl:if test="$vartema = 'Zonas de risco natural'">III.12</xsl:if> 
    			<xsl:if test="$vartema = 'Condições atmosféricas'">III.13</xsl:if> 
    			<xsl:if test="$vartema = 'Caraterísticas geometeorológicas'">III.14</xsl:if> 
    			<xsl:if test="$vartema = 'Caraterísticas oceanográficas'">III.15</xsl:if> 
    			<xsl:if test="$vartema = 'Regiões marinhas'">III.16</xsl:if> 
    			<xsl:if test="$vartema = 'Regiões biogeográficas'">III.17</xsl:if> 
    			<xsl:if test="$vartema = 'Habitats e biótopos'">III.18</xsl:if> 
    			<xsl:if test="$vartema = 'Distribuição das espécies'">III.19</xsl:if> 
    			<xsl:if test="$vartema = 'Recursos energéticos'">III.20</xsl:if> 
    			<xsl:if test="$vartema = 'Recursos minerais'">III.21</xsl:if> 
    		</xsl:element>
			<xsl:element name="conformidadeCDG">
			<xsl:variable name="varconformidade">
				<xsl:value-of select="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report/gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult[contains(translate(gmd:specification/gmd:CI_Citation/gmd:title/gco:CharacterString/text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZÃ', 'abcdefghijklmnopqrstuvwxyzã'),'1089/2010 da comissão de 23 de novembro de 2010 que estabelece as disposições de execução da directiva 2007/2/ce do parlamento europeu e do conselho relativamente à interoperabilidade dos conjuntos e serviços de dados geográficos')]/gmd:pass/gco:Boolean"/>
				</xsl:variable>
				 <xsl:if test="$varconformidade = 'true'">1</xsl:if> 
				 <xsl:if test="$varconformidade = 'false'">0</xsl:if> 
			</xsl:element>
			<xsl:element name="idViewService">
			<xsl:value-of select="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:identificationInfo/srv:SV_ServiceIdentification/srv:operatesOn/@xlink:href[contains(.,$idcdg)] and gmd:identificationInfo/srv:SV_ServiceIdentification/srv:serviceType/gco:LocalName[text()='view']]/gmd:fileIdentifier/gco:CharacterString"/>
			</xsl:element>
				<xsl:element name="idDownloadService">
			<xsl:value-of select="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:identificationInfo/srv:SV_ServiceIdentification/srv:operatesOn/@xlink:href[contains(.,$idcdg)] and gmd:identificationInfo/srv:SV_ServiceIdentification/srv:serviceType/gco:LocalName[text()='download']]/gmd:fileIdentifier/gco:CharacterString"/>
			</xsl:element>
			<xsl:element name="data">2017-04-10</xsl:element>
			<xsl:element name="actualArea">
				<xsl:variable name="w" select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:westBoundLongitude/gco:Decimal"/>
				<xsl:variable name="e" select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:eastBoundLongitude/gco:Decimal"/>
				<xsl:variable name="s" select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:southBoundLatitude/gco:Decimal"/>
				<xsl:variable name="n" select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:northBoundLatitude/gco:Decimal"/>
				<xsl:variable name="areaIlhaMadeira">
					<xsl:choose>
						<xsl:when test="($e > -17.02) and ($n>32.74) and (-17.02>$w) and (32.74>$s)">
							<xsl:value-of select="759"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="areaPortoSanto">
					<xsl:choose>
						<xsl:when test="($e > -16.35) and ($n>33.07) and (-16.35>$w) and (33.07>$s)">
							<xsl:value-of select="42"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="areaCorvo">
					<xsl:choose>
						<xsl:when test="($e > -31.11) and ($n>39.7) and (-31.11>$w) and (39.7>$s)">
							<xsl:value-of select="17"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="areaFlores">
					<xsl:choose>
						<xsl:when test="($e > -31.2) and ($n>39.44) and (-31.2>$w) and (39.44>$s)">
							<xsl:value-of select="141"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaFaial">
					<xsl:choose>
						<xsl:when test="($e > -28.7) and ($n>38.58) and (-28.7>$w) and (38.58>$s)">
							<xsl:value-of select="173"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaGraciosa">
					<xsl:choose>
						<xsl:when test="($e > -28.02) and ($n>39.06) and (-28.02>$w) and (39.06>$s)">
							<xsl:value-of select="61"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaSaoJorge">
					<xsl:choose>
						<xsl:when test="($e > -28.04) and ($n>38.64) and (-28.04>$w) and (38.64>$s)">
							<xsl:value-of select="244"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaPico">
					<xsl:choose>
						<xsl:when test="($e > -28.32) and ($n>38.46) and (-28.32>$w) and (38.46>$s)">
							<xsl:value-of select="445"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaTerceira">
					<xsl:choose>
						<xsl:when test="($e > -27.21) and ($n>38.73) and (-27.21>$w) and (38.73>$s)">
							<xsl:value-of select="400"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaSantaMaria">
					<xsl:choose>
						<xsl:when test="($e >-25.11) and ($n>36.98) and (-25.11>$w) and (36.98>$s)">
							<xsl:value-of select="97"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
					<xsl:variable name="areaSaoMiguel">
					<xsl:choose>
						<xsl:when test="($e >-25.49) and ($n>37.77) and (-25.49>$w) and (37.77>$s)">
							<xsl:value-of select="745"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="areaContinente">
					<xsl:choose>
						<xsl:when test="($e > -8) and ($n>39.6) and (-8>$w) and (39.6>$s)">
							<xsl:value-of select="89084"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:value-of select="$areaIlhaMadeira+$areaPortoSanto+$areaCorvo+$areaFlores+$areaGraciosa+$areaPico+$areaSaoJorge+$areaFaial+$areaTerceira+$areaSantaMaria+$areaSaoMiguel+ $areaContinente"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
