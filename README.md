# Actions-OpenWrt

## 使用 GitHub Actions 在线编译基于 OpenWrt 的路由器固件。

### workflows 目录

#### `OWRT-CORE.yml`
- 在线编译基于 OpenWrt 的路由器固件所使用的公用核心。

#### `CMCC-RAX3000M-NAND-LEDE.yml`
- 用于编译适用于中国移动 RAX3000M NAND 版本的路由器固件。
- 源码为 [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)。

#### `CMCC-RAX3000M-NAND-IMMORTALWRT-MT798X.yml`
- 用于编译适用于中国移动 RAX3000M NAND 版本的路由器固件。
- 源码为 [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x)。

### Config 目录

#### `General.txt`
- 在源码平台对应的默认配置外自行修改的插件，用于配置常用插件。
- 如需使用，需要在 [OWRT-CORE.yml](.github/workflows/OWRT-CORE.yml) 中修改 `执行自定义设置 (Custom Settings)` 模块，为 `.config `文件启用合并并关闭复制。

#### `RAX3000M-NAND-LEDE.txt`
- [CMCC-RAX3000M-NAND-LEDE.yml](.github/workflows/CMCC-RAX3000M-NAND-LEDE.yml) 默认使用的配置，初始为 [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede) 源码中 CMCC-RAX3000M NAND 版本的默认配置，即 [RAX3000M-NAND-LEDE-DEFAULT.txt](Config/RAX3000M-NAND-LEDE-DEFAULT.txt)。

#### `RAX3000M-NAND-LEDE-DEFAULT.txt`
- [CMCC-RAX3000M-NAND-LEDE.yml] 为 [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede) 源码中 CMCC-RAX3000M NAND 版本的默认配置。

#### `RAX3000M-NAND-IMMORTALWRT-MT798X.txt` 
- [CMCC-RAX3000M-NAND-IMMORTALWRT-MT798X.yml](.github/workflows/CMCC-RAX3000M-NAND-IMMORTALWRT-MT798X.yml) 默认使用的配置，初始为 [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x) 源码中 CMCC-RAX3000M NAND 版本的默认配置，即 [RAX3000M-NAND-IMMORTALWRT-MT798X-DEFAULT.txt](Config/RAX3000M-NAND-IMMORTALWRT-MT798X-DEFAULT.txt)。

#### `RAX3000M-NAND-IMMORTALWRT-MT798X-DEFAULT.txt` 
- [CMCC-RAX3000M-NAND-IMMORTALWRT-MT798X.yml](.github/workflows/CMCC-RAX3000M-NAND-IMMORTALWRT-MT798X.yml) 为 [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x) 源码中 CMCC-RAX3000M NAND 版本的默认配置。

## 感谢

- [lede 源码仓库](https://github.com/coolsnowwolf/lede)
- [immortalwrt-mt798x 源码仓库](https://github.com/hanwckf/immortalwrt-mt798x)
- [OpenWrt_R7800_Stable 云编译仓库](https://github.com/yaya131/OpenWrt_R7800_Stable)

---
