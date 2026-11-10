# NexPHP Official Native Runtimes APT Repository
> Official High-Performance PHP Runtimes with NexSAPI & NexRealm Integration  
> Host: `https://repophp.nexspace.dev`

## Quick Setup (Ubuntu / Debian)

```bash
curl -fsSL https://repophp.nexspace.dev/setup.sh | sudo bash
```

## Available PHP Versions

| Package | PHP Version | SAPI Integration | Architecture |
| :--- | :---: | :---: | :---: |
| `nexphp84` | 8.4.27 | NexSAPI Native + FastCGI | amd64, arm64 |
| `nexphp83` | 8.3.6  | NexSAPI Native + FastCGI | amd64, arm64 |
| `nexphp82` | 8.2.35 | NexSAPI Native + FastCGI | amd64, arm64 |
| `nexphp81` | 8.1.34 | NexSAPI Native + FastCGI | amd64, arm64 |
| `nexphp80` | 8.0.30 | NexSAPI Native + FastCGI | amd64, arm64 |
| `nexphp74` | 7.4.33 | NexSAPI Native + FastCGI | amd64, arm64 |

## Install Specific Versions

```bash
# Install PHP 8.4
sudo apt install -y nexphp84

# Install all versions concurrently
sudo apt install -y nexphp84 nexphp83 nexphp82 nexphp81 nexphp80 nexphp74
```

---
NexSpace Engineering Team. All rights reserved.
