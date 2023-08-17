//
//  AddFramework.h
//  AddFramework
//
//  Created by admin on 6/13/23.
//

#import <Foundation/Foundation.h>
#import "AddFrameworkProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface AddFramework : NSObject <AddFrameworkProtocol>
@end
