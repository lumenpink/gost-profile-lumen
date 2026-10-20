# Perfil de Implementação GOST: Lumen

```yaml
---
id: lumen
name: "Perfil de Implementação Lumen"
extends: "https://kollontai.2lp.in/profile.md"
target_gost: "1.5.0"
maintainer: "Lumen Pink <hi@lumen.pink>"
canonical_url: "https://gostlumen.2lp.in/profile.md"
---
```

> **Sobre este Perfil:**  
> O perfil **Lumen** é a especialização pessoal e autoral do padrão **[GOST](https://codeberg.org/lumenpink/gost)**.  
> Ele estende diretamente o perfil base **[Kollontai](https://kollontai.2lp.in)** (`extends: https://kollontai.2lp.in/profile.md`), herdando integralmente todas as suas decisões de infraestrutura (Codeberg, `cccp`, deploy em `*.2lp.in`, esteira de CI/CD, runners OCI e testes herméticos), aplicando regras de precedência soberana (*deep override*) para estilização, identidade, Open Graph e ergonomia de documentação.

---

## 1. Identidade e Herança (*Cascading Profile*)

* **Perfil Pai:** `https://kollontai.2lp.in/profile.md` (Kollontai)
* **Precedência:** Qualquer regra explicitada neste documento tem precedência estrita sobre o perfil pai. Todas as regras não mencionadas aqui são herdadas automaticamente do Kollontai e da norma central GOST.
* **Domínio Canônico:** `https://gostlumen.2lp.in`
* **Forja Primária:** Codeberg (`https://codeberg.org/lumenpink/gost-profile-lumen`)

---

## 2. Exibição Estrita de Versões Semânticas

Para garantir legibilidade instantânea em cabeçalhos de tela sem abrir mão do rastreamento rigoroso de builds de desenvolvimento, projetos sob o perfil Lumen **DEVEM** aderir à seguinte regra de apresentação de versões:

1. **Título, Badges e Cabeçalhos (Versão Short):**
   - **Formato:** `v{MAJOR}.{MINOR}.{PATCH}`
   - **Regra de Truncamento:** A versão exibida em tags visuais, badges e títulos principais **DEVE** ser truncada antes de qualquer metadado de build (cortada imediatamente antes do caractere `+` ou preservada limpa se tag de release final).
   - *Exemplo:* Se o arquivo `VERSION` contiver `0.1.0+20261013`, o título e badges exibem estritamente `v0.1.0`.

2. **Rodapé Canônico (Versão Long / Completa):**
   - **Formato:** String integral idêntica ao conteúdo do arquivo `VERSION` na raiz do repositório.
   - *Exemplo:* `Joaju v0.1.0+20261013 • por Lumen Pink • Brasil 🇧🇷 • CC0-1.0`

---

## 3. Rodapé Canônico em Duas Linhas (Afirmação Identitária & Soberania)

Todo projeto, interface gráfica, vitrine pública ou documentação estática (`./site`) **DEVE** exibir o rodapé canônico formatado em **duas linhas rigorosamente estruturadas**:

```html
<footer class="footer">
  <p>Orgulhosamente produzido por uma <a href="https://travesti.2lp.in/pt/" target="_blank" rel="noopener">travesti latina</a> 🏳️‍⚧️ :)</p>
  <p>{Nome do Projeto} v{Versão Completa} • por <a href="https://lumen.pink" target="_blank" rel="noopener">Lumen Pink</a> • Brasil 🇧🇷 • <a href="LICENSE">LICENSE</a></p>
</footer>
```

### Regras do Rodapé:
* **Linha 1 — Afirmação Identitária Transfeminista:**  
  `Orgulhosamente produzido por uma [travesti latina](https://travesti.2lp.in/<lang>/) 🏳️‍⚧️ :)`  
  - O termo *travesti* é mantido sem tradução em todas as versões idiomáticas (PT, EN, ES, RU, etc.).
  - O adjetivo concorda gramaticalmente com a língua de exibição e inclui link com o código de idioma ativo (`/pt/`, `/en/`, etc.).
* **Linha 2 — Metadados de Soberania, Autoria e Licença:**  
  `{Nome do Projeto} v{Versão Completa} • por [Lumen Pink](https://lumen.pink) • Brasil 🇧🇷 • [{Licença}](LICENSE)`  
  - Exibe a versão integral de `VERSION`, o link autoral e o link relativo para o arquivo de licença no repositório.

---

## 4. Banners, Open Graph & Cards Sociais (Padrão KokoroSim)

O compartilhamento de links de projetos em redes sociais e mensageiros (WhatsApp, Telegram, Discord, Twitter/X, LinkedIn) **DEVE** aderir à arquitetura visual e técnica anti-recorte KokoroSim:

### 4.1 Especificações da Imagem Open Graph (`./site/assets/og_preview.png`)
* **Resolução Obrigatória:** Exatamente `1200 × 630 pixels` (proporção 1.91:1, formato PNG otimizado, espaço de cores sRGB).
* **Safe Zone 4:3 Centralizada (Anti-Recorte):**
  - **Largura Central Útil:** Entre `720px` e `840px`.
  - **Altura Central Útil:** `500px`.
  - **Sangrias Laterais de Segurança:** Mínimo de `180px` a `240px` em cada lateral (reservadas exclusivamente a fundos, gradientes ou texturas decorativas, sem texto).
  - **Margens Verticais de Segurança:** Top padding mínimo de `52px`; bottom padding mínimo de `85px` (evita sobreposição por carimbos de hora ou balões de chat).

### 4.2 Limites Rigorosos de Caracteres (Anti-Truncamento)
* **`<meta property="og:title">` / `twitter:title`:** Limite seguro entre **50 e 65 caracteres** (teto máximo absoluto: 70 caracteres).
* **`<meta property="og:description">` / `twitter:description`:** Limite seguro entre **120 e 155 caracteres** (teto máximo absoluto: 160 caracteres).
* **Badge Superior Impresso no Banner:** Máximo de **35 caracteres** em caixa alta.
* **Título Principal no Banner:** Máximo de **35 a 45 caracteres** em tipografia bold condensada.
* **Subtítulo no Banner:** Máximo de **50 a 60 caracteres** em linha única.

### 4.3 Suporte Obrigatório a Dark Mode
* Todas as páginas e componentes web **DEVEM** prover suporte nativo de primeira classe a Dark Mode:
  - Definido via tokens CSS com variáveis nativas (`--bg`, `--text`, `--accent`, `--border`).
  - Respeito preferencial à diretiva de mídia `@media (prefers-color-scheme: dark)` por padrão.
  - Alternância amigável ou padrão escuro com paleta de alto contraste sem fadiga visual.
* **Página de Teste de Cards (`site/card_preview.html`):**
  - Todo site com vitrine social deve disponibilizar `site/card_preview.html` contendo simulador interativo dos cards em WhatsApp (Dark Mode) e Twitter/X (Summary Large Image).

---

## 5. Publicação Web na Borda (`gostlumen.2lp.in`)

* **Domínio Principal:** `https://gostlumen.2lp.in`
* **Hospedagem:** Cloudflare Pages / Workers através de `wrangler.jsonc` com assets estáticos servidos em `./site`.
* **Redundância:** Deploy em Codeberg Pages via branch órfã `pages` com commit stateless único e force push.

---

## 6. Governança de Documentação & Vitrine (`site_type`)

* **Tipologia Canônica:**
  - **`site_type: doc`:** Vitrines de bibliotecas, perfis e daemons (onde `site/index.html` exibe a documentação diretamente).
  - **`site_type: app`:** Aplicações web completas (como Navalha, Joaju), onde `site/index.html` carrega a SPA/WASM e toda documentação e help do usuário reside sob `site/doc/`.
* **Single Source of Truth para Documentação:**
  - Todo texto documental e tutorial vive estritamente em Markdown. É proibido duplicar textos manualmente em arquivos HTML estáticos.
  - O `README.md` da raiz atua como portal enxuto (até 50 linhas), delegando aprofundamentos para a vitrine oficial `*.2lp.in`.

---

## 7. Protocolo Soberano de Atualização e Conformidade OpenDesktop (XDG Base Directory)

Todas as aplicações de usuário final (CLI e desktop) desenvolvidas sob o perfil Lumen DEVEM incorporar o protocolo de atualização soberano e gerenciamento de configurações em conformidade com as especificações da freedesktop.org (OpenDesktop).

### 7.1 Resolução Canônica de Caminhos XDG

1. **Arquivo de Configuração do Usuário:**
   - Variável de ambiente: `$XDG_CONFIG_HOME`
   - Resolução: `${XDG_CONFIG_HOME:-~/.config}/<app>/config.toml`
   - Fallback implícito: `~/.config/<app>/config.toml`
   - Garantia de escrita atômica com permissões seguras (`0755` ou `0700` para diretórios).

2. **Arquivo de Estado de Runtime e Cache de Checagem:**
   - Variável de ambiente: `$XDG_STATE_HOME`
   - Resolução: `${XDG_STATE_HOME:-~/.local/state}/<app>/update_check.json`
   - Fallback implícito: `~/.local/state/<app>/update_check.json`
   - Isolamento total entre dados de runtime em cache e preferências editadas pelo usuário.

### 7.2 Esquema Declarativo de Configuração (`config.toml`)

O arquivo de configuração do aplicativo DEVE suportar a seção `[update]`:

```toml
[update]
# Canal de distribuição ativo: "stable" ou "nightly" (padrão: "stable")
channel = "stable"

# Trava de versão (pinning): se true, ignora avisos de atualização e bloqueia update automático (padrão: false)
pinned = false

# Versão específica fixada quando pinned = true (ex: "0.5.0")
# Se vazio e pinned = true, assume a versão atualmente instalada
pin = ""

# Verificação periódica automática de novas versões em segundo plano ao executar a CLI (padrão: true)
auto_check = true

# Intervalo mínimo em horas entre consultas remotas de rede (padrão: 24 horas)
check_interval_hours = 24
```

#### Precedência de Resolução de Canal:
`--channel <flag>` > variável de ambiente `<APP>_CHANNEL` > `config.toml` (`update.channel`) > `"stable"`

### 7.3 Esquema de Cache de Estado (`update_check.json`)

Armazenado em `$XDG_STATE_HOME/<app>/update_check.json`:

```json
{
  "last_check_timestamp": 1729411200,
  "latest_remote_version": "0.5.1",
  "channel": "stable"
}
```

### 7.4 Protocolo de Checagem Periódica e Alerta em `stderr`

Ao executar qualquer comando padrão da CLI ou ao abrir a aplicação desktop:

1. **Short-Circuit:** Se `update.auto_check == false` ou `update.pinned == true`, a checagem é desativada sem qualquer consulta de rede.
2. **Fast Cache Check (Aviso Imediato):**
   - Caso `update_check.json` indique que `latest_remote_version > current_version` (conforme SemVer 2.0.0):
   - A aplicação DEVE imprimir uma notificação sutil exclusivamente no canal **`stderr`** (preservando pipes e redirecionamentos `stdout`):
     ```text
     💡 [<app>] Nova versão disponível: vX.Y.Z (atual: vA.B.C).
        Execute '<app> update' para atualizar.
     ```
3. **Disparo de Checagem Remota Não-Bloqueante:**
   - Se `(agora - last_check_timestamp) >= check_interval_hours * 3600`:
   - Uma consulta HTTP ao endpoint `https://banca.2lp.in/downloads/<app>/<channel>-latest.version` DEVE ser executada de forma desacoplada ou com timeout síncrono ultra-rápido ($\le 1$ segundo).
   - Se bem-sucedida, atualiza `update_check.json`.
   - Se falhar por timeout ou indisponibilidade de rede, a falha DEVE ser descartada silenciosamente, apenas postergando o `last_check_timestamp` para a próxima janela.

### 7.5 Política de Travamento de Versão (Pinning)

1. Quando `pinned = true` ou `pin` contém uma versão fixada:
   - `<app> check-update` informa: `📌 Versão pinada em v<ver>. Atualizações automáticas ignoradas.`
   - `<app> update` bloqueia a substituição a menos que a flag `--force` seja explicitamente passada.
   - O aviso periódico no arranque permanece em silêncio.

### 7.6 Contrato Universal de CLI

Todo aplicativo sob o perfil Lumen DEVE fornecer os seguintes subcomandos:

- `<app> update [--channel <c>] [--pin <v>] [--force] [--dry-run]`
- `<app> check-update [--channel <c>]`
- `<app> config show` / `<app> config get`
- `<app> config set-channel <stable|nightly>`
- `<app> config pin [<version>]`
- `<app> config unpin`
- `<app> config set-auto-check <true|false>`

---

## 8. Arquitetura de Distribuição Soberana na Banca (`banca.2lp.in`)

Para garantir soberania tecnológica, imunidade a bloqueios corporativos e eliminação total de binários pesados no Git e no Codeberg, todo artefato compilado destinado ao usuário final DEVE ser publicado e gerido exclusivamente através da **Banca**.

### 8.1 Topologia de Endpoints e Convenção de Nomes

A estrutura canônica de rotas servida pela vitrine pública (`https://banca.2lp.in/`) e pelo bucket Cloudflare R2 DEVE seguir a seguinte hierarquia por aplicativo (`<app>`):

| Recurso / Endpoint | Descrição e Finalidade |
| :--- | :--- |
| `https://banca.2lp.in/downloads/` | Vitrine interativa de downloads com seletor de apps, deep linking e checksums. |
| `https://banca.2lp.in/downloads/<app>/install.sh` | Script instalador universal autônomo (POSIX sh) executável via curl/pipe. |
| `https://banca.2lp.in/downloads/<app>/stable-latest` | Ponteiro/alias atômico para o binário mais recente do canal estável. |
| `https://banca.2lp.in/downloads/<app>/nightly-latest` | Ponteiro/alias atômico para o binário mais recente de desenvolvimento contínuo. |
| `https://banca.2lp.in/downloads/<app>/stable-latest.version` | Arquivo de texto puro contendo estritamente a versão estável atual (ex: `0.5.0\n`). |
| `https://banca.2lp.in/downloads/<app>/nightly-latest.version` | Arquivo de texto puro contendo a versão nightly atual (ex: `0.5.0-dev.216+20261020.ba9aaf0\n`). |
| `https://banca.2lp.in/downloads/<app>/index.json` | Manifesto atômico estruturado detalhando versões ativas, hashes SHA-256 e timestamps. |
| `https://banca.2lp.in/downloads/<app>/<app>-<version>-linux-x86_64` | Binário imutável versionado correspondente à release específica. |

### 8.2 Política Estrita de Retenção e Expurgos (Cloudflare R2)

A esteira de automação da Banca DEVE executar rotação atômica (`scripts/rotate-downloads.py`) a cada publicação, mantendo o armazenamento rigorosamente enxuto:
1. **Canal Estável (`stable`):** Retenção de **estritamente as 5 versões mais recentes**.
2. **Canal Noturno / Rolling (`nightly`):** Retenção de **estritamente as 10 versões mais recentes**.
3. Versões que ultrapassem essa janela temporal são expurgadas automaticamente do storage e do manifesto `index.json`, garantindo consumo previsível e custo mínimo.

### 8.3 Manifesto Estruturado Atômico (`index.json`)

Cada aplicativo mantém seu arquivo `index.json` atualizado pela esteira com o seguinte esquema:

```json
{
  "app": "navalha",
  "name": "Navalha",
  "updated_at": "2026-10-20T06:00:00Z",
  "channels": {
    "stable": {
      "latest_version": "0.5.0",
      "versions": [
        {
          "version": "0.5.0",
          "filename": "navalha-0.5.0-linux-x86_64",
          "url": "https://banca.2lp.in/downloads/navalha/navalha-0.5.0-linux-x86_64",
          "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
          "size_bytes": 14285700,
          "published_at": "2026-10-19T22:00:00Z"
        }
      ]
    },
    "nightly": {
      "latest_version": "0.5.0-dev.216+20261020.ba9aaf0",
      "versions": []
    }
  }
}
```

### 8.4 Script Instalador Universal (`install.sh`)

O script instalador hospedado na Banca DEVE:
1. Ser puramente POSIX compliant (`#!/bin/sh` sem bashismos).
2. Detectar o destino de instalação padrão:
   - Preferencialmente `~/.local/bin/` (sem privilégios de root).
   - Se executado como root ou com flag global: `/usr/local/bin/`.
3. Respeitar a variável de ambiente `CHANNEL` (`stable` por padrão; ou `CHANNEL=nightly`).
4. Verificar integridade via SHA-256 antes de tornar o binário executável (`chmod +x`).
5. Fornecer comando de execução rápida copiado em um clique:
   ```bash
   curl -sSf https://banca.2lp.in/downloads/<app>/install.sh | sh
   ```

### 8.5 Apresentação Visual e Vitrine Web (`site/downloads/`)

A interface web da Banca para o público DEVE:
1. Adotar design brutalista/cyberpunk sem frameworks pesados (Vanilla HTML5, CSS Grid/Flexbox e Vanilla JS).
2. Fornecer um seletor rápido com dropdown contendo todas as aplicações disponíveis.
3. Suportar deep linking direto via URL hash (ex: `https://banca.2lp.in/downloads/#navalha`), selecionando e focando o aplicativo imediatamente.
4. Exibir botões interativos para cópia de comando `curl` com feedback visual imediato.
5. Apresentar tabela comparativa de canais com tamanho, data e SHA-256 auditável.
6. Exibir o rodapé canônico em duas linhas de afirmação identitária transfeminista e soberania.

### 8.6 Veto Absoluto a Binários no Codeberg / Git

1. Nenhuma release no Codeberg conterá binários executáveis ou pacotes tarball nos anexos de release.
2. O repositório Git armazena exclusivamente código-fonte legível, testes e especificações.
3. Todas as compilações de release geradas pelo Forgejo Runner despacham diretamente os binários para a Banca via Cloudflare R2.
