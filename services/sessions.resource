*** Settings ***

Documentation     Consuming the The Opendatasoft Explore API by Swiss Post

Resource    ../resources/base.resource

Library        RequestsLibrary

*** Variables ***
${BASE_URL}    https://swisspost.opendatasoft.com/api/explore/v2.1

*** Keywords ***

Get CSV Export Data         
    
    Create Session   swisspost    ${BASE_URL}/catalog/exports/csv    headers=${headers}
    
    &{params}=   Create Dictionary   delimiter=\;
    ...                                 list_separator=,
    ...                                 quote_all=false
    ...                                 with_bom=true

   ${resp_swisspost}=   GET On Session   swisspost   /   params=${params}   expected_status=200
    Log To Console   ${resp_swisspost.text}

Get Request Catalog Exports

    Create Session   catexp    ${BASE_URL}/catalog/exports

    ${resp_catexp}=        GET On Session  catexp  /  expected_status=200

    Log To Console    ${resp_catexp.json()}


