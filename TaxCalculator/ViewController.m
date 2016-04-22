//
//  ViewController.m
//  TaxCalculator
//
//  Created by Andrew Bihl on 4/21/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)onCalculateButtonTapped:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
//@property NSDictionary* cityTaxes;
@property NSArray* cityTaxes;
//@property double sfTax;
//@property double chiTax;
//@property double nyTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cityTaxes = @[@8.75, @10.25, @8.875];
//    _sfTax = 8.75;
//    _chiTax = 10.25;
//    _nyTax = 8.875;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCalculateButtonTapped:(UIButton *)sender {
    int segmentSelection = _segmentedControl.selectedSegmentIndex;
    NSNumber* taxRate = [_cityTaxes objectAtIndex:segmentSelection];
    //NSLog(@"%i",_segmentedControl.selectedSegmentIndex);
    float result = (double)[_priceTextField.text intValue];
    result *= ([taxRate floatValue] / 100);
    NSString* resultString = [NSString stringWithFormat: @"%f",result];
    for (int i = resultString.length-1; i>2; i--)
        if ([resultString characterAtIndex:i] == '0')
            resultString = [resultString substringToIndex: i];
        else if ([resultString characterAtIndex:i] == '.')
            resultString = [NSString stringWithFormat: @"%@%@",resultString,@"0"];
        else
            break;
    _resultLabel.text = resultString;
}
@end
