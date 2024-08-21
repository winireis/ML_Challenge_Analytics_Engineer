# ML Challenge - Analytics Engineer

## 01 - Visualização

### Objetivo:
Cree un panel utilizando una herramienta de visualización de datos, en uno de los siguientes reproductores: MS Power BI, Tableau o Looker. Como alcance se debe analizar la evolución, crecimiento de internet, usuarios, suscriptores, etc. en Argentina y sus causas.
Fuente de Datos:

Los datos a obtener se publican en la Base de Datos Mundial.
https://www.worldbank.org/
Se permite enumerar todo tipo de fuentes oficiales publicadas.
Alcance esperado:
Generar análisis visuales y conclusiones.

Publicar resultados en Tableau Public
Detallar todas las fuentes utilizadas con sus referencias en la web.
Incluir una conclusión/insight basada en la información.
Puntos que se valorarán:
Se evaluará diseño, tiempo de entrega y capacidad analítica.
Visualización efectiva, funcionalidad y diseño equilibrados
Análisis de datos correcto

### Resolution:
#### [Tableau Public Link](https://public.tableau.com/app/profile/winicius.reis/viz/Argentina-InternetandGDP/Story1)
Baixei os dados em formato xls do site do Banco Mundial e compilei os dados a serem utilizados em um único arquivo.
Fiz o upload dos dados compilados no Tableau Public e criei os gráficos.
Infelizmente esotu mais acostumado a usar o python notebook, então irei escrever minhas conclusões aqui.
Apesar de quase 90% da população utilizar a internet, e provavelmente em sua maioria através de dispositivos móveis, o ritmo do crescimento do acesso a internet diminuiu. Uma hipótese para explicar essa diminuição no ritmo de crescimento pode ser a diminuição do GDP per capita a partir de 2017.

Data Sources - [World Bank](https://www.worldbank.org/): 
* [Individuals using the Internet](https://api.worldbank.org/v2/en/indicator/IT.NET.USER.ZS?downloadformat=excel&_gl=1*8n95nq*_gcl_au*NDM2MDQ0NzI4LjE3MjQyNTUwOTg)
* [Fixed broadband subscriptions (per 100 people)](https://api.worldbank.org/v2/en/indicator/IT.NET.BBND.P2?downloadformat=excel&_gl=1*1gqhhek*_gcl_au*NDM2MDQ0NzI4LjE3MjQyNTUwOTg)
* [Mobile cellular subscriptions (per 100 people)](https://api.worldbank.org/v2/en/indicator/IT.CEL.SETS.P2?downloadformat=excel&_gl=1*ebe1fi*_gcl_au*NDM2MDQ0NzI4LjE3MjQyNTUwOTg)
* [GDP per capita (current US$)](https://api.worldbank.org/v2/en/indicator/NY.GDP.PCAP.CD?downloadformat=excel&_gl=1*11mesbq*_gcl_au*NDM2MDQ0NzI4LjE3MjQyNTUwOTg)
