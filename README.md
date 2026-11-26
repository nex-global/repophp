# NexPHP Official Modular PGO Native Runtimes Repository
> Official High-Performance PHP Runtimes with NexSAPI, PGO & NexRealm Isolation  
> Host: `https://repophp.nexspace.dev` | GPG Key: [`nexspace.gpg`](https://repophp.nexspace.dev/nexspace.gpg) (`packages@nexspace.dev`)

## 1-Click Setup (Ubuntu / Debian / AlmaLinux 9 / Rocky Linux 9)

```bash
curl -fsSL https://repophp.nexspace.dev/setup.sh | sudo bash
```

## Available PHP Versions (`amd64` / `x86_64`)

| Package | PHP Version | Packaging Mode | Architecture |
| :--- | :---: | :---: | :---: |
| `nexphp84` | `8.4.28` | Modular PGO Core + `.so` Extensions (`-all`) | `amd64` / `x86_64` |
| `nexphp83` | `8.3.37` | Modular PGO Core + `.so` Extensions (`-all`) | `amd64` / `x86_64` |
| `nexphp82` | `8.2.36` | Modular PGO Core + `.so` Extensions (`-all`) | `amd64` / `x86_64` |
| `nexphp81` | `8.1.34` | Modular PGO Core + `.so` Extensions (`-all`) | `amd64` / `x86_64` |
| `nexphp80` | `8.0.30` | LTS OpenSSL-3 Native Bridge | `amd64` / `x86_64` |
| `nexphp74` | `7.4.33` | LTS OpenSSL-3 Native Bridge | `amd64` / `x86_64` |

## Modular Installation Modes (PHP 8.1 – 8.4)

- **Minimal Core (17 core modules + OPcache JIT — lowest RAM & highest RPS):**
  ```bash
  sudo apt install -y nexphp83          # Ubuntu / Debian
  sudo dnf install -y nexphp83          # AlmaLinux 9 / Rocky 9
  ```
- **Selective Shared Extensions (install only what your app needs):**
  ```bash
  sudo apt install -y nexphp83-mysql nexphp83-mbstring nexphp83-curl nexphp83-gd nexphp83-xml nexphp83-zip nexphp83-intl nexphp83-common
  ```
- **Full Stack Meta-Package (WordPress / Shared Hosting 1-command install):**
  ```bash
  sudo apt install -y nexphp83-all      # Ubuntu / Debian
  sudo dnf install -y nexphp83-all      # AlmaLinux 9 / Rocky 9
  ```
- **Multi-Version Shared Hosting (side-by-side isolation, zero file conflicts):**
  ```bash
  sudo apt install -y nexphp84-all nexphp83-all nexphp82-all nexphp81-all nexphp80 nexphp74
  ```

---
NexSpace Engineering Team. All rights reserved.
