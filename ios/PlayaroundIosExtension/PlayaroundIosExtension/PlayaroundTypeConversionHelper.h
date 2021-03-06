#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface PlayaroundTypeConversionHelper : NSObject

- (FREResult) FREGetObject:(FREObject)object asInt:(int32_t*)value;
- (FREResult) FREGetObject:(FREObject)object asBoolean:(uint32_t*)value;
- (FREResult) FREGetObject:(FREObject)object asString:(NSString**)value;

- (FREResult) FREGetString:(NSString*)string asObject:(FREObject*)asObject;
- (FREResult) FREGetInt:(int32_t)value asObject:(FREObject*)asObject;
- (FREResult) FREGetDouble:(double)value asObject:(FREObject*)asObject;
- (FREResult) FREGetBool:(BOOL)value asObject:(FREObject*)asObject;

- (NSArray *) FREGetObjectAsStringArray:(FREObject)object;

@end
