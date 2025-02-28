$arquivos = @("api_contas\.gitignore", "adm-front-contas\.gitignore", "user-front-contas\.gitignore")

$arquivoFinal = ".gitignore"

$conteudoFinal = @()

foreach ($arquivo in $arquivos) {
    if (Test-Path $arquivo) {
        $conteudo = Get-Content $arquivo | Out-String
        $conteudoFinal += $conteudo -split "`r?`n"
    }
}

$conteudoFinal | Sort-Object -Unique | Set-Content $arquivoFinal -Encoding utf8

Write-Host "Arquivo .gitignore consolidado criado com sucesso!" -ForegroundColor Green
