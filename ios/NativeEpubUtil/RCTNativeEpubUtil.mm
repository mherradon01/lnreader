//

#import "RCTNativeEpubUtil.h"

@implementation RCTNativeEpubUtil


+ (NSString *)moduleName { 
  return @"NativeEpub";
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params { 
  return std::make_shared<facebook::react::NativeEpubSpecJSI>(params);
}

- (NSDictionary * _Nullable)parseNovelAndChapters:(NSString * _Nonnull)epubDirPath { 
  NSMutableDictionary * res = [NSMutableDictionary dictionary];
  // TODO: implement parse epub
  return res;
}

@end
