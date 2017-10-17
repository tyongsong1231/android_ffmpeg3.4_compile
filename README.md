# android_ffmpeg3.4_compile
模拟器测试发现，x86平台时：<br>
1.仅有$NDK/platforms/android-18/arch-arm/  x86    运行在5.0以上系统是出现 has text relocations异常
2.仅有$NDK/platforms/android-14/arch-arm   x86_64 运行在4.4时出现is too small to be an ELF executable异常
当x86和x86_64都存在是正常。
armeabi没试过在5.0上运行正常，其他的没试过
正常：ffmpeg可以正常视频播放
