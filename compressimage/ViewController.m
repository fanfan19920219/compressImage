//
//  ViewController.m
//  compressimage
//
//  Created by bioongroup on 15/11/6.
//  Copyright © 2015年 ylk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImage *image;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    image = [UIImage imageNamed:@"中二病.jpg"];
}
- (IBAction)transform:(UIButton *)sender {
    CGSize imagesize = image.size;
//    imagesize.height =image.size.height/1;
//    imagesize.width =image.size.width/1;
    //对图片大小进行压缩--
    _imageView = [[UIImageView alloc]init];
    image = [self imageWithImage:image scaledToSize:imagesize];
    NSData *imageData = UIImageJPEGRepresentation(image,0.01);
    UIImage *image1 = [UIImage imageWithData:imageData];
    self.imageView.image = image1;
    self.imageView.bounds = CGRectMake(0, 0,image.size.width,image.size.height);
    self.imageView.center = self.view.center;
    NSLog(@"imageData.length=====%f",imageData.length/1024.0);
    [self.view addSubview:_imageView];
}

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the contexta
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
