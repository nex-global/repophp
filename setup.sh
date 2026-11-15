#!/usr/bin/env bash
# ==============================================================================
# NexSpace Official PHP & SAPI Universal Repository 1-Click Installer
# Supports: Ubuntu, Debian, AlmaLinux 9, Rocky Linux 9, RHEL 9
# https://repophp.nexspace.dev
# ==============================================================================
set -euo pipefail

REPO_URL="https://repophp.nexspace.dev"

if [ "$(id -u)" -ne 0 ]; then
    echo "[ERROR] Please run this command as root or with sudo: curl -fsSL ${REPO_URL}/setup.sh | sudo bash"
    exit 1
fi

echo "============================================================"
echo "[INFO] Setting up official NexSpace repository..."
echo "============================================================"

OS_ID="unknown"
OS_LIKE=""
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_ID="${ID:-}"
    OS_LIKE="${ID_LIKE:-}"
fi

# 1. Enterprise Linux branch: AlmaLinux, Rocky Linux, RHEL, CentOS
if [[ "${OS_ID}" =~ ^(almalinux|rocky|rhel|centos|fedora)$ ]] || [[ "${OS_LIKE}" =~ (rhel|fedora|centos) ]]; then
    echo "[INFO] Detected Enterprise Linux OS: ${PRETTY_NAME:-$OS_ID}"
    echo "[INFO] Configuring DNF/YUM repository (/etc/yum.repos.d/nexspace.repo)..."

    cat << REPO_EOF > /etc/yum.repos.d/nexspace.repo
[nexspace-runtimes]
name=NexSpace Official PHP & SAPI Repository - Enterprise Linux 9 (\$basearch)
baseurl=${REPO_URL}/rpm/el9/\$basearch
enabled=1
gpgcheck=0
repo_gpgcheck=0
metadata_expire=300
REPO_EOF

    echo "  [OK] Created repository file: /etc/yum.repos.d/nexspace.repo"
    echo "  [OK] Updating DNF/YUM metadata cache..."
    if command -v dnf >/dev/null 2>&1; then
        dnf makecache --disablerepo="*" --enablerepo="nexspace-runtimes" -q 2>/dev/null || dnf clean all -q && dnf makecache -q
    elif command -v yum >/dev/null 2>&1; then
        yum makecache -q 2>/dev/null || true
    fi

    echo "============================================================"
    echo "[SUCCESS] NexSpace repository setup complete!"
    echo "You can now install runtimes:"
    echo "   sudo dnf install -y nexphp84"
    echo "   sudo dnf install -y nexphp83"
    echo "   sudo dnf install -y nexphp82"
    echo "============================================================"

# 2. Debian / Ubuntu branch: Ubuntu, Debian (APT)
else
    KEYRING_DIR="/etc/apt/keyrings"
    SOURCES_DIR="/etc/apt/sources.list.d"
    CODENAME="${VERSION_CODENAME:-noble}"

    echo "[INFO] Detected Debian/Ubuntu OS: ${PRETTY_NAME:-$CODENAME}"
    echo "[INFO] Configuring APT repository (${SOURCES_DIR}/nexspace.list)..."

    mkdir -p "${KEYRING_DIR}" "${SOURCES_DIR}"

    if curl -s -f "${REPO_URL}/nexspace.gpg" -o "${KEYRING_DIR}/nexspace.gpg" 2>/dev/null; then
        echo "deb [signed-by=${KEYRING_DIR}/nexspace.gpg] ${REPO_URL} ${CODENAME} main" > "${SOURCES_DIR}/nexspace.list"
    else
        echo "deb [trusted=yes] ${REPO_URL} ${CODENAME} main" > "${SOURCES_DIR}/nexspace.list"
    fi

    echo "  [OK] Created source file: ${SOURCES_DIR}/nexspace.list"
    echo "  [OK] Updating APT package index..."
    apt-get update -o Dir::Etc::sourcelist="sources.list.d/nexspace.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" -qq

    echo "============================================================"
    echo "[SUCCESS] NexSpace repository setup complete!"
    echo "You can now install runtimes:"
    echo "   sudo apt install -y nexphp84"
    echo "   sudo apt install -y nexphp83"
    echo "   sudo apt install -y nexphp82"
    echo "============================================================"
fi
