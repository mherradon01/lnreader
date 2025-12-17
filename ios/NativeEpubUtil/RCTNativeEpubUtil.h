#import <Foundation/Foundation.h>
#import <LNReaderSpec/LNReaderSpec.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTNativeEpubUtil : NSObject<NativeEpubSpec>

- (NSDictionary * _Nullable)parseNovelAndChapters:(NSString *)epubDirPath;

@end

NS_ASSUME_NONNULL_END
