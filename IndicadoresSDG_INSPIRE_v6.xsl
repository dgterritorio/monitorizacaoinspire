<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gml="http://www.opengis.net/gml" xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:template match="/">
		<xsl:element name="records">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:hierarchyLevel/gmd:MD_ScopeCode[@codeListValue='dataset' or @codeListValue='series']]"/>
	<xsl:template match="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:hierarchyLevel/gmd:MD_ScopeCode[@codeListValue='service']]">
		<xsl:element name="record">
			<xsl:element name="fileIdentifier">
				<xsl:value-of select="gmd:fileIdentifier/gco:CharacterString"/>
			</xsl:element>
			<xsl:element name="title">
				<xsl:value-of select="gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>
			</xsl:element>
			<xsl:element name="contacto">
				<xsl:value-of select="gmd:contact/gmd:CI_ResponsibleParty/gmd:organisationName/gco:CharacterString"/>
			</xsl:element>
			<xsl:element name="sigla">
				<xsl:value-of select="gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:descriptiveKeywords/gmd:MD_Keywords/gmd:keyword/gco:CharacterString[text()='ACSS' or text()='APA' or text()='ANAC' or text()='ANPC' or text()='AT' or text()='CIGeoE' or text()='DGEG' or text()='DGEEC' or text()='DGRM' or text()='DGPC' or text()='DGT' or text()='DGADR' or text()='DGS' or text()='GEP' or text()='IP' or text()='ICNF'  or text()='IMT'  or text()='IVV'  or text()='IFAP'  or text()='IH'  or text()='INEM'  or text()='INE' or text()='INIAV' or text()='IPMA' or text()='LNEG' or text()='RAM' or text()='RAA' or text()='IPMA, I.P.']"/>
			</xsl:element>
			<xsl:element name="serviceType">
				<xsl:value-of select="gmd:identificationInfo/srv:SV_ServiceIdentification/srv:serviceType/gco:LocalName"/>
			</xsl:element>
			<xsl:element name="conformidadeSDG">
				<xsl:variable name="varconformidade">
					<xsl:value-of select="gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report/gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult[contains(translate(gmd:specification/gmd:CI_Citation/gmd:title/gco:CharacterString/text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZÃ', 'abcdefghijklmnopqrstuvwxyzã'),'976/2009 da comissão de 19 de outubro de 2009 que estabelece as disposições de execução da directiva 2007/2/ce do parlamento europeu e do conselho no que respeita aos serviços de rede') or contains(translate(gmd:specification/gmd:CI_Citation/gmd:title/gco:CharacterString/text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZÃ', 'abcdefghijklmnopqrstuvwxyzã'),'976/2009 of 19 october 2009 implementing directive 2007/2/ec of the european parliament and of the council as regards the network services')]/gmd:pass/gco:Boolean"/>
				</xsl:variable>
				<xsl:if test="$varconformidade = 'true'">1</xsl:if>
				<xsl:if test="$varconformidade = 'false'">0</xsl:if>
			</xsl:element>
			<xsl:element name="URL">
				<xsl:value-of select="gmd:distributionInfo/gmd:MD_Distribution/gmd:transferOptions/gmd:MD_DigitalTransferOptions/gmd:onLine/gmd:CI_OnlineResource/gmd:linkage/gmd:URL"/>
			</xsl:element>
			<xsl:element name="UseLimitation">
				<xsl:if test="gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceConstraints//gmd:useLimitation/gco:CharacterString">
					<xsl:choose>
						<xsl:when test="gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:resourceConstraints//gmd:useLimitation/gco:CharacterString ='Sem restrições'">
							<xsl:value-of select="1"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="0"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</xsl:element>
			<xsl:element name="data">2017-04-10</xsl:element>
			<xsl:for-each select="gmd:identificationInfo/srv:SV_ServiceIdentification/srv:operatesOn/@xlink:href">
				<xsl:variable name="idcdg">
					<xsl:choose>
						<xsl:when test="contains(., 'Id=')">
							<xsl:choose>
								<xsl:when test="string-length(substring-before(substring-after(.,'Id='),'&amp;')) &gt; 0">
									<xsl:value-of select="substring-before(substring-after(.,'Id='),'&amp;')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(.,'Id=')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="contains(., 'id=')">
							<xsl:choose>
								<xsl:when test="string-length(substring-before(substring-after(.,'id='),'&amp;')) &gt; 0">
									<xsl:value-of select="substring-before(substring-after(.,'id='),'&amp;')"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="substring-after(.,'id=')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="contains(., 'http://id.igeo.pt/cdg/')">
							<xsl:value-of select="substring-after(.,'http://id.igeo.pt/cdg/')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="vartema">
					<xsl:value-of select="/csw:GetRecordsResponse/csw:SearchResults/gmd:MD_Metadata[gmd:fileIdentifier/gco:CharacterString[text()=$idcdg]]/gmd:identificationInfo/gmd:MD_DataIdentification/*/gmd:MD_Keywords[gmd:thesaurusName/gmd:CI_Citation/gmd:title/gco:CharacterString/text()='GEMET - INSPIRE themes, version 1.0']/gmd:keyword/gco:CharacterString"/>
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
					<xsl:if test="$vartema = 'Caraterísticas geometeorológicas' or $vartema = 'Características geometeorológicas' ">III.14</xsl:if>
					<xsl:if test="$vartema = 'Caraterísticas oceanográficas' or $vartema = 'Características oceanográficas' ">III.15</xsl:if>
					<xsl:if test="$vartema = 'Regiões marinhas'">III.16</xsl:if>
					<xsl:if test="$vartema = 'Regiões biogeográficas'">III.17</xsl:if>
					<xsl:if test="$vartema = 'Habitats e biótopos'">III.18</xsl:if>
					<xsl:if test="$vartema = 'Distribuição das espécies'">III.19</xsl:if>
					<xsl:if test="$vartema = 'Recursos energéticos'">III.20</xsl:if>
					<xsl:if test="$vartema = 'Recursos minerais'">III.21</xsl:if>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
