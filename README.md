# monitorizacaoinspire
Aplicação XSLT desenvolvida para a monitorização INSPIRE 2016 de forma automática a partir dos metadados no SNIG com a palavra-chave "INSPIRECORE".
<p>
<table>
  <tr>
    <th>Sigla</th>
    <th>Nome</th>
  </tr>
  <tr>
    <td>CDG</td>
    <td>Conjuntos de dados geográficos (datasets)</td>
  </tr>
  <tr>
    <td>SDG</td>
    <td>Serviços de dados geográficos (services)</td>
  </tr>
   <tr>
    <td>CSDG</td>
    <td>Conjuntos e serviços de dados geográficos</td>
  </tr>
   <tr>
    <td>SNIG</td>
    <td>Sistema Nacional de Informação Geográfica</td>
  </tr>
</table>
</p>
<p>
O objectivo desta aplicação consistiu na produção de listagens de CSDG para o cálculo de indicadores INSPIRE (formulários da IONET). Esta aplicação consiste numa cadeia de processos descrita em <a href="monitorizacao Activity Diagram.svg">diagrama de actividades da monitorização</a>.
</p><p>
O primeiro passo consiste em descarregar os metadados de CSDG do SNIG para um ficheiro XML. Isso é feito através de um pedido ao serviço de catálogo (CSW) do SNIG com o filtro definido em <a href="CSW_INSPIRECORE.xml">CSW_INSPIRECORE.xml</a>. O executável CURL (https://curl.haxx.se/) pode ser utilizado para o efeito. Comando:
<code> curl -H "Content-Type:text/xml" -d @CSW_INSPIRECORE.xml -o CSW_INSPIRECORE_Response.xml http://snig.dgterritorio.pt/geoportal/csw/discovery</code>
</p>
<p>Seguidamente é aplicado ao ficheiro CSW_INSPIRECORE_Response.xml os ficheiros XSL, <a href="IndicadoresCDG_INSPIRE_v4.xsl">IndicadoresCDG_INSPIRE_v4.xsl</a> e  <a href="IndicadoresSDG_INSPIRE_v6.xsl">IndicadoresSDG_INSPIRE_v6.xsl</a>, respectivamente para a listagem dos CDG e depois para os SDG. Para este processamento foi utilizada a aplicação XML Spy (https://www.altova.com/xmlspy.html).</p>
