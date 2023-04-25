*** Variables ***
${BROWSER} =            chrome
${SEARCH_TERM} =        Ferrari 458

#Example for data driven
${ENVIRONMENT} =    prod
&{BASE_URL}         sit=https://www.amazon.com/     uat=https://www.amazon.com/     prod=https://www.amazon.com/
${INVALID_CREDENTIALS_CSV_PATH} =   C://Users//Natth//RF_Projects//Amazon//Data//Amazon_Users.csv
