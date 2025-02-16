//
//  FinderSync.m
//  ClickExtension
//
//  Created by admin on 2/4/25.
//

#import "FinderSync.h"

@interface FinderSync ()

@property NSURL *myFolderURL;

@end

@implementation FinderSync

- (instancetype)init {
    self = [super init];

    NSLog(@"%s launched from %@ ; compiled at %s", __PRETTY_FUNCTION__, [[NSBundle mainBundle] bundlePath], __TIME__);

    // Set up the directory we are syncing.
    self.myFolderURL = [NSURL fileURLWithPath:@"/Users/Shared/MySyncExtension Documents"];
//    [FIFinderSyncController defaultController].directoryURLs = [NSSet setWithObject:self.myFolderURL];
    [FIFinderSyncController defaultController].directoryURLs = [NSSet setWithObject:[NSURL fileURLWithPath:@"/"]];
	NSLog(@"init");
    // Set up images for our badge identifiers. For demonstration purposes, this uses off-the-shelf images.
    [[FIFinderSyncController defaultController] setBadgeImage:[NSImage imageNamed: NSImageNameColorPanel] label:@"Status One" forBadgeIdentifier:@"One"];
    [[FIFinderSyncController defaultController] setBadgeImage:[NSImage imageNamed: NSImageNameCaution] label:@"Status Two" forBadgeIdentifier:@"Two"];
    
    return self;
}

#pragma mark - Primary Finder Sync protocol methods

- (void)beginObservingDirectoryAtURL:(NSURL *)url {
    // The user is now seeing the container's contents.
    // If they see it in more than one view at a time, we're only told once.
    NSLog(@"beginObservingDirectoryAtURL:%@", url.filePathURL);
}


- (void)endObservingDirectoryAtURL:(NSURL *)url {
    // The user is no longer seeing the container's contents.
    NSLog(@"endObservingDirectoryAtURL:%@", url.filePathURL);
}

- (void)requestBadgeIdentifierForURL:(NSURL *)url {
    NSLog(@"requestBadgeIdentifierForURL:%@", url.filePathURL);
    
    // For demonstration purposes, this picks one of our two badges, or no badge at all, based on the filename.
    NSInteger whichBadge = [url.filePathURL hash] % 3;
    NSString* badgeIdentifier = @[@"", @"One", @"Two"][whichBadge];
    [[FIFinderSyncController defaultController] setBadgeIdentifier:badgeIdentifier forURL:url];
}

#pragma mark - Menu and toolbar item support

- (NSString *)toolbarItemName {
    return @"ClickExtension";
}

- (NSString *)toolbarItemToolTip {
    return @"ClickExtension: Click the toolbar item for a menu.";
}

- (NSImage *)toolbarItemImage {
    return [NSImage imageNamed:NSImageNameCaution];
}

- (NSMenu *)menuForMenuKind:(FIMenuKind)whichMenu {
    // Produce a menu for the extension.
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"MENU"];
    [menu addItemWithTitle:@"Example Menu Item" action:@selector(sampleAction:) keyEquivalent:@"UU: Print Path"];

	return menu;
}

- (IBAction)sampleAction:(id)sender {
	NSLog(@"sampleAction");
	
	NSURL* target = [[FIFinderSyncController defaultController] targetedURL];
	NSArray* items = [[FIFinderSyncController defaultController] selectedItemURLs];

	// Resolve target URL to get the actual file path
	NSString *targetPath = [[target URLByResolvingSymlinksInPath] path];
	NSLog(@"sampleAction: menu item: %@, target = %@, items = ", [sender title], targetPath);

	[items enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
		// Resolve the item's URL to get the actual file path
		NSString *itemPath = [[obj URLByResolvingSymlinksInPath] path];
		NSLog(@"    %@", itemPath);
	}];
}

@end
