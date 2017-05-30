//
//  LevelSelectionBtn.m
//  Untitled
//
//  Created by Hildequias Junior on 5/30/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "LevelSelectionBtn.h"

@implementation LevelSelectionBtn

-(id)initWithFilename:(NSString *) filename StartlevelNumber:(int) lvlNum {
    
    if (self = [super initWithImageNamed:filename]) {
        
        CCLOG(@"Filename: %@ and levelNUmber: %d", filename, lvlNum);
        
        CCLabelTTF *textLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d",lvlNum ] fontName:@"AmericanTypewriter-Bold" fontSize: 12.0f];
        
        textLabel.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
        textLabel.color = [CCColor colorWithRed:0.1f green:0.45f blue:0.73f];
        
        [self addChild:textLabel];
    }
    
    return self;
}

@end
