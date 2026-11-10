#!/usr/bin/env bash
# ==============================================================================
# NexSpace Official PHP & SAPI APT Repository 1-Click Installer
# https://repophp.nexspace.dev
# ==============================================================================
set -euo pipefail

REPO_URL="https://repophp.nexspace.dev"
KEYRING_DIR="/etc/apt/keyrings"
SOURCES_DIR="/etc/apt/sources.list.d"

if [ "$(id -u)" -ne 0 ]; then
    echo "[ERROR] Vui lòng chạy lệnh với quyền root hoặc sudo: curl -fsSL ${REPO_URL}/setup.sh | sudo bash"
    exit 1
fi

echo "============================================================"
echo "[INFO] Đang thiết lập kho phần mềm chính thức NexSpace..."
echo "============================================================"

# Xác định tên bản phân phối (noble, jammy, bookworm...)
if [ -f /etc/os-release ]; then
    . /etc/os-release
    CODENAME="${VERSION_CODENAME:-noble}"
else
    CODENAME="noble"
fi

mkdir -p "${KEYRING_DIR}" "${SOURCES_DIR}"

# Tải GPG Key nếu có, hoặc tạo cấu hình trusted repo
if curl -s -f "${REPO_URL}/nexspace.gpg" -o "${KEYRING_DIR}/nexspace.gpg" 2>/dev/null; then
    echo "deb [signed-by=${KEYRING_DIR}/nexspace.gpg] ${REPO_URL} ${CODENAME} main" > "${SOURCES_DIR}/nexspace.list"
else
    echo "deb [trusted=yes] ${REPO_URL} ${CODENAME} main" > "${SOURCES_DIR}/nexspace.list"
fi

echo "  [OK] Đã tạo file nguồn: ${SOURCES_DIR}/nexspace.list"
echo "  [OK] Đang cập nhật chỉ mục APT..."
apt-get update -o Dir::Etc::sourcelist="sources.list.d/nexspace.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" -qq

echo "============================================================"
echo "[SUCCESS] Thiết lập kho phần mềm NexSpace hoàn tất."
echo "Bạn có thể cài đặt các runtime:"
echo "   sudo apt install -y nexphp84"
echo "   sudo apt install -y nexphp83"
echo "   sudo apt install -y nexphp82"
echo "============================================================"
