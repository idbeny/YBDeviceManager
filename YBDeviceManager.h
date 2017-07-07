//
//  YBDeviceManager.h
//  XuanBao
//
//  Created by Ben on 2017/7/6.
//  Copyright © 2017年 Nanjing Abide Information Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//mac
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>

//IP
#include <ifaddrs.h>

#include <sys/stat.h>
#include <sys/mount.h>
#import <sys/utsname.h>
#import <Security/Security.h>

//CPU
#include <mach/mach.h>

//广告
#import <AdSupport/AdSupport.h>

typedef enum : NSUInteger {
    MemoryTypeTotal = 0,//总的
    MemoryTypeFree,     //剩余
    MemoryTypeUsed,     //已用
    MemoryTypeActive,   //活跃
    MemoryTypeInactive, //不活跃
    MemoryTypeWired,    //存放内核和数据结构
    MemoryTypePurgeable  //可释放的
} MemoryType;

static inline BOOL iOS7AndLater(){
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0;
}

static inline BOOL iOS8AndLater(){
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0;
}

static inline BOOL iOS9AndLater(){
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0;
}

static inline BOOL iOS10AndLater(){
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0;
}

static inline BOOL iOS11AndLater(){
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0;
}

@interface YBDeviceManager : NSObject

+ (instancetype)defaultManager;

/**
 获取UUID

 @return UUID
 */
- (NSString *)getDeviceUUID;

/**
 创建UUID

 @return UUID
 */
- (NSString *)createNewUUID;

/**
 获取DeviceToken

 @return DeviceToken
 */
- (NSString *)getDeviceToken;

/**
 获取当前设备Model
 
 @return iPhone/iPad/iPod touch/...
 */
- (NSString *)deviceModel;

/**
 获取当前设备名称
 
 @return iPhone 6 Plus/iPhone SE/iPad Mini/...
 */
- (NSString *)getDeviceName;

/**
 获取广告标识符
 
 @return IDFA
 */
- (NSString *)getIDFA;

/**
 获取设备IP地址
 
 @return deviceIP
 */
- (NSString *)getDeviceIPAddress;

/**
 获取WiFi地址
 
 @return WiFiIP
 */
- (NSString *)getIPAddressForWiFi;

/**
 获取移动网络IP
 
 @return mobileNetworkIP
 */
- (NSString *)getIPAddressForMobileNetwork;

/**
 获取MAC地址
 
 @return MAC
 */
- (NSString *)getMACAddress;

/**
 系统版本
 
 @return e.g 7.0/8.3/..
 */
- (NSString *)systemVersion;

/**
 当前APP版本
 
 @return e.g 3.0.0/3.0.1/...
 */
- (NSString *)appVersion;

/**
 获取区域标志符（非语言标志）
 
 @return e.g en_GB...
 */
- (NSString *)localeIdentifier;

/**
 判断设备是否为iPad

 @return NO:iPhone/TV/CarPlay YES:iPad
 */
- (BOOL)isiPad;

/**
 是否为视网膜屏幕

 @return YES/NO
 */
- (BOOL)isRetina;

/**
 判断系统版本

 @return YES/NO
 */
- (BOOL)iOS7AndLater;

- (BOOL)iOS8AndLater;

- (BOOL)iOS9AndLater;

- (BOOL)iOS10AndLater;

- (BOOL)iOS11AndLater;

/**
 判断相机是否可用(前置)
 
 @return YES/NO
 */
- (BOOL)isFrontCameraAvailable;

/**
 判断相机是否可用(后置)
 
 @return YES/NO
 */
- (BOOL)isRearCameraAvailable;

/**
 电量
 
 @return battery
 */
- (float)batteryLevel;

/**
 系统上次启动时间
 
 @return NSDate*
 */
- (NSDate *)getSystemUptime;

/**
 获取CPU总数

 @return CPU数量
 */
- (NSUInteger)getCPUCount;

/**
 CPU使用总比例

 @return CPU usage
 */
- (float)getCPUUsage;

/**
 每个CPU使用比例

 @return CPU usage
 */
- (NSArray *)getPerCPUUsage;

/**
 获取总磁盘空间

 @return total disk space
 */
- (int64_t)getTotalDiskSpace;

- (uint64_t)c_totalDiskSpace;

/**
 获取剩余磁盘空间

 @return free disk space
 */
- (int64_t)getFreeDiskSpace;

- (uint64_t)c_freeDiskSpace;

/**
 获取已使用磁盘空间

 @return used disk space
 */
- (int64_t)getUsedDiskSpace;

/**
 获取磁盘设备号

 @return NSNumber*
 */
- (NSNumber *)diskNumber;

/**
 获取指定目录大小

 @param dir 文件地址
 @return 文件夹大小
 */
- (int64_t)sizeOfDirectory:(NSString *)dir;

/**
 大小转换

 @param size bit
 @return 转换结果
 */
- (NSString *)convertFloatSizeToString:(float)size;

/**
 获取系统总内存空间

 @return total memory
 */
- (int64_t)getTotalMemory;

- (float)c_totalMemory;

/**
 获取系统活跃内存空间
 
 @return active memory
 */
- (int64_t)getActiveMemory;

- (float)c_activeMemory;

/**
 获取系统不活跃内存空间
 
 @return inactive memory
 */
- (int64_t)getInactiveMemory;

- (float)c_inactiveMemory;

/**
 获取系统空闲的内存空间

 @return free memory
 */
- (int64_t)getFreeMemory;

- (float)c_freeMemory;

/**
 用户可使用内存

 @return free memory
 */
- (float)c_userMemory;

/**
 获取系统已使用的内存空间
 
 @return used memory
 */
- (int64_t)getUsedMemory;

- (float)c_usedMemory;

/**
 获取用来存放内核和数据结构的内存
 
 @return wired memory
 */
- (int64_t)getWiredMemory;

- (float)c_wireMemory;

/**
 可释放的内存空间：内存吃紧自动释放

 @return purgeable memory
 */
- (int64_t)getPurgeableMemory;

- (float)c_purgeableMemory;

/**
 CPU使用频率

 @return frequency
 */
- (float)cpuFrequency;

/**
 CPU总线频率

 @return frequency
 */
- (float)busFrequency;

/**
 最大Socket缓存区大小

 @return size
 */
- (float)maxSocketBufferSize;

@end
