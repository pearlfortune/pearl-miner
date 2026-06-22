#!/bin/sh
# 根据宿主 GPU 驱动支持的 CUDA 版本选择 miner 二进制（运行时检测）。
# 选择逻辑与 HiveOS h-run.sh 保持一致：
#   驱动支持 CUDA13 -> 优先 miner-cuda13；否则 miner-cuda12；按存在性回退。
# 可用 MINER_VARIANT=cuda12|cuda13 手动强制覆盖（便于排查）。

log() { echo "[entrypoint] $*"; }

# ---- 1. 探测驱动支持的最高 CUDA 主版本 ----
# nvidia-smi 头部同一行里既有 Driver Version 又有 CUDA Version，
# 必须锚定 "CUDA Version" 关键字之后再取版本，否则会把驱动版本误当 CUDA 版本。
CUDA_MAJOR=0
if command -v nvidia-smi >/dev/null 2>&1; then
    CUDA_VER=$(nvidia-smi 2>/dev/null \
        | sed -nE 's/.*CUDA Version:?[[:space:]]*([0-9]+\.[0-9]+).*/\1/p' \
        | head -n1)
    case "$CUDA_VER" in
        ''|*[!0-9.]*) CUDA_VER="" ;;
        *) CUDA_MAJOR="${CUDA_VER%%.*}" ;;
    esac
    log "detected CUDA version: ${CUDA_VER:-unknown} (major=${CUDA_MAJOR})"
else
    log "WARN: nvidia-smi not found; falling back to an available miner"
fi

# ---- 2. 选择二进制（>=13 用 cuda13；其余用 cuda12；选中不存在则按存在性回退）----
pick_miner() {
    if [ "$CUDA_MAJOR" -ge 13 ] && [ -x /app/miner-cuda13 ]; then echo /app/miner-cuda13; return 0; fi
    if [ "$CUDA_MAJOR" -ge 11 ] && [ -x /app/miner-cuda12 ]; then echo /app/miner-cuda12; return 0; fi
    for cand in /app/miner-cuda12 /app/miner-cuda13; do
        [ -x "$cand" ] && { echo "$cand"; return 0; }
    done
    return 1
}

case "$MINER_VARIANT" in
    cuda12) MINER=/app/miner-cuda12 ;;
    cuda13) MINER=/app/miner-cuda13 ;;
    *)      MINER=$(pick_miner) || { log "ERROR: no usable miner binary in /app"; exit 1; } ;;
esac

# ---- 3. 启动（保持原 ENTRYPOINT 的 "\$@" 透传与退出码打印行为）----
log "starting ${MINER}"
"$MINER" "$@"
code=$?
log "miner exited code=$code"
exit $code
