#import "UIBubbleTableView+NMA.h"
#import "UIBubbleTableViewCell+NMA.h"
#import "NSBubbleData+NMA.h"

@implementation UIBubbleTableView (NMA)

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSBubbleData *data = [self.bubbleDataSource bubbleTableView:self dataForRow:indexPath.row];
    if([data.NMA_new isEqualToNumber:@1]){
        data.NMA_new = @0;
    } else {
        return;
    }
    [self scrollBubbleViewToBottomAnimated:YES];
    UIImage *i = [self captureCellImage:cell];
    UIImageView *iv = [[UIImageView alloc] initWithImage:i];
    
    [(UIBubbleTableViewCell*)cell hide];
    
    CGRect or = iv.frame;
    CGSize os = or.size;
    iv.layer.anchorPoint = CGPointMake(0, 0);
    or.origin = CGPointZero;
    iv.layer.frame = or;
    iv.layer.opacity = 1.;
    [cell addSubview:iv];
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, os.width, os.height, 0.0);
    transform = CATransform3DScale(transform, 0., 0., 1.);
    iv.layer.transform = transform;
    
    [UIView animateWithDuration:1.
                          delay:0.
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CATransform3D transform = CATransform3DIdentity;
                         transform = CATransform3DScale(transform, 0.5, 0.5, 1.);
                         transform = CATransform3DTranslate(transform, -os.width / 4, os.height - os.height / 2., 0.0);
                         iv.layer.transform = transform;
                     }
                     completion:^(BOOL b){
                         [UIView animateWithDuration:1.
                                               delay:0.
                              usingSpringWithDamping:0.5
                               initialSpringVelocity:0.5
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              CATransform3D transform = CATransform3DIdentity;
                                              transform = CATransform3DScale(transform, 1., 1., 1.);
                                              transform = CATransform3DTranslate(transform, 0., 0., 0.0);
                                              iv.layer.transform = transform;
                                          }
                                          completion:^(BOOL b){
                                              [iv removeFromSuperview];
                                              [(UIBubbleTableViewCell*)cell show];
                                          }];
                     }];
}

-(UIImage*)captureCellImage:(UITableViewCell *)cell
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(cell.bounds.size.width - 1, cell.bounds.size.height - 1), cell.opaque, 0.0);
    [cell.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
