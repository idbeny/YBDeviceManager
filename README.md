# YBDeviceManager
主要用来获取常用的设备信息

e.g
获取设备UUID
NSString *deviceUUID = [[YBDeviceManager defaultManager] getDeviceUUID];
    
获取设备剩余空间
NSString *freeSpace = [[YBDeviceManager defaultManager] getFreeDiskSpace];


……

获取当前设备名称
- (NSString *)getDeviceName;

获取广告标识符
- (NSString *)getIDFA;

获取设备IP地址
- (NSString *)getDeviceIPAddress;

获取WiFi地址
- (NSString *)getIPAddressForWiFi;

……
具体信息请查看相关函数。
