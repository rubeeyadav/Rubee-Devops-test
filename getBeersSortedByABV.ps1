param (
    [float]$minABV = 5.0  # Selected minimum ABV if no parameter is provided
)


# Define the API endpoint
$apiUrl = "https://s3-eu-west-1.amazonaws.com/kg-it/devopsTest/api-punkapi-com-v2-beers.json"

# GET request to the API
$response = Invoke-RestMethod -Uri $apiUrl -Method Get

# Filter beers with ABV greater than the selected minimum ABV
$filteredBeers = $response | Where-Object { $_.abv -gt $minABV }

# Sort beers by ABV in descending order
$sortedBeers = $filteredBeers | Sort-Object { $_.abv } -Descending

# Print the sorted beer list in CSV format (Name, ABV)
foreach ($beer in $sortedBeers) {
    Write-Output "$($beer.name), $($beer.abv)"
}
