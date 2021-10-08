function downloadPdfs {
    param(
    [string] $site
  )
    cd "C:\temp\"
    $psPage = Invoke-WebRequest $site
    $urls = $psPage.ParsedHtml.getElementsByTagName("A")
    $urls |  where {$_.pathname -like "*pdf"} | % {Invoke-WebRequest -Uri "$site$($_.pathname)" -OutFile $_.pathname }
}

downloadPdfs  -site "http://test.test/"
