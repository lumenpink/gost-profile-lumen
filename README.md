# gost-profile-lumen

Perfil de Implementação Pessoal Lumen para a norma GOST (estende o perfil Kollontai).

## 📋 Metadados do Perfil

- **ID do Perfil:** `lumen`
- **Herança (`extends`):** [`https://kollontai.2lp.in/profile.md`](https://kollontai.2lp.in)
- **Norma Base:** GOST `1.4.0`
- **URL Canônica:** [`https://gostlumen.2lp.in/profile.md`](https://gostlumen.2lp.in/profile.md)
- **Vitrine Web:** [`https://gostlumen.2lp.in`](https://gostlumen.2lp.in)
- **Licença:** [CC-BY-SA-4.0](./LICENSE)
- **Forja Canônica:** [Codeberg](https://codeberg.org/lumenpink/gost-profile-lumen)

## 🎯 Especializações do Perfil Lumen

1. **Exibição Estrita de Versão:**
   - **Short (v{MAJOR}.{MINOR}.{PATCH}):** Exibida em títulos, tags e badges, truncando antes de metadados de build (`+`).
   - **Long (Conteúdo Integral de `VERSION`):** Exibida obrigatoriamente no rodapé canônico.
2. **Rodapé Canônico Transfeminista em 2 Linhas:**
   - **Linha 1:** `Orgulhosamente produzido por uma travesti latina 🏳️‍⚧️ :)` (termo *travesti* sem tradução).
   - **Linha 2:** `{App} v{LongVersion} • por Lumen Pink • Brasil 🇧🇷 • [{Licença}](LICENSE)`.
3. **Dark Mode Mandatório:** Tokens CSS nativos com suporte de primeira classe a `@media (prefers-color-scheme: dark)`.
4. **Banners & Open Graph (Padrão KokoroSim):**
   - 1200x630 pixels com Safe Zone 4:3 útil central (720-840px de largura).
   - Sangrias laterais de proteção anti-recorte $\ge 180$px contra cortes do WhatsApp.
   - Limites seguros de títulos ($\le 65$ caracteres) e descrições ($\le 155$ caracteres).
   - Simulador visual em [`site/card_preview.html`](https://gostlumen.2lp.in/card_preview.html).

## 🚀 Verificação de Conformidade

```bash
# Validar conformidade estrita GOST
cccp check --strict
```

## 📄 Licença

Distribuído sob a licença [Creative Commons Attribution-ShareAlike 4.0 International (CC-BY-SA-4.0)](./LICENSE).
