
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vdemlite

<!-- badges: start -->
<!-- badges: end -->

`vdemlite` is a package that provides a lightweight version of the
Varieties of Democracy (V-Dem) dataset that incorporates many of the
core measures of V-Dem for the contemporary period and is easy to work
with in R. The package provides functions for downloading and loading
the data, as well as for exploring the data and searching for particular
indicators.

`vdemlite` addresses two challenges that arise with the using full
dataset. First, it can be readily used in cloud and production
environments like Posit Cloud and shinyapps.io without having to
purchase additional computing resources. Second, it provides
user-friendly functions and arguments that makes it easier to download,
filter, and explore the data in R. The goal is to make the dataset more
accessible to new users who may not have completely developed a
wrangling workflow and more convenient for more advanced users who
frequently use V-Dem for contemporary analysis.

The indicators included in `vdemlite` are taken from the [Structure of
V-Dem Indices, Components and
Indicators](https://v-dem.net/documents/41/v-dem_structureofaggregation_v14.pdf)
document that is in turn drawn from Appendix A of the V-Dem codebook.

## Installation

You can install the development version of vdemlite from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pkg_install("eteitelbaum/vdemlite")
```

## How to Use `vdemlite`

`vdemlite` has three functions: `fetchdem()`, `summarizedem()`, and
`searchdem()`.

`fetchdem()` is the main function that downloads the V-Dem data and
loads it into R. Within `fetchdem()`, you can specify one or more V-Dem
indexes or indicators along with the years and countries you are
interested in. The function will download the data and return a tibble
with the specified indexes and indicators.

``` r
library(vdemlite)

# Grab the polyarchy scores for the United States between 2000 and 2020
my_indicators <- fetchdem(indicators = "v2x_polyarchy",
                         start_year = 2000, end_year = 2020,
                         countries = "USA")
```

You can retrieve data for multiple indicators and countries by using the
combine function `c()`. `fetchdem` also includes functionality for
retrieving groups of indicators as they relate to the structure and
aggregation of the V-Dem dataset. See the documentation for details.

If you want a quick summary of an indicator or set of indicators,
`summarizedem()` will provide an HTML table with summary statistics and
missing data by country for the specified indicators.

``` r
# summarize the civil liberties index
summarizedem("v2x_civlib")
```

<div id="knsvgjtoqm" class=".gt_table" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#knsvgjtoqm table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#knsvgjtoqm thead, #knsvgjtoqm tbody, #knsvgjtoqm tfoot, #knsvgjtoqm tr, #knsvgjtoqm td, #knsvgjtoqm th {
  border-style: none;
}
&#10;#knsvgjtoqm p {
  margin: 0;
  padding: 0;
}
&#10;#knsvgjtoqm .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#knsvgjtoqm .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#knsvgjtoqm .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#knsvgjtoqm .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#knsvgjtoqm .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#knsvgjtoqm .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#knsvgjtoqm .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#knsvgjtoqm .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#knsvgjtoqm .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#knsvgjtoqm .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#knsvgjtoqm .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#knsvgjtoqm .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#knsvgjtoqm .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#knsvgjtoqm .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#knsvgjtoqm .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#knsvgjtoqm .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#knsvgjtoqm .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#knsvgjtoqm .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#knsvgjtoqm .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#knsvgjtoqm .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#knsvgjtoqm .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#knsvgjtoqm .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#knsvgjtoqm .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#knsvgjtoqm .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#knsvgjtoqm .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#knsvgjtoqm .gt_left {
  text-align: left;
}
&#10;#knsvgjtoqm .gt_center {
  text-align: center;
}
&#10;#knsvgjtoqm .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#knsvgjtoqm .gt_font_normal {
  font-weight: normal;
}
&#10;#knsvgjtoqm .gt_font_bold {
  font-weight: bold;
}
&#10;#knsvgjtoqm .gt_font_italic {
  font-style: italic;
}
&#10;#knsvgjtoqm .gt_super {
  font-size: 65%;
}
&#10;#knsvgjtoqm .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#knsvgjtoqm .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#knsvgjtoqm .gt_indent_1 {
  text-indent: 5px;
}
&#10;#knsvgjtoqm .gt_indent_2 {
  text-indent: 10px;
}
&#10;#knsvgjtoqm .gt_indent_3 {
  text-indent: 15px;
}
&#10;#knsvgjtoqm .gt_indent_4 {
  text-indent: 20px;
}
&#10;#knsvgjtoqm .gt_indent_5 {
  text-indent: 25px;
}
&#10;#knsvgjtoqm .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#knsvgjtoqm div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<div style="font-family:system-ui, &#39;Segoe UI&#39;, Roboto, Helvetica, Arial, sans-serif;border-top-style:solid;border-top-width:2px;border-top-color:#D3D3D3;padding-bottom:8px;">
<div class="gt_heading gt_title gt_font_normal" style="text-size:bigger;">Summary of v2x_civlib by Country</div>
<div class="gt_heading gt_subtitle gt_bottom_border">Years: 1970 - 2023</div>
</div>
<div id="knsvgjtoqm" class="reactable html-widget" style="width:auto;height:auto;"></div>
<script type="application/json" data-for="knsvgjtoqm">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"country_name":["All Selected Countries","Afghanistan","Albania","Algeria","Angola","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Benin","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Brazil","Bulgaria","Burkina Faso","Burma/Myanmar","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Republic","Chad","Chile","China","Colombia","Comoros","Costa Rica","Croatia","Cuba","Cyprus","Czechia","Democratic Republic of the Congo","Denmark","Djibouti","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Eswatini","Ethiopia","Fiji","Finland","France","Gabon","Georgia","German Democratic Republic","Germany","Ghana","Greece","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Lithuania","Luxembourg","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Mongolia","Montenegro","Morocco","Mozambique","Namibia","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","North Korea","North Macedonia","Norway","Oman","Pakistan","Palestine/Gaza","Palestine/West Bank","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Republic of Vietnam","Republic of the Congo","Romania","Russia","Rwanda","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","Somaliland","South Africa","South Korea","South Sudan","South Yemen","Spain","Sri Lanka","Sudan","Suriname","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","The Gambia","Timor-Leste","Togo","Trinidad and Tobago","Tunisia","Turkmenistan","Türkiye","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","Yemen","Zambia","Zanzibar","Zimbabwe"],"country_text_id":["","AFG","ALB","DZA","AGO","ARG","ARM","AUS","AUT","AZE","BHR","BGD","BRB","BLR","BEL","BEN","BTN","BOL","BIH","BWA","BRA","BGR","BFA","MMR","BDI","KHM","CMR","CAN","CPV","CAF","TCD","CHL","CHN","COL","COM","CRI","HRV","CUB","CYP","CZE","COD","DNK","DJI","DOM","ECU","EGY","SLV","GNQ","ERI","EST","SWZ","ETH","FJI","FIN","FRA","GAB","GEO","DDR","DEU","GHA","GRC","GTM","GIN","GNB","GUY","HTI","HND","HKG","HUN","ISL","IND","IDN","IRN","IRQ","IRL","ISR","ITA","CIV","JAM","JPN","JOR","KAZ","KEN","XKX","KWT","KGZ","LAO","LVA","LBN","LSO","LBR","LBY","LTU","LUX","MDG","MWI","MYS","MDV","MLI","MLT","MRT","MUS","MEX","MDA","MNG","MNE","MAR","MOZ","NAM","NPL","NLD","NZL","NIC","NER","NGA","PRK","MKD","NOR","OMN","PAK","PSG","PSE","PAN","PNG","PRY","PER","PHL","POL","PRT","QAT","VDR","COG","ROU","RUS","RWA","STP","SAU","SEN","SRB","SYC","SLE","SGP","SVK","SVN","SLB","SOM","SML","ZAF","KOR","SSD","YMD","ESP","LKA","SDN","SUR","SWE","CHE","SYR","TWN","TJK","TZA","THA","GMB","TLS","TGO","TTO","TUN","TKM","TUR","UGA","UKR","ARE","GBR","USA","URY","UZB","VUT","VEN","VNM","YEM","ZMB","ZZB","ZWE"],"unique":[941,36,30,29,27,35,29,17,18,29,33,43,10,29,15,27,39,40,22,20,34,31,33,22,40,35,38,18,22,33,27,34,39,43,41,21,27,33,26,22,36,9,29,27,36,33,44,22,31,16,24,34,30,16,11,20,32,6,14,40,25,38,35,38,40,39,44,27,31,14,39,35,39,29,18,21,19,36,22,11,27,33,40,20,26,31,31,17,29,35,39,20,22,4,42,29,32,30,29,18,36,26,37,27,24,16,31,32,27,41,13,10,40,29,30,6,28,12,35,38,16,32,25,13,26,34,38,29,14,23,2,24,24,35,35,17,20,26,42,42,35,16,22,19,26,27,16,26,29,13,9,22,43,44,28,14,15,37,38,31,33,46,31,26,28,25,30,24,46,42,33,34,17,29,27,28,15,37,34,34,33,40,34],"missing_pct":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],"mean":[0.601235659760087,0.263055555555556,0.523462962962963,0.473481481481482,0.299296296296296,0.762814814814815,0.757294117647059,0.946648148148148,0.942018518518518,0.431441176470588,0.342518518518519,0.538981132075472,0.907222222222222,0.578058823529412,0.958703703703704,0.661407407407407,0.589037037037037,0.668425925925926,0.77128125,0.867425925925926,0.661074074074074,0.626759259259259,0.644814814814815,0.176388888888889,0.315740740740741,0.318648148148148,0.531925925925926,0.934555555555556,0.789925925925926,0.420203703703704,0.325722222222222,0.689351851851852,0.221277777777778,0.625907407407407,0.473277777777778,0.941240740740741,0.850454545454545,0.258962962962963,0.828092592592593,0.691111111111111,0.279259259259259,0.96687037037037,0.369777777777778,0.746685185185185,0.783037037037037,0.300592592592593,0.505240740740741,0.19337037037037,0.0803333333333333,0.947529411764706,0.30762962962963,0.274111111111111,0.745055555555556,0.958944444444444,0.946962962962963,0.658222222222222,0.725352941176471,0.283142857142857,0.958944444444444,0.751518518518519,0.872037037037037,0.440907407407407,0.355703703703704,0.452888888888889,0.741037037037037,0.489796296296296,0.610259259259259,0.862462962962963,0.703685185185185,0.9545,0.7135,0.481018518518518,0.22337037037037,0.268925925925926,0.942648148148148,0.826407407407407,0.923277777777778,0.641518518518518,0.864277777777778,0.938185185185185,0.586962962962963,0.542029411764706,0.463074074074074,0.76976,0.557851851851852,0.621,0.119277777777778,0.924441176470588,0.628648148148148,0.604166666666667,0.545962962962963,0.172074074074074,0.927529411764706,0.947074074074074,0.602388888888889,0.438462962962963,0.599555555555556,0.452185185185185,0.637518518518518,0.899296296296296,0.505111111111111,0.866537037037037,0.634611111111111,0.782176470588235,0.612462962962963,0.836269230769231,0.471333333333333,0.471981481481481,0.610425925925926,0.537296296296296,0.945944444444444,0.962407407407407,0.547407407407407,0.589,0.580962962962963,0.0159259259259259,0.771242424242424,0.957,0.397296296296296,0.432944444444444,0.329470588235294,0.417851851851852,0.689314814814815,0.801444444444444,0.578611111111111,0.668333333333333,0.552444444444444,0.763537037037037,0.908555555555555,0.389685185185185,0.277833333333333,0.262592592592593,0.618981481481481,0.412240740740741,0.314592592592593,0.739740740740741,0.157740740740741,0.791833333333333,0.635240740740741,0.688648148148148,0.529351851851852,0.709203703703704,0.920032258064516,0.923314285714286,0.796777777777778,0.199981481481481,0.680454545454545,0.540648148148148,0.747425925925926,0.198230769230769,0.0948095238095238,0.847759259259259,0.620666666666667,0.208092592592593,0.813166666666667,0.970777777777778,0.943814814814815,0.121148148148148,0.71062962962963,0.314264705882353,0.698111111111111,0.536092592592593,0.610333333333333,0.425703703703704,0.500240740740741,0.883314814814815,0.477351851851852,0.0994411764705882,0.492037037037037,0.412722222222222,0.742235294117647,0.363377358490566,0.887481481481481,0.933925925925926,0.784351851851852,0.224588235294118,0.853944444444444,0.740222222222222,0.355722222222222,0.264296296296296,0.584092592592593,0.532555555555556,0.378518518518518],"sd":[0.290526889389453,0.225587569631678,0.404930868218685,0.107517219461734,0.209563664359989,0.26059953185452,0.0726100124207627,0.0106419557845837,0.00861654998319266,0.0519126254138803,0.0896270555388062,0.0807592553795724,0.0086344344991144,0.156648794823918,0.0054309720789075,0.277947295025549,0.103576052262943,0.290563772226096,0.148233302247374,0.0203085648367938,0.250063075201668,0.341586141249584,0.134843735427076,0.131850747047013,0.0875833156303153,0.196007908716778,0.173516118750125,0.00673673866190027,0.21926471051546,0.118345094936198,0.0867573968716771,0.35353914983804,0.0805716408432651,0.116503667205788,0.16204441700275,0.0207691127572645,0.118978750967634,0.0336586432102264,0.0836536589819965,0.346220982254772,0.143154644602049,0.00588905699692809,0.1083015821879,0.179340176819538,0.120174866766625,0.0536760086664349,0.324927332089905,0.0874956163422232,0.0586128970288384,0.0202023630392775,0.032615713481357,0.160059737275979,0.078324775392283,0.0103110431122604,0.0103376267539635,0.192825922733401,0.133326867044628,0.141161002303854,0.00974469699358864,0.206409168724679,0.20634080280997,0.276200041569445,0.151287883717133,0.227384610311009,0.0866918121882867,0.267265070855193,0.194496368029841,0.0732235432195223,0.283911149008096,0.00968318908951983,0.066817619978735,0.274224153646332,0.0718305911328993,0.171129637702152,0.0144367944586666,0.0153764320008307,0.0176607620368791,0.120510508543703,0.0372727917694571,0.00673227672968506,0.055070439614707,0.0481182163540799,0.183888897122626,0.044550794979813,0.0246242765681743,0.0542564058499785,0.07756808735621,0.0304294426566139,0.066596265238193,0.187612280846773,0.246726566470609,0.111169571622755,0.0138218871099375,0.00457578471196563,0.141850760888971,0.320943697699366,0.0560564629995967,0.136294779599923,0.20205461065843,0.0212457584043193,0.143951074847274,0.0402115692368399,0.0730343461891078,0.0582946905364591,0.35693320092579,0.0279221169574338,0.134342283204521,0.293005601771471,0.339883198686146,0.24655043723188,0.00638221782788048,0.00324193349319256,0.280944399153628,0.229886518353632,0.0771355002241432,0.00225582559753297,0.0530601252725566,0.0175896624872421,0.0342375880992506,0.110483400386693,0.0821211891406984,0.203326339364886,0.268838860628309,0.0620814032455036,0.322600834999134,0.195729983434052,0.224462600714455,0.225844470858753,0.180159852150928,0.0460708331069952,0.00204124145231929,0.128309842931677,0.352793140027685,0.206077649331891,0.0512708378322372,0.199209966522022,0.0153403957848935,0.0650783997437517,0.207504756497899,0.0943880303826963,0.238305825185329,0.0159532094477612,0.0256248367422022,0.0358368619199409,0.0573416331567367,0.114342499525609,0.0164982781470728,0.350981758242715,0.224740235949834,0.0668420449594338,0.00641575441876517,0.235791556107331,0.106144259258732,0.0944659804031536,0.124172240388176,0.00493224533302605,0.0148706042486435,0.037265193131761,0.266993554886263,0.0882514688086299,0.0776350112291707,0.144605288209171,0.219968093741231,0.384042088378867,0.166177551691657,0.0161966966980099,0.18410519525813,0.0315798086397858,0.127230879567751,0.16659842313538,0.068737118384831,0.0294456647031668,0.0393377924488009,0.0179893593830708,0.266799207758675,0.0924836161238135,0.0323415829455112,0.179139943889841,0.0825507086393287,0.127951144808172,0.160786189742837,0.11256003289929,0.142212933724463],"min":[0.009,0.021,0.017,0.327,0.048,0.236,0.648,0.911,0.917,0.305,0.188,0.396,0.888,0.202,0.949,0.271,0.479,0.099,0.398,0.828,0.205,0.173,0.448,0.099,0.121,0.009,0.223,0.907,0.186,0.178,0.185,0.122,0.04,0.408,0.17,0.902,0.571,0.224,0.588,0.238,0.12,0.936,0.121,0.355,0.495,0.176,0.091,0.011,0.028,0.87,0.177,0.054,0.565,0.941,0.915,0.406,0.413,0.248,0.939,0.377,0.211,0.052,0.136,0.035,0.566,0.107,0.293,0.616,0.308,0.936,0.554,0.191,0.114,0.11,0.909,0.803,0.883,0.484,0.776,0.911,0.513,0.457,0.215,0.699,0.44,0.497,0.058,0.788,0.563,0.346,0.245,0.108,0.894,0.923,0.387,0.087,0.549,0.324,0.364,0.856,0.278,0.725,0.489,0.671,0.159,0.782,0.291,0.089,0.108,0.21,0.921,0.951,0.13,0.239,0.461,0.015,0.679,0.917,0.327,0.216,0.206,0.161,0.324,0.606,0.145,0.405,0.199,0.302,0.279,0.33,0.277,0.132,0.164,0.15,0.19,0.333,0.127,0.686,0.374,0.506,0.236,0.687,0.862,0.753,0.644,0.066,0.619,0.123,0.384,0.123,0.08,0.231,0.439,0.095,0.523,0.958,0.916,0.062,0.264,0.17,0.573,0.318,0.319,0.05,0.303,0.845,0.311,0.06,0.248,0.105,0.608,0.316,0.841,0.887,0.302,0.104,0.776,0.331,0.243,0.122,0.37,0.278,0.095],"median":[0.653,0.162,0.754,0.456,0.274,0.902,0.732,0.951,0.945,0.4235,0.322,0.53,0.91,0.594,0.96,0.8565,0.527,0.8375,0.839,0.872,0.818,0.868,0.615,0.121,0.289,0.363,0.5845,0.936,0.923,0.464,0.3795,0.9325,0.2545,0.625,0.5545,0.9545,0.902,0.2455,0.832,0.9495,0.2465,0.969,0.4165,0.8275,0.841,0.321,0.683,0.23,0.0555,0.955,0.31,0.367,0.762,0.9635,0.952,0.785,0.729,0.251,0.9625,0.88,0.937,0.46,0.3985,0.497,0.7495,0.6405,0.725,0.8895,0.87,0.9575,0.7425,0.2425,0.211,0.183,0.95,0.8275,0.932,0.71,0.8825,0.941,0.59,0.534,0.435,0.781,0.561,0.615,0.1015,0.924,0.5785,0.7315,0.418,0.114,0.925,0.948,0.638,0.606,0.567,0.3805,0.7575,0.9095,0.5315,0.871,0.67,0.771,0.877,0.842,0.435,0.61,0.8625,0.6285,0.949,0.963,0.6405,0.689,0.636,0.015,0.776,0.968,0.3985,0.4925,0.306,0.558,0.8785,0.824,0.805,0.643,0.6945,0.8735,0.965,0.3775,0.277,0.2785,0.874,0.462,0.3,0.877,0.164,0.795,0.5595,0.694,0.391,0.718,0.934,0.935,0.817,0.254,0.676,0.831,0.884,0.185,0.094,0.956,0.599,0.196,0.877,0.973,0.946,0.1185,0.8355,0.3275,0.704,0.585,0.7745,0.165,0.5355,0.889,0.457,0.0995,0.4875,0.4455,0.745,0.368,0.895,0.9405,0.939,0.1845,0.865,0.858,0.379,0.183,0.665,0.543,0.4215],"max":[0.976,0.571,0.895,0.615,0.627,0.939,0.903,0.955,0.95,0.604,0.547,0.657,0.922,0.82,0.966,0.921,0.766,0.86,0.864,0.893,0.869,0.912,0.853,0.5,0.438,0.543,0.706,0.945,0.931,0.553,0.418,0.961,0.3,0.816,0.669,0.962,0.944,0.345,0.921,0.962,0.543,0.969,0.469,0.892,0.912,0.423,0.84,0.252,0.219,0.963,0.37,0.56,0.822,0.968,0.954,0.874,0.906,0.899,0.968,0.942,0.956,0.746,0.577,0.797,0.907,0.768,0.819,0.923,0.952,0.964,0.774,0.803,0.392,0.533,0.959,0.855,0.938,0.809,0.91,0.944,0.671,0.634,0.776,0.828,0.587,0.752,0.352,0.949,0.732,0.822,0.873,0.491,0.95,0.948,0.77,0.869,0.753,0.74,0.841,0.922,0.752,0.9,0.726,0.905,0.921,0.895,0.637,0.755,0.882,0.841,0.951,0.968,0.862,0.826,0.66,0.024,0.84,0.971,0.454,0.552,0.446,0.665,0.91,0.828,0.873,0.894,0.764,0.957,0.967,0.455,0.282,0.571,0.922,0.72,0.407,0.907,0.177,0.885,0.916,0.894,0.835,0.727,0.947,0.945,0.851,0.442,0.712,0.868,0.935,0.337,0.107,0.964,0.834,0.476,0.895,0.976,0.961,0.189,0.946,0.455,0.816,0.751,0.882,0.88,0.743,0.904,0.818,0.2,0.727,0.588,0.857,0.42,0.944,0.953,0.959,0.374,0.882,0.884,0.465,0.504,0.823,0.688,0.519]},"columns":[{"id":"country_name","name":"Country","type":"character","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"left","headerStyle":{"font-weight":"normal"}},{"id":"country_text_id","name":"Country Code","type":"character","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"left","headerStyle":{"font-weight":"normal"}},{"id":"unique","name":"Unique","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["941","36","30","29","27","35","29","17","18","29","33","43","10","29","15","27","39","40","22","20","34","31","33","22","40","35","38","18","22","33","27","34","39","43","41","21","27","33","26","22","36","9","29","27","36","33","44","22","31","16","24","34","30","16","11","20","32","6","14","40","25","38","35","38","40","39","44","27","31","14","39","35","39","29","18","21","19","36","22","11","27","33","40","20","26","31","31","17","29","35","39","20","22","4","42","29","32","30","29","18","36","26","37","27","24","16","31","32","27","41","13","10","40","29","30","6","28","12","35","38","16","32","25","13","26","34","38","29","14","23","2","24","24","35","35","17","20","26","42","42","35","16","22","19","26","27","16","26","29","13","9","22","43","44","28","14","15","37","38","31","33","46","31","26","28","25","30","24","46","42","33","34","17","29","27","28","15","37","34","34","33","40","34"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}},{"id":"missing_pct","name":"Missing (%)","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00","0.00"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}},{"id":"mean","name":"Mean","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["0.60","0.26","0.52","0.47","0.30","0.76","0.76","0.95","0.94","0.43","0.34","0.54","0.91","0.58","0.96","0.66","0.59","0.67","0.77","0.87","0.66","0.63","0.64","0.18","0.32","0.32","0.53","0.93","0.79","0.42","0.33","0.69","0.22","0.63","0.47","0.94","0.85","0.26","0.83","0.69","0.28","0.97","0.37","0.75","0.78","0.30","0.51","0.19","0.08","0.95","0.31","0.27","0.75","0.96","0.95","0.66","0.73","0.28","0.96","0.75","0.87","0.44","0.36","0.45","0.74","0.49","0.61","0.86","0.70","0.95","0.71","0.48","0.22","0.27","0.94","0.83","0.92","0.64","0.86","0.94","0.59","0.54","0.46","0.77","0.56","0.62","0.12","0.92","0.63","0.60","0.55","0.17","0.93","0.95","0.60","0.44","0.60","0.45","0.64","0.90","0.51","0.87","0.63","0.78","0.61","0.84","0.47","0.47","0.61","0.54","0.95","0.96","0.55","0.59","0.58","0.02","0.77","0.96","0.40","0.43","0.33","0.42","0.69","0.80","0.58","0.67","0.55","0.76","0.91","0.39","0.28","0.26","0.62","0.41","0.31","0.74","0.16","0.79","0.64","0.69","0.53","0.71","0.92","0.92","0.80","0.20","0.68","0.54","0.75","0.20","0.09","0.85","0.62","0.21","0.81","0.97","0.94","0.12","0.71","0.31","0.70","0.54","0.61","0.43","0.50","0.88","0.48","0.10","0.49","0.41","0.74","0.36","0.89","0.93","0.78","0.22","0.85","0.74","0.36","0.26","0.58","0.53","0.38"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}},{"id":"sd","name":"Std. Dev.","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["0.29","0.23","0.40","0.11","0.21","0.26","0.07","0.01","0.01","0.05","0.09","0.08","0.01","0.16","0.01","0.28","0.10","0.29","0.15","0.02","0.25","0.34","0.13","0.13","0.09","0.20","0.17","0.01","0.22","0.12","0.09","0.35","0.08","0.12","0.16","0.02","0.12","0.03","0.08","0.35","0.14","0.01","0.11","0.18","0.12","0.05","0.32","0.09","0.06","0.02","0.03","0.16","0.08","0.01","0.01","0.19","0.13","0.14","0.01","0.21","0.21","0.28","0.15","0.23","0.09","0.27","0.19","0.07","0.28","0.01","0.07","0.27","0.07","0.17","0.01","0.02","0.02","0.12","0.04","0.01","0.06","0.05","0.18","0.04","0.02","0.05","0.08","0.03","0.07","0.19","0.25","0.11","0.01","0.00","0.14","0.32","0.06","0.14","0.20","0.02","0.14","0.04","0.07","0.06","0.36","0.03","0.13","0.29","0.34","0.25","0.01","0.00","0.28","0.23","0.08","0.00","0.05","0.02","0.03","0.11","0.08","0.20","0.27","0.06","0.32","0.20","0.22","0.23","0.18","0.05","0.00","0.13","0.35","0.21","0.05","0.20","0.02","0.07","0.21","0.09","0.24","0.02","0.03","0.04","0.06","0.11","0.02","0.35","0.22","0.07","0.01","0.24","0.11","0.09","0.12","0.00","0.01","0.04","0.27","0.09","0.08","0.14","0.22","0.38","0.17","0.02","0.18","0.03","0.13","0.17","0.07","0.03","0.04","0.02","0.27","0.09","0.03","0.18","0.08","0.13","0.16","0.11","0.14"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}},{"id":"min","name":"Min","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["0.01","0.02","0.02","0.33","0.05","0.24","0.65","0.91","0.92","0.30","0.19","0.40","0.89","0.20","0.95","0.27","0.48","0.10","0.40","0.83","0.20","0.17","0.45","0.10","0.12","0.01","0.22","0.91","0.19","0.18","0.18","0.12","0.04","0.41","0.17","0.90","0.57","0.22","0.59","0.24","0.12","0.94","0.12","0.35","0.49","0.18","0.09","0.01","0.03","0.87","0.18","0.05","0.56","0.94","0.92","0.41","0.41","0.25","0.94","0.38","0.21","0.05","0.14","0.04","0.57","0.11","0.29","0.62","0.31","0.94","0.55","0.19","0.11","0.11","0.91","0.80","0.88","0.48","0.78","0.91","0.51","0.46","0.21","0.70","0.44","0.50","0.06","0.79","0.56","0.35","0.24","0.11","0.89","0.92","0.39","0.09","0.55","0.32","0.36","0.86","0.28","0.72","0.49","0.67","0.16","0.78","0.29","0.09","0.11","0.21","0.92","0.95","0.13","0.24","0.46","0.01","0.68","0.92","0.33","0.22","0.21","0.16","0.32","0.61","0.14","0.41","0.20","0.30","0.28","0.33","0.28","0.13","0.16","0.15","0.19","0.33","0.13","0.69","0.37","0.51","0.24","0.69","0.86","0.75","0.64","0.07","0.62","0.12","0.38","0.12","0.08","0.23","0.44","0.10","0.52","0.96","0.92","0.06","0.26","0.17","0.57","0.32","0.32","0.05","0.30","0.84","0.31","0.06","0.25","0.10","0.61","0.32","0.84","0.89","0.30","0.10","0.78","0.33","0.24","0.12","0.37","0.28","0.10"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}},{"id":"median","name":"Median","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["0.65","0.16","0.75","0.46","0.27","0.90","0.73","0.95","0.94","0.42","0.32","0.53","0.91","0.59","0.96","0.86","0.53","0.84","0.84","0.87","0.82","0.87","0.61","0.12","0.29","0.36","0.58","0.94","0.92","0.46","0.38","0.93","0.25","0.62","0.55","0.95","0.90","0.25","0.83","0.95","0.25","0.97","0.42","0.83","0.84","0.32","0.68","0.23","0.06","0.95","0.31","0.37","0.76","0.96","0.95","0.79","0.73","0.25","0.96","0.88","0.94","0.46","0.40","0.50","0.75","0.64","0.72","0.89","0.87","0.96","0.74","0.24","0.21","0.18","0.95","0.83","0.93","0.71","0.88","0.94","0.59","0.53","0.43","0.78","0.56","0.61","0.10","0.92","0.58","0.73","0.42","0.11","0.93","0.95","0.64","0.61","0.57","0.38","0.76","0.91","0.53","0.87","0.67","0.77","0.88","0.84","0.43","0.61","0.86","0.63","0.95","0.96","0.64","0.69","0.64","0.01","0.78","0.97","0.40","0.49","0.31","0.56","0.88","0.82","0.81","0.64","0.69","0.87","0.96","0.38","0.28","0.28","0.87","0.46","0.30","0.88","0.16","0.80","0.56","0.69","0.39","0.72","0.93","0.94","0.82","0.25","0.68","0.83","0.88","0.18","0.09","0.96","0.60","0.20","0.88","0.97","0.95","0.12","0.84","0.33","0.70","0.58","0.77","0.17","0.54","0.89","0.46","0.10","0.49","0.45","0.74","0.37","0.90","0.94","0.94","0.18","0.86","0.86","0.38","0.18","0.67","0.54","0.42"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}},{"id":"max","name":"Max","type":"numeric","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","cell":["0.98","0.57","0.90","0.61","0.63","0.94","0.90","0.95","0.95","0.60","0.55","0.66","0.92","0.82","0.97","0.92","0.77","0.86","0.86","0.89","0.87","0.91","0.85","0.50","0.44","0.54","0.71","0.94","0.93","0.55","0.42","0.96","0.30","0.82","0.67","0.96","0.94","0.34","0.92","0.96","0.54","0.97","0.47","0.89","0.91","0.42","0.84","0.25","0.22","0.96","0.37","0.56","0.82","0.97","0.95","0.87","0.91","0.90","0.97","0.94","0.96","0.75","0.58","0.80","0.91","0.77","0.82","0.92","0.95","0.96","0.77","0.80","0.39","0.53","0.96","0.85","0.94","0.81","0.91","0.94","0.67","0.63","0.78","0.83","0.59","0.75","0.35","0.95","0.73","0.82","0.87","0.49","0.95","0.95","0.77","0.87","0.75","0.74","0.84","0.92","0.75","0.90","0.73","0.91","0.92","0.90","0.64","0.76","0.88","0.84","0.95","0.97","0.86","0.83","0.66","0.02","0.84","0.97","0.45","0.55","0.45","0.67","0.91","0.83","0.87","0.89","0.76","0.96","0.97","0.46","0.28","0.57","0.92","0.72","0.41","0.91","0.18","0.89","0.92","0.89","0.83","0.73","0.95","0.94","0.85","0.44","0.71","0.87","0.94","0.34","0.11","0.96","0.83","0.48","0.90","0.98","0.96","0.19","0.95","0.46","0.82","0.75","0.88","0.88","0.74","0.90","0.82","0.20","0.73","0.59","0.86","0.42","0.94","0.95","0.96","0.37","0.88","0.88","0.47","0.50","0.82","0.69","0.52"],"html":true,"align":"right","headerStyle":{"font-weight":"normal"}}],"searchable":true,"defaultPageSize":10,"showPageSizeOptions":true,"pageSizeOptions":[10,25,50,100],"paginationType":"numbers","showPagination":true,"showPageInfo":true,"minRows":1,"compact":true,"height":"auto","theme":{"color":"#333333","backgroundColor":"#FFFFFF","stripedColor":"rgba(128,128,128,0.05)","style":{"fontFamily":"system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif"},"tableStyle":{"borderTopStyle":"solid","borderTopWidth":"2px","borderTopColor":"#D3D3D3"},"headerStyle":{"borderBottomStyle":"solid","borderBottomWidth":"2px","borderBottomColor":"#D3D3D3"}},"elementId":"knsvgjtoqm","dataKey":"87136adaa4c96094bba8b2cdbd7c2e33"},"children":[]},"class":"reactR_markup"},"evals":["tag.attribs.columns.0.style","tag.attribs.columns.1.style","tag.attribs.columns.2.style","tag.attribs.columns.3.style","tag.attribs.columns.4.style","tag.attribs.columns.5.style","tag.attribs.columns.6.style","tag.attribs.columns.7.style","tag.attribs.columns.8.style"],"jsHooks":[]}</script>
</div>

Finally, you can use `searchdem` to find specific indicators or all of
the indicators used to construct an index. For example, we can use
`searchdem` to find all of the indicators used to construct the civil
liberties index.

``` r
library(vdemlite)
## search for indicators that contain the word "civil liberties"
searchdem("civil liberties")
```

<div id="pqcbcyeykc" class=".gt_table" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#pqcbcyeykc table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#pqcbcyeykc thead, #pqcbcyeykc tbody, #pqcbcyeykc tfoot, #pqcbcyeykc tr, #pqcbcyeykc td, #pqcbcyeykc th {
  border-style: none;
}
&#10;#pqcbcyeykc p {
  margin: 0;
  padding: 0;
}
&#10;#pqcbcyeykc .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#pqcbcyeykc .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#pqcbcyeykc .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#pqcbcyeykc .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#pqcbcyeykc .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#pqcbcyeykc .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#pqcbcyeykc .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#pqcbcyeykc .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#pqcbcyeykc .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#pqcbcyeykc .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#pqcbcyeykc .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#pqcbcyeykc .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#pqcbcyeykc .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#pqcbcyeykc .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#pqcbcyeykc .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pqcbcyeykc .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#pqcbcyeykc .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#pqcbcyeykc .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#pqcbcyeykc .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pqcbcyeykc .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#pqcbcyeykc .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pqcbcyeykc .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#pqcbcyeykc .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pqcbcyeykc .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#pqcbcyeykc .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pqcbcyeykc .gt_left {
  text-align: left;
}
&#10;#pqcbcyeykc .gt_center {
  text-align: center;
}
&#10;#pqcbcyeykc .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#pqcbcyeykc .gt_font_normal {
  font-weight: normal;
}
&#10;#pqcbcyeykc .gt_font_bold {
  font-weight: bold;
}
&#10;#pqcbcyeykc .gt_font_italic {
  font-style: italic;
}
&#10;#pqcbcyeykc .gt_super {
  font-size: 65%;
}
&#10;#pqcbcyeykc .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#pqcbcyeykc .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#pqcbcyeykc .gt_indent_1 {
  text-indent: 5px;
}
&#10;#pqcbcyeykc .gt_indent_2 {
  text-indent: 10px;
}
&#10;#pqcbcyeykc .gt_indent_3 {
  text-indent: 15px;
}
&#10;#pqcbcyeykc .gt_indent_4 {
  text-indent: 20px;
}
&#10;#pqcbcyeykc .gt_indent_5 {
  text-indent: 25px;
}
&#10;#pqcbcyeykc .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#pqcbcyeykc div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<div style="font-family:system-ui, &#39;Segoe UI&#39;, Roboto, Helvetica, Arial, sans-serif;border-top-style:solid;border-top-width:2px;border-top-color:#D3D3D3;">
<div class="gt_heading gt_title gt_font_normal" style="text-size:bigger;">Variable Tags and Descriptions</div>
<div class="gt_heading gt_subtitle "></div>
</div>
<div id="pqcbcyeykc" class="reactable html-widget" style="width:auto;height:auto;"></div>
<script type="application/json" data-for="pqcbcyeykc">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"tag":[],"name":[],"level":[],"part":[]},"columns":[{"id":"tag","name":"Tag","type":"character","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"left","headerStyle":{"font-weight":"normal"}},{"id":"name","name":"Descriptor","type":"character","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"left","headerStyle":{"font-weight":"normal"}},{"id":"level","name":"Level","type":"character","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"left","headerStyle":{"font-weight":"normal"}},{"id":"part","name":"Part","type":"character","minWidth":125,"style":"function(rowInfo, colInfo) {\nconst rowIndex = rowInfo.index + 1\n}","html":true,"align":"left","headerStyle":{"font-weight":"normal"}}],"filterable":true,"defaultPageSize":10,"showPageSizeOptions":true,"pageSizeOptions":[10,25,50,100],"paginationType":"numbers","showPagination":true,"showPageInfo":true,"minRows":1,"compact":true,"height":"auto","theme":{"color":"#333333","backgroundColor":"#FFFFFF","stripedColor":"rgba(128,128,128,0.05)","style":{"fontFamily":"system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif"},"tableStyle":{"borderTopStyle":"solid","borderTopWidth":"2px","borderTopColor":"#D3D3D3"},"headerStyle":{"borderBottomStyle":"solid","borderBottomWidth":"2px","borderBottomColor":"#D3D3D3"}},"elementId":"pqcbcyeykc","dataKey":"eb9b5c0bfd51ec1460b3028f1ecbeb53"},"children":[]},"class":"reactR_markup"},"evals":["tag.attribs.columns.0.style","tag.attribs.columns.1.style","tag.attribs.columns.2.style","tag.attribs.columns.3.style"],"jsHooks":[]}</script>
</div>

`searchdem()` without any arguments produces a searchable HTML table of
all indicators in the dataset.
