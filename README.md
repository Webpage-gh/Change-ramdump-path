该仓库已存档，因为我认为不再需要维护了。如果有issue、pr、取消存档的请求，[请到issue仓库](https://github.com/Webpage-gh/issues/issues/new)

# Change-ramdump-path
通过设置persist.sys.ssr.data为true使MIUI质量服务不在内部存储写入ramdump文件夹

# 安装
请从[发布](https://github.com/Webpage-gh/Change-ramdump-path/releases/latest)中下载最新版本，然后使用Magisk，KernelSU 或 Apatch中安装这个模块。这个模块目前只在Apatch上测试过。

# 归档
此存储没有必要进行更新，因此进行归档。

# 模块从何而来
很久之前，我在MIUI14的部分设备上发现每次开机时，总有程序在创建这个空文件夹。通过 [Cleaner](https://github.com/MaterialCleaner/MaterialCleaner) 追踪发现，这是一个由 UID 为 1000 的应用创建的。今天，我提取了这些应用的安装包，并逐个搜索文件内容包含`ramdump`字符串的安装包：
- com.miui.qr.InfoApplication(com.miui.qr)
- com.modemdebug
- MIUI质量服务(com.miui.daemon)
- 鲁班(MTB)V6.0.6(com.xiaomi.mtb)

在`/system_ext/app/MiuiDaemon/MiuiDeamon`（内部版本号30）->`classex.dex`->`com/miui/daemon/mqsas/event/KernelExceptionObserver`中第`383`行，硬编码了`/sdcard/ramdump/`。
于是使用AI及ApkToolM进行反编译转成Java，大致弄清楚了这一部分的原理，写出了这个模块。
