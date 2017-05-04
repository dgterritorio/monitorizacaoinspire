# monitorizacaoinspire
Aplicação XSLT desenvolvida para a monitorização INSPIRE 2016 de forma automática a partir dos metadados no SNIG com a palavra-chave "INSPIRECORE".
<p>
<b>Siglas</b>
<ul>
<li>CDG - Conjuntos de dados geográficos (datasets)</li>
<li>SDG - Serviços de dados geográficos (services)</li>
<li>CSDG - Conjuntos e serviços de dados geográficos</li>
<li>SNIG - Sistema Nacional de Informação Geográfica</li>
</ul>
</p>
O objectivo desta aplicação consistiu na produção de listagens de CSDG para o cálculo de indicadores INSPIRE (formulários da IONET). Esta aplicação consiste numa cadeia de processos descrita em <a href="monitorizacao Activity Diagram.svg">diagrama de actividades da monitorização</a>

O primeiro passo consiste em descarregar os metadados de CSDG do SNIG para um ficheiro XML. Isso é feito através de um pedido ao serviço de catálogo (CSW) do SNIG com o filtro definido neste <a href="CSW_INSPIRECORE.xml">ficheiro XML</a>. O executável CURL (https://curl.haxx.se/) pode ser utilizado para o efeito. Comando:
<code> curl -H "Content-Type:text/xml" -d @CSW_INSPIRECORE.xml -o CSW_INSPIRECORE_Response.xml http://snig.dgterritorio.pt/geoportal/csw/discovery</code>
