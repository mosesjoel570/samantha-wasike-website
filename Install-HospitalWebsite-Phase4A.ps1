Write-Host ""
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host " HOSPITAL WEBSITE - PHASE 4A" -ForegroundColor Green
Write-Host " Premium Assets & Theme Setup" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$Root = Get-Location

#---------------------------------------------------
# Backup
#---------------------------------------------------

$BackupFolder = Join-Path $Root "backup"

if(!(Test-Path $BackupFolder)){
    New-Item -ItemType Directory $BackupFolder | Out-Null
}

Write-Host "[OK] Backup folder ready." -ForegroundColor Green

#---------------------------------------------------
# Asset Directories
#---------------------------------------------------

$Folders = @(
"src\assets",
"src\assets\images",
"src\assets\doctors",
"src\assets\gallery",
"src\assets\icons",
"src\theme",
"src\components\ui"
)

foreach($Folder in $Folders){

    if(!(Test-Path $Folder)){
        New-Item -ItemType Directory -Force $Folder | Out-Null
        Write-Host "[OK] $Folder"
    }

}

#---------------------------------------------------
# Theme Colors
#---------------------------------------------------

@'
export const colors = {
  primary: "#0F4C81",
  secondary: "#1E88E5",
  accent: "#14B8A6",

  success: "#22C55E",
  warning: "#F59E0B",
  danger: "#EF4444",

  background: "#F8FAFC",

  white: "#FFFFFF",

  text: "#0F172A",

  gray100:"#F1F5F9",
  gray200:"#E2E8F0",
  gray300:"#CBD5E1",
  gray400:"#94A3B8",
  gray500:"#64748B",
  gray600:"#475569",
  gray700:"#334155",
  gray800:"#1E293B",
  gray900:"#0F172A"
};

export default colors;
'@ | Set-Content "src\theme\colors.ts" -Encoding UTF8

Write-Host "[OK] colors.ts"

#---------------------------------------------------
# Theme Index
#---------------------------------------------------

@'
export * from "./colors";
'@ | Set-Content "src\theme\index.ts" -Encoding UTF8

Write-Host "[OK] theme index"

#---------------------------------------------------
# Placeholder Assets
#---------------------------------------------------

$Files = @(
"src\assets\images\hero.jpg",
"src\assets\images\hospital.jpg",
"src\assets\doctors\doctor.jpg",
"src\assets\gallery\gallery1.jpg",
"src\assets\gallery\gallery2.jpg",
"src\assets\gallery\gallery3.jpg",
"src\assets\gallery\gallery4.jpg",
"src\assets\gallery\gallery5.jpg",
"src\assets\gallery\gallery6.jpg"
)

foreach($File in $Files){

    if(!(Test-Path $File)){
        New-Item -ItemType File $File | Out-Null
    }

}

Write-Host "[OK] Asset placeholders created."

#---------------------------------------------------
# Site Config
#---------------------------------------------------

@'
export const site = {

name:"Dr. Samantha Hospital",

phone:"+254704271129",

email:"wasikesamantha03@gmail.com",

address:"Nairobi, Kenya",

whatsapp:"+254704271129",

facebook:"#",

instagram:"#",

linkedin:"#"

};
'@ | Set-Content "src\theme\site.ts" -Encoding UTF8

Write-Host "[OK] site.ts"

#---------------------------------------------------
# Image README
#---------------------------------------------------

@'
Add your images here.

images/
hero.jpg
hospital.jpg

doctors/
doctor.jpg

gallery/
gallery1.jpg
gallery2.jpg
gallery3.jpg
gallery4.jpg
gallery5.jpg
gallery6.jpg
'@ | Set-Content "src\assets\README.txt" -Encoding UTF8

Write-Host "[OK] README"

Write-Host ""
Write-Host "===============================================" -ForegroundColor Green
Write-Host " PHASE 4A COMPLETED SUCCESSFULLY" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next:"
Write-Host "Phase 4B - Premium UI Components"
Write-Host ""