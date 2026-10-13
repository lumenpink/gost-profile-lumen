# Perfil de Implementação GOST: Lumen

```yaml
---
id: lumen
name: "Perfil de Implementação Lumen"
extends: "https://kollontai.2lp.in/profile.md"
target_gost: "1.4.0"
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

