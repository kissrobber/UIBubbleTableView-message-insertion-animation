#import "UIBubbleTableViewCell+NMA.h"

@interface UIBubbleTableViewCell ()

@property (nonatomic, retain) UIView *customView;
@property (nonatomic, retain) UIImageView *bubbleImage;
@property (nonatomic, retain) UIImageView *avatarImage;

@end

@implementation UIBubbleTableViewCell (NMA)

-(void)hide{
    self.bubbleImage.layer.opacity = 0.;
    self.customView.layer.opacity = 0.;
    self.avatarImage.layer.opacity = 0.;
}
-(void)show{
    self.bubbleImage.layer.opacity = 1.;
    self.customView.layer.opacity = 1.;
    self.avatarImage.layer.opacity = 1.;
}

@end
