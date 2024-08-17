#!/bin/bash

# 定义输出文件名
OUTPUT_FILE=$GITHUB_WORKSPACE/owrt/release_notes.txt

# 清空输出文件
> $OUTPUT_FILE

TARGETS_PAHT=$GITHUB_WORKSPACE/owrt/upload/

# 查找 profiles.json 文件
PROFILES_JSON=$(find $TARGETS_PAHT -name "profiles.json")

# 读取环境变量
SOURCE="${OWRT_URL}"
DEVICE_VENDOR_MODEL=$(jq -r '.profiles | to_entries[] | .value.titles[] | .vendor + " " + .model' $PROFILES_JSON)
PASSWORD="${OWRT_PW}"
IP="${OWRT_IP}"
DEFAULT_PACKAGES=$(jq -r '.default_packages | join(", ")' $PROFILES_JSON)
IMAGES=($(jq -r '.profiles | to_entries[] | .images[] | .filename + ": " + .sha256sum' $PROFILES_JSON))

# 输出 release 说明
echo "Release 说明:"
echo "源码: $SOURCE"
echo "设备: $DEVICE_VENDOR_MODEL"
echo "密码: $PASSWORD"
echo "地址: $IP"
echo "默认包: $DEFAULT_PACKAGES"
echo "校验码:"

for image in "${IMAGES[@]}"; do
    echo "  - $image"
done

# 保存 release 说明到文件
echo -e "源码: $SOURCE\n设备: $DEVICE_VENDOR_MODEL\n密码: $PASSWORD\n地址: $IP\n默认包: $DEFAULT_PACKAGES\n校验码:" > $OUTPUT_FILE
for image in "${IMAGES[@]}"; do
    echo "  - $image" >> $OUTPUT_FILE
done

# 输出文件路径
echo "Release 说明已保存至: $OUTPUT_FILE"
