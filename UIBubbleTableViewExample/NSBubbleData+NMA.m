#import "NSBubbleData+NMA.h"
#import <objc/runtime.h>

static void *NMA_isNew;

@implementation NSBubbleData (NMA)

- (void)setNMA_new:(NSNumber*)b
{
    objc_setAssociatedObject(self, &NMA_isNew, b, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)NMA_new
{
    return objc_getAssociatedObject(self, &NMA_isNew);
}

@end
