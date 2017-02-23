finds top10 English wiki pages having max hit count

input file struct  - https://wikitech.wikimedia.org/wiki/Analytics/Data/Pagecounts-raw

Download input file - 
https://dumps.wikimedia.org/other/pagecounts-raw/


So for example a line

en Main_Page 42 50043
means 42 requests to "en.wikipedia.org/wiki/Main_Page", which accounted in total for 50043 response bytes. And

de.m.voy Berlin 176 314159
would stand for 176 requests to "de.m.wikivoyage.org/wiki/Berlin", which accounted in total for 314159 response bytes.

Each domain_code and page_title pair occurs at most once.

The file is sorted by domain_code and page_title.