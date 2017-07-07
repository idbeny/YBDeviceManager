//
//  YBDeviceManager.m
//  XuanBao
//
//  Created by Ben on 2017/7/6.
//  Copyright © 2017年 Nanjing Abide Information Technology Co.,Ltd. All rights reserved.
//

#import "YBDeviceManager.h"

@implementation YBDeviceManager
+ (instancetype)defaultManager {
    static YBDeviceManager *defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [[YBDeviceManager alloc] init];
    });
    
    return defaultManager;
}

#pragma mark - ============== 获取设备UUID ==============
- (NSString *)getDeviceUUID {
    CFUUIDRef new_uuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, new_uuid);
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(new_uuid);
    CFRelease(uuidString);
    NSString *UUID  = [[result description] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return UUID;
}

#pragma mark - ============== 创建新的UUID ==============
- (NSString *)createNewUUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

#pragma mark - ============== 获取DeviceToken ==============
- (NSString *)getDeviceToken {
    NSString  *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    return token.length > 0 ? token : nil;
}

//获取当前设备的model
- (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceModel;
}

#pragma mark - ============== 获取当前设备的名称 ==============
- (NSString *)getDeviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceString isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";
    
    if ([deviceString isEqualToString:@"i386"])         return @"i386Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"x86_64Simulator";
    
    return deviceString;
}

#pragma mark - ============== 获取广告标识符 ==============
- (NSString *)getIDFA {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

#pragma mark - ============== 获取设备IP地址 ==============
- (NSString *)getDeviceIPAddress {
    
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    
    NSMutableArray *ips = [NSMutableArray array];
    
    int BUFFERSIZE = 4096;
    
    struct ifconf ifc;
    
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    
    struct ifreq *ifr, ifrcopy;
    
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    
    close(sockfd);
    NSString *deviceIP = @"";
    
    for (int i=0; i < ips.count; i++) {
        if (ips.count > 0) {
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    return deviceIP;
}

#pragma mark - ============== 获取wifi地址 ==============
- (NSString *)getIPAddressForWiFi {
    return [self ipAddressWithIfaName:@"en0"];
}

#pragma mark - ============== 获取移动网络地址 ==============
- (NSString *)getIPAddressForMobileNetwork{
    return [self ipAddressWithIfaName:@"pdp_ip0"];
}

- (NSString *)ipAddressWithIfaName:(NSString *)name {
    if (name.length == 0) return nil;
    NSString *address = nil;
    struct ifaddrs *addrs = NULL;
    if (getifaddrs(&addrs) == 0) {
        struct ifaddrs *addr = addrs;
        while (addr) {
            if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:name]) {
                sa_family_t family = addr->ifa_addr->sa_family;
                switch (family) {
                    case AF_INET: { // IPv4
                        char str[INET_ADDRSTRLEN] = {0};
                        inet_ntop(family, &(((struct sockaddr_in *)addr->ifa_addr)->sin_addr), str, sizeof(str));
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    } break;
                        
                    case AF_INET6: { // IPv6
                        char str[INET6_ADDRSTRLEN] = {0};
                        inet_ntop(family, &(((struct sockaddr_in6 *)addr->ifa_addr)->sin6_addr), str, sizeof(str));
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        
                    default: break;
                }
                if (address) break;
            }
            addr = addr->ifa_next;
        }
    }
    freeifaddrs(addrs);
    return address ? address : @"该设备不存在该ip地址";
}

#pragma mark - ============== 获取MAC地址(为了保护用户隐私，每次都不一样) ==============
- (NSString *)getMACAddress {
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [outstring uppercaseString];
}

#pragma mark - ============== 系统版本 ==============
- (NSString *)systemVersion {
    UIDevice *device=[UIDevice currentDevice];
    return device.systemVersion;
}

#pragma mark - ============== APP version ==============
- (NSString *)appVersion {
    NSString *majorVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return majorVersion;
}

//电池量
- (float)batteryLevel{
    return [[UIDevice currentDevice] batteryLevel];
}

//获取区域标志符（非语言标志）
- (NSString *)localeIdentifier {
    NSLocale *frLocale = [NSLocale autoupdatingCurrentLocale];
    return frLocale.localeIdentifier;
}

#pragma mark - ============== 系统上次启动时间 ==============
- (NSDate *)getSystemUptime {
    NSTimeInterval time = [[NSProcessInfo processInfo] systemUptime];
    return [[NSDate alloc] initWithTimeIntervalSinceNow:(0 - time)];
}

#pragma mark - ============== 判断设备是否为iPad ==============
- (BOOL)isiPad{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

#pragma mark - ============== 判断是否为视网膜屏幕 ==============
- (BOOL)isRetina{
    return ([UIScreen mainScreen].scale > 1.0);
}

#pragma mark - ============== 判断系统版本 ==============
- (BOOL)iOS7AndLater{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0;
}

- (BOOL)iOS8AndLater{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0;
}

- (BOOL)iOS9AndLater{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0;
}

- (BOOL)iOS10AndLater{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0;
}

- (BOOL)iOS11AndLater{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0;
}

#pragma mark - ============== 判断相机是否可用 ==============
//判断相机是否可用(前置)
- (BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceFront];
}

//判断相机是否可用(后置)
- (BOOL)isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceRear];
}

