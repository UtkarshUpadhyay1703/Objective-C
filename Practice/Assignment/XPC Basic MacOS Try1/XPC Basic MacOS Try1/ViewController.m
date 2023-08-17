//
//  ViewController.m
//  XPC Basic MacOS Try1
//
//  Created by admin on 6/13/23.
//

#import "ViewController.h"
#import "XPCWALAProtocol.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.faronics.XPCWALA"];
        connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCWALAProtocol)];
        connection.interruptionHandler = ^{
               NSLog(@"interruption");
           };
        connection.invalidationHandler = ^{
               NSLog(@"invalidation");
           };
           [connection resume];
    id<XPCWALAProtocol> service = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
               NSLog(@"%@",error);
           }];
    [service addName:@"YO FORM "];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
