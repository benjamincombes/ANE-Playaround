#import "PlayaroundTypeConversionHelper.h"

@implementation PlayaroundTypeConversionHelper

- (FREResult) FREGetObject:(FREObject)object asInt:(int32_t*)value
{
    return FREGetObjectAsInt32( object, value );
}

- (FREResult) FREGetObject:(FREObject)object asBoolean:(uint32_t*)value
{
    return FREGetObjectAsBool( object, value );
}

- (FREResult) FREGetObject:(FREObject)object asString:(NSString**)value
{
    FREResult result;
    uint32_t length = 0;
    const uint8_t* tempValue = NULL;
    
    result = FREGetObjectAsUTF8( object, &length, &tempValue );
    if( result != FRE_OK ) return result;
    
    *value = [NSString stringWithUTF8String: (char*) tempValue];
    
    return FRE_OK;
}

- (FREResult) FREGetString:(NSString*)string asObject:(FREObject*)asObject
{
    if( string == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    const char* utf8String = string.UTF8String;
    uint32_t length = (uint32_t)strlen( utf8String );
    return FRENewObjectFromUTF8( length + 1, (uint8_t*) utf8String, asObject );
}

- (FREResult) FREGetInt:(int32_t)value asObject:(FREObject*)asObject
{
    return FRENewObjectFromInt32( value, asObject );
}

- (FREResult) FREGetDouble:(double)value asObject:(FREObject*)asObject
{
    return FRENewObjectFromDouble( value, asObject );
}

- (FREResult) FREGetBool:(BOOL)value asObject:(FREObject*)asObject
{
    return FRENewObjectFromBool( value, asObject );
}

- (NSArray *) FREGetObjectAsStringArray:(FREObject)object {
    uint32_t arrayLength;
    FREGetArrayLength(object, &arrayLength);
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:arrayLength];
    
    for (uint32_t i = 0; i < arrayLength; i++) {
        FREObject itemRaw;
        FREGetArrayElementAt(object, i, &itemRaw);
        
        NSString *item;
        
        if ([self FREGetObject:itemRaw asString:&item] != FRE_OK)
            continue;
        
        [mutableArray addObject:item];
    }
    
    return [NSArray arrayWithArray:mutableArray];
}

@end
