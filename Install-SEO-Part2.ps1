Write-Host ""
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host " SEO & PWA - PART 2" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

$Public = ".\public"

if (!(Test-Path $Public)) {
    New-Item -ItemType Directory -Path $Public | Out-Null
    Write-Host "[OK] Public folder created." -ForegroundColor Green
}

# robots.txt
@"
User-agent: *

Allow: /

Sitemap: https://www.samanthawasike.com/sitemap.xml
"@ | Set-Content "$Public\robots.txt" -Encoding UTF8

Write-Host "[OK] robots.txt created." -ForegroundColor Green

# sitemap.xml
@"
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

<url>
<loc>https://www.samanthawasike.com/</loc>
<priority>1.0</priority>
</url>

</urlset>
"@ | Set-Content "$Public\sitemap.xml" -Encoding UTF8

Write-Host "[OK] sitemap.xml created." -ForegroundColor Green

# manifest.webmanifest
@"
{
    "name":"Samantha Wasike",
    "short_name":"Samantha",
    "description":"Certified Nursing Assistant",
    "start_url":"/",
    "display":"standalone",
    "background_color":"#ffffff",
    "theme_color":"#2563eb",
    "icons":[
        {
            "src":"/hero.png",
            "sizes":"512x512",
            "type":"image/png"
        }
    ]
}
"@ | Set-Content "$Public\manifest.webmanifest" -Encoding UTF8

Write-Host "[OK] manifest.webmanifest created." -ForegroundColor Green

# site.webmanifest
Copy-Item `
    "$Public\manifest.webmanifest" `
    "$Public\site.webmanifest" `
    -Force

Write-Host "[OK] site.webmanifest created." -ForegroundColor Green

# browserconfig.xml
@"
<?xml version="1.0" encoding="utf-8"?>

<browserconfig>

<msapplication>

<tile>

<square150x150logo src="/hero.png"/>

<TileColor>#2563eb</TileColor>

</tile>

</msapplication>

</browserconfig>
"@ | Set-Content "$Public\browserconfig.xml" -Encoding UTF8

Write-Host "[OK] browserconfig.xml created." -ForegroundColor Green

Write-Host ""
Write-Host "===================================================="
Write-Host " PART 2 COMPLETE"
Write-Host "===================================================="
Write-Host ""
Write-Host "Files created:"
Write-Host "  public\robots.txt"
Write-Host "  public\sitemap.xml"
Write-Host "  public\manifest.webmanifest"
Write-Host "  public\site.webmanifest"
Write-Host "  public\browserconfig.xml"