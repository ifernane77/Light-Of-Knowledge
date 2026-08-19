Write-Host "===================================="
Write-Host " Light of Knowledge"
Write-Host " Verification de l'environnement"
Write-Host "===================================="
Write-Host ""

Write-Host "Version de PHP :"
php -v

Write-Host ""
Write-Host "Version de Git :"
git --version

Write-Host ""
Write-Host "Etat du depot Git :"
git status --short

Write-Host ""
Write-Host "Verification terminee."