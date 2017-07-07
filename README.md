# YBDeviceManager
主要用来获取常用的**设备**信息

**使用方法**

获取设备UUID
`NSString *deviceUUID = [[YBDeviceManager defaultManager] getDeviceUUID];`
    
获取设备剩余空间
`NSString *freeSpace = [[YBDeviceManager defaultManager] getFreeDiskSpace];`


**MORE**
> 获取当前设备名称
`-(NSString *)getDeviceName;`

> 获取广告标识符
`-(NSString *)getIDFA;`

> 获取设备IP地址
`-(NSString *)getDeviceIPAddress;`

> 获取WiFi地址
`-(NSString *)getIPAddressForWiFi;`

And So on.

具体信息请查看相关函数。
