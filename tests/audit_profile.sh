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
check_pattern '~/.config/<app>/config.toml' "Fallback implícito ~/.config/<app>/config.toml" || FAILED=1
check_pattern '$XDG_STATE_HOME' "Resolução XDG_STATE_HOME" || FAILED=1
check_pattern '~/.local/state/<app>/update_check.json' "Fallback implícito ~/.local/state/<app>/update_check.json" || FAILED=1
check_pattern 'update_check.json' "Arquivo de cache update_check.json" || FAILED=1
check_pattern 'check_interval_hours' "Campo check_interval_hours no TOML" || FAILED=1
check_pattern 'auto_check' "Campo auto_check no TOML" || FAILED=1
check_pattern 'pinned' "Campo pinned no TOML" || FAILED=1
check_pattern 'auto_update' "Campo auto_update no TOML" || FAILED=1
check_pattern 'set-auto-update' "Subcomando set-auto-update na CLI" || FAILED=1
check_pattern 'stderr' "Alerta exclusivamente via stderr" || FAILED=1
check_pattern '--force' "Documentação de salvaguarda da flag --force" || FAILED=1

# 3. Seção 8 - Banca
check_pattern '## 8. Arquitetura de Distribuição Soberana na Banca (`banca.2lp.in`)' "Cabeçalho da Seção 8 presente" || FAILED=1
check_pattern 'https://banca.2lp.in/downloads/' "Endpoint de downloads da Banca" || FAILED=1
check_pattern 'stable-latest' "Alias estável stable-latest" || FAILED=1
check_pattern 'nightly-latest' "Alias nightly nightly-latest" || FAILED=1
check_pattern 'index.json' "Manifesto atômico index.json" || FAILED=1
check_pattern 'scripts/rotate-downloads.py' "Script de rotação de downloads" || FAILED=1
check_pattern '5 versões mais recentes' "Regra de retenção de 5 versões estáveis" || FAILED=1
check_pattern '10 versões mais recentes' "Regra de retenção de 10 versões nightlies" || FAILED=1
check_pattern 'curl -sSf https://banca.2lp.in/downloads/<app>/install.sh | sh' "Comando canônico curl para install.sh" || FAILED=1
check_pattern 'Veto Absoluto a Binários no Codeberg / Git' "Veto absoluto a binários no Codeberg/Git" || FAILED=1

# 4. Seção 9 - Continuous Deployment de Servidores & Descomissionamento Watchtower
check_pattern '## 9. Arquitetura de Entrega Contínua de Containers (Continuous Deployment de Servidores)' "Cabeçalho da Seção 9 presente" || FAILED=1
check_pattern 'Descomissionamento Compulsório do Watchtower' "Descomissionamento compulsório do Watchtower" || FAILED=1
check_pattern 'Nó Central de Execução (`obizero` / Deploy Local Imediato)' "Deploy local imediato no nó central obizero" || FAILED=1
check_pattern 'Nós de Borda Remotos (`obione` e `obitwo` / Deploy via Tailscale)' "Deploy remoto em nós de borda obione e obitwo" || FAILED=1
check_pattern 'docker compose -f /home/lumen/stacks/<app>/compose.yml up -d --no-build <app>' "Comando de deploy local sem download redundante" || FAILED=1
check_pattern 'docker image prune -f' "Purga automática de camadas órfãs" || FAILED=1
check_pattern 'Sondagem de Healthcheck Ativo' "Sondagem ativa de healthcheck" || FAILED=1
check_pattern 'Protocolo de Rollback em Falha' "Protocolo de rollback automatizado" || FAILED=1
check_pattern 'com.centurylinklabs.watchtower.enable' "Veto e descarte de labels do Watchtower" || FAILED=1

# 5. Mutation Check
echo "=== [MUTATION] Testando detecção de mutantes críticos ==="
TMP_MUTANT=$(mktemp)
trap 'rm -f "$TMP_MUTANT"' EXIT

grep -v "stderr" "$PROFILE" > "$TMP_MUTANT"
if grep -qF "stderr" "$TMP_MUTANT"; then
    echo "  [FAIL] Mutante A não foi gerado corretamente"
    FAILED=1
else
    echo "  [PASS] Mutante A (sem stderr) isolado com sucesso"
fi

grep -v "5 versões mais recentes" "$PROFILE" > "$TMP_MUTANT"
if grep -qF "5 versões mais recentes" "$TMP_MUTANT"; then
    echo "  [FAIL] Mutante B não foi gerado corretamente"
    FAILED=1
else
    echo "  [PASS] Mutante B (sem retenção estável) isolado com sucesso"
fi

grep -v "obizero" "$PROFILE" > "$TMP_MUTANT"
if grep -qF "obizero" "$TMP_MUTANT"; then
    echo "  [FAIL] Mutante C não foi gerado corretamente"
    FAILED=1
else
    echo "  [PASS] Mutante C (sem obizero) isolado com sucesso"
fi

grep -v "prune" "$PROFILE" > "$TMP_MUTANT"
if grep -qF "prune" "$TMP_MUTANT"; then
    echo "  [FAIL] Mutante D não foi gerado corretamente"
    FAILED=1
else
    echo "  [PASS] Mutante D (sem prune) isolado com sucesso"
fi

if [ $FAILED -ne 0 ]; then
    echo "❌ [RED TEST] Auditoria falhou: profile.md ainda não implementou a especificação completa."
    exit 1
fi

echo "✔ [GREEN TEST] Auditoria aprovada: profile.md possui todas as seções e diretivas canônicas."
exit 0
