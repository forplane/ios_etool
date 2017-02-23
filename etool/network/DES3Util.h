//
//  DES3Util.h
//
#import <Foundation/Foundation.h>
/**
 *  3des加密,一定要设置key跟iv值
 */
@interface DES3Util : NSObject {
}
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText;
// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText;
@end
