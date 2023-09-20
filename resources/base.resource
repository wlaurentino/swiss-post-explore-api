*** Settings ***

Documentation        All necessary for the tests 

Resource            ../services/sessions.resource

Library        JSONLibrary

*** Variables ***

${BASE_URL}        https://swisspost.opendatasoft.com/api/explore/v2.1
&{headers}=   accept=*/*