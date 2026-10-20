#!/bin/bash
set -eo pipefail

PROFILE="/home/lumen/src/gost-profile-lumen/profile.md"

echo "=== [TEST] Auditoria Normativa do Perfil Lumen (profile.md) ==="

check_pattern() {
    local pattern="$1"
    local desc="$2"
    if grep -qF -- "$pattern" "$PROFILE"; then
        echo "  [PASS] $desc"
    else
        echo "  [FAIL] $desc (padrão '$pattern' não encontrado)"
        return 1
    fi
}

FAILED=0

# 1. Frontmatter
check_pattern 'target_gost: "1.5.0"' "Frontmatter target_gost atualizado para 1.5.0" || FAILED=1

# 2. Seção 7 - OpenDesktop XDG
check_pattern '## 7. Protocolo Soberano de Atualização e Conformidade OpenDesktop (XDG Base Directory)' "Cabeçalho da Seção 7 presente" || FAILED=1
check_pattern '$XDG_CONFIG_HOME' "Resolução XDG_CONFIG_HOME" || FAILED=1
check_pattern '$XDG_STATE_HOME' "Resolução XDG_STATE_HOME" || FAILED=1
check_pattern 'update_check.json' "Arquivo de cache update_check.json" || FAILED=1
check_pattern 'check_interval_hours' "Campo check_interval_hours no TOML" || FAILED=1
check_pattern 'auto_check' "Campo auto_check no TOML" || FAILED=1
check_pattern 'pinned' "Campo pinned no TOML" || FAILED=1
check_pattern 'stderr' "Alerta exclusivamente via stderr" || FAILED=1

# 3. Seção 8 - Banca
check_pattern '## 8. Arquitetura de Distribuição Soberana na Banca (`banca.2lp.in`)' "Cabeçalho da Seção 8 presente" || FAILED=1
check_pattern 'https://banca.2lp.in/downloads/' "Endpoint de downloads da Banca" || FAILED=1
check_pattern 'stable-latest' "Alias estável stable-latest" || FAILED=1
check_pattern 'nightly-latest' "Alias nightly nightly-latest" || FAILED=1
check_pattern 'index.json' "Manifesto atômico index.json" || FAILED=1
check_pattern 'scripts/rotate-downloads.py' "Script de rotação de downloads" || FAILED=1
check_pattern '5 versões mais recentes' "Regra de retenção de 5 versões estáveis" || FAILED=1
check_pattern '10 versões mais recentes' "Regra de retenção de 10 versões nightlies" || FAILED=1
check_pattern 'Veto Absoluto a Binários no Codeberg / Git' "Veto absoluto a binários no Codeberg/Git" || FAILED=1

if [ $FAILED -ne 0 ]; then
    echo "❌ [RED TEST] Auditoria falhou: profile.md ainda não implementou a especificação completa."
    exit 1
fi

echo "✔ [GREEN TEST] Auditoria aprovada: profile.md possui todas as seções e diretivas canônicas."
exit 0
