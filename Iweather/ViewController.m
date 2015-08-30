//
//  ViewController.m
//  Iweather
//
//  Created by Nguyen Duy Kieu on 8/12/15.
//  Copyright (c) 2015 Nguyen Duy Kieu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *tempereture;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *CLabel;
@property (weak, nonatomic) IBOutlet UILabel *FLabel;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFile;
    BOOL _isCelciusMode;
    float _temperetureValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Mot con ngua dau ca tau bo co",@"Cho thay song ca ma nga tay cheo",@"Khong co gi qui hon doc lap tu do"];
    locations = @[@"Hai Ba Trung , Ha Noi",@"New York , USA",@"London , UK"];
    photoFile = @ [@"rain",@"sunny",@"windy",@"thunder"];
    _isCelciusMode = true;
    [self setTemp ];
    self.FLabel.hidden = true;
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d",quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    NSLog(@"%d",locationIndex);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFile.count);
    NSLog(@"%d",photoIndex);
    self.weatherIcon.image = [UIImage imageNamed:photoFile[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f",[self getTempereture]];
    [self.tempereture setTitle:string forState:UIControlStateNormal];
    
    [self setTemp ];
}
-(void) setTemp{
    _temperetureValue = [self getTempereture];
    NSString* string = [NSString stringWithFormat:@"%2.1f",_temperetureValue];
    [self.tempereture setTitle:string forState:UIControlStateNormal];
    
}
- (float) getTempereture{
    float temp = 14.0 + arc4random_uniform(18)  + (float)arc4random() / (float) INT32_MAX ;
    if (_isCelciusMode) {
        return temp;
    }else{
        return (temp *1.8) + 32.0 ;
    }
}
- (IBAction)chuyendoi:(id)sender {
    _isCelciusMode = !_isCelciusMode ;
    if (_isCelciusMode) {
        self.degreeLabel .hidden = false;
        self.CLabel.hidden = false;
        self.FLabel.hidden = true;
        _temperetureValue = (_temperetureValue - 32.0) / 1.8;
    }else{
        self.degreeLabel.hidden = false;
        self.CLabel.hidden = true;
        self.FLabel.hidden = false;
        _temperetureValue = (_temperetureValue *1.8) + 32.0;
    }
    NSString* string =  [NSString stringWithFormat:@"%2.1f" ,_temperetureValue];
    [self.tempereture setTitle:string forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
