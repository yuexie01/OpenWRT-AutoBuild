#!/bin/bash

# 定义输出文件名
OUTPUT_FILE="$GITHUB_WORKSPACE/owrt/release_notes.txt"

# 清空输出文件
> "$OUTPUT_FILE"

TARGETS_PATH="$GITHUB_WORKSPACE/owrt/upload/"

# 查找 profiles.json 文件
PROFILES_JSON=$(find "$TARGETS_PATH" -name "profiles.json")

# 读取环境变量
SOURCE="${OWRT_URL}"
IP="${OWRT_IP}"
PASSWORD="${OWRT_PW}"

# 从 JSON 文件中读取数据
VERSION_NUMBER=$(jq -r '.version_number' "$PROFILES_JSON")
VERSION_CODE=$(jq -r '.version_code' "$PROFILES_JSON")
TARGET=$(jq -r '.target' "$PROFILES_JSON")
DEVICE_VENDOR_MODEL=$(jq -r '.profiles | to_entries[] | .value.titles[] | .vendor + " " + .model' "$PROFILES_JSON")
DEFAULT_PACKAGES=$(jq -r '.default_packages | join(", ")' "$PROFILES_JSON")
IMAGES=($(jq -r '.profiles | to_entries[] | .value.images[] | .name + ": └── sha256: " + .sha256' "$PROFILES_JSON"))

# 输出 release 说明
echo "Release 说明:"
echo "源码: $SOURCE"
echo "版本号: $VERSION_NUMBER"
echo "版本代码: $VERSION_CODE"
echo "目标平台: $TARGET"
echo "目标设备: $DEVICE_VENDOR_MODEL"
echo "登录地址: $IP"
echo "登录密码: $PASSWORD"
echo "默认包: $DEFAULT_PACKAGES"
echo "校验码:"

for image in "${IMAGES[@]}"; do
    echo "  - $image"
done

# 保存 release 说明到文件
echo -e "源码: $SOURCE\n版本号: $VERSION_NUMBER\n版本代码: $VERSION_CODE\n目标平台: $TARGET\n目标设备: $DEVICE_VENDOR_MODEL\n登录地址: $IP\n登录密码: $PASSWORD\n默认包: $DEFAULT_PACKAGES\n校验码:" > "$OUTPUT_FILE"

for image in "${IMAGES[@]}"; do
    echo "  - $image" >> "$OUTPUT_FILE"
done

# 输出文件路径
echo "Release 说明已保存至: $OUTPUT_FILE"