#pragma mark - ============== CPU ==============
//CPU总数
- (NSUInteger)getCPUCount {
    return [NSProcessInfo processInfo].activeProcessorCount;
}

//CPU使用的总比例
- (float)getCPUUsage {
    float cpu = 0;
    NSArray *cpus = [self getPerCPUUsage];
    if (cpus.count == 0) return -1;
    for (NSNumber *n in cpus) {
        cpu += n.floatValue;
    }
    return cpu;
}

//每个CPU使用比例
- (NSArray *)getPerCPUUsage {
    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
    unsigned _numCPUs;
    NSLock *_cpuUsageLock;
    
    int _mib[2U] = { CTL_HW, HW_NCPU };
    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
    if (_status)
        _numCPUs = 1;
    
    _cpuUsageLock = [[NSLock alloc] init];
    
    natural_t _numCPUsU = 0U;
    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
    if (err == KERN_SUCCESS) {
        [_cpuUsageLock lock];
        
        NSMutableArray *cpus = [NSMutableArray new];
        for (unsigned i = 0U; i < _numCPUs; ++i) {
            Float32 _inUse, _total;
            if (_prevCPUInfo) {
                _inUse = (
                          (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
                          );
                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
            } else {
                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
            }
            [cpus addObject:@(_inUse / _total)];
        }
        
        [_cpuUsageLock unlock];
        if (_prevCPUInfo) {
            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
        }
        return cpus;
    } else {
        return nil;
    }
}

#pragma mark - ============== Disk ==============
//总磁盘空间
- (int64_t)getTotalDiskSpace {
    return [self ios_getSpaceForKey:NSFileSystemSize];
}

- (uint64_t)c_totalDiskSpace {
    NSString *str = @"~/Documents";
    
    uint64_t size = 0;
    struct statfs diskInfo;
    
    if(statfs([[str stringByExpandingTildeInPath] fileSystemRepresentation], &diskInfo) == 0) {
        //每个block里包含的字节数
        uint64_t blocksize = diskInfo.f_bsize;
        
        //总的字节数，f_blocks为block的数目
        uint64_t totalsize = blocksize * diskInfo.f_blocks;
        size = totalsize;
    }
    
    return size;
}

//剩余磁盘空间
- (int64_t)getFreeDiskSpace {
    return [self ios_getSpaceForKey:NSFileSystemFreeSize];
}

- (uint64_t)c_freeDiskSpace {
    NSString *str = @"~/Documents";
    
    uint64_t size = 0;
    struct statfs diskInfo;
    
    if(statfs([[str stringByExpandingTildeInPath] fileSystemRepresentation], &diskInfo) == 0) {
        //每个block里包含的字节数
        uint64_t blocksize = diskInfo.f_bsize;
        
        //可用空间大小
        uint64_t availableDisk = diskInfo.f_bavail * blocksize;
        
        size = availableDisk;
    }
    
    return size;
}

//已用磁盘空间
- (int64_t)getUsedDiskSpace {
    int64_t totalDisk = [self getTotalDiskSpace];
    int64_t freeDisk = [self getFreeDiskSpace];
    if (totalDisk < 0 || freeDisk < 0) return -1;
    int64_t usedDisk = totalDisk - freeDisk;
    if (usedDisk < 0) usedDisk = -1;
    return usedDisk;
}

- (int64_t)ios_getSpaceForKey:(id)key {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    int64_t space =  [[attrs objectForKey:key] longLongValue];
    if (space < 0) space = -1;
    return space;
}

//磁盘号
- (NSNumber *)diskNumber {
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    
    return [fattributes objectForKey:NSFileSystemNumber];
}

//目录下所有文件大小
- (int64_t)sizeOfDirectory:(NSString *)dir {
    NSDirectoryEnumerator *direnum = [[NSFileManager defaultManager] enumeratorAtPath:dir];
    
    NSString *pname;
    int64_t s = 0;
    while (pname = [direnum nextObject]){
        NSDictionary *currentdict=[direnum fileAttributes];
        NSString *filesize=[NSString stringWithFormat:@"%@",[currentdict objectForKey:NSFileSize]];
        NSString *filetype=[currentdict objectForKey:NSFileType];
        
        if([filetype isEqualToString:NSFileTypeDirectory]) continue;
        s += [filesize longLongValue];
    }
    
    return s;
}

//将大小转化为格式,B,L,M,G之间的转换
- (NSString *)convertFloatSizeToString:(float)size {
    if(size < 1024L) {
        return [NSString stringWithFormat:@"%fB", size];
    }else if(size < 1024L * 1024L) {
        return [NSString stringWithFormat:@"%1.2fK", (float)size / 1024.0];
    }else if(size < 1024L * 1024L * 1024L) {
        return [NSString stringWithFormat:@"%1.2fM", (float)size / 1024.0 / 1024.0];
    }else{
        return [NSString stringWithFormat:@"%1.2fG", (float)size / 1024.0 / 1024.0 / 1024.0];
    }
}

#pragma mark - ============== Memory ==============
//总内存
- (int64_t)getTotalMemory {
    int64_t totalMemory = [[NSProcessInfo processInfo] physicalMemory];
    if (totalMemory < -1) totalMemory = -1;
    return totalMemory;
}

- (float)c_totalMemory {
    return [self sysInfo:HW_PHYSMEM];
    //or
    //return NSRealMemoryAvailable();
}

//活跃内存
- (int64_t)getActiveMemory {
    
    return [self ios_getMemoryWithType:MemoryTypeActive];
}

- (float)c_activeMemory {
    return [self c_memoryWithType:MemoryTypeActive];
}

//不活跃内存
- (int64_t)getInactiveMemory {
    
    return [self ios_getMemoryWithType:MemoryTypeInactive];
}

- (float)c_inactiveMemory {
    return [self c_memoryWithType:MemoryTypeInactive];
}

//剩余内存
- (int64_t)getFreeMemory {
    return [self ios_getMemoryWithType:MemoryTypeFree];
}

- (float)c_freeMemory {
    return [self c_memoryWithType:MemoryTypeFree];
}

//用户可使用内存
- (float)c_userMemory {
    return [self sysInfo:HW_USERMEM];
}

//已用内存
- (int64_t)getUsedMemory {
    return [self ios_getMemoryWithType:MemoryTypeUsed];
}

- (float)c_usedMemory {
    return [self c_memoryWithType:MemoryTypeUsed];
}

//存放内核和数据结构的内存
- (int64_t)getWiredMemory {
    return [self ios_getMemoryWithType:MemoryTypeWired];
}

- (float)c_wireMemory {
    return [self c_memoryWithType:MemoryTypeWired];
}

//可释放的内存
- (int64_t)getPurgeableMemory {
    
    return [self ios_getMemoryWithType:MemoryTypePurgeable];
}

- (float)c_purgeableMemory {
    return [self c_memoryWithType:MemoryTypePurgeable];
}

- (int64_t)ios_getMemoryWithType:(MemoryType)type{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    
    int64_t count = 0;
    switch (type) {
        case MemoryTypeFree:
            count = vm_stat.free_count;
            break;
            
        case MemoryTypePurgeable:
            count = vm_stat.purgeable_count;
            break;
            
        case MemoryTypeActive:
            count = vm_stat.active_count;
            break;
            
        case MemoryTypeInactive:
            count = vm_stat.inactive_count;
            break;
            
        case MemoryTypeWired:
            count = vm_stat.wire_count;
            break;
            
        case MemoryTypeUsed:
            count = vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count;
            break;
            
        default:
            break;
    }
    
    return count * page_size;
}

- (float)c_memoryWithType:(MemoryType)type{
    vm_statistics_data_t vm_stat;
    
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vm_stat, &infoCount);
    
    if(kernReturn == KERN_SUCCESS){
        int64_t count = 0;
        switch (type) {
            case MemoryTypeFree:
                count = vm_stat.free_count;
                break;
                
            case MemoryTypePurgeable:
                count = vm_stat.purgeable_count;
                break;
                
            case MemoryTypeActive:
                count = vm_stat.active_count;
                break;
                
            case MemoryTypeInactive:
                count = vm_stat.inactive_count;
                break;
                
            case MemoryTypeWired:
                count = vm_stat.wire_count;
                break;
                
            case MemoryTypeUsed:
                count = vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count;
                break;
                
            default:
                break;
        }
        return count * vm_page_size * 1.0;
    }
    
    return -1;
}

//CPU使用频率
- (float)cpuFrequency{
    return [self sysInfo:HW_CPU_FREQ];
}

//CPU总线频率
- (float)busFrequency{
    return [self sysInfo:HW_BUS_FREQ];
}

//最大Socket缓存区大小
- (float)maxSocketBufferSize{
    return [self sysInfo:KIPC_MAXSOCKBUF];
}

- (float)sysInfo:(uint)typeSpecifier{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    
    return (NSUInteger) results * 1.0;
}

@end
