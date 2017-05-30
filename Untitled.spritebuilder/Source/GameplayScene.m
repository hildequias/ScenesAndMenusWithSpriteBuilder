//
//  GameplayScene.m
//  Untitled
//
//  Created by Hildequias Junior on 5/30/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "GameplayScene.h"
#import "MainScene.h"
#import "cocos2d-ui.h"

@implementation GameplayScene

+(CCScene*)sceneWithLevel:(NSString *) lvlNum{
    
    return[[self alloc]initWithLevel:lvlNum];
}

-(id)initWithLevel:(NSString *) lvlNum {
    
    if(self = [super init]) {
        
        CGSize winSize = [[CCDirector sharedDirector]viewSize];
        
        //Basic CCSprite - Background Image
        CCSprite* backgroundImage = [CCSprite spriteWithImageNamed:@"Bg.png"];
        
        backgroundImage.position = CGPointMake(winSize.width/2, winSize.height/2);
        
        [self addChild:backgroundImage];
        
        CCLabelTTF *mainmenuLabel = [CCLabelTTF labelWithString:@"GameplayScene" fontName:@"AmericanTypewriter-Bold" fontSize: 36.0f];
        
        mainmenuLabel.position = CGPointMake(winSize.width/2, winSize.height * 0.8);
        [self addChild:mainmenuLabel];
        
        CCLabelTTF *levelNumLabel = [CCLabelTTF labelWithString:lvlNum fontName:@"AmericanTypewriter-Bold" fontSize: 24.0f];
        
        levelNumLabel.position = CGPointMake(winSize.width/2, winSize.height * 0.7);
        
        [self addChild:levelNumLabel];
        
        CCButton *resetBtn = [CCButton buttonWithTitle:nil spriteFrame:[CCSpriteFrame frameWithImageNamed:@"resetBtn_normal.png"] highlightedSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"resetBtn_pressed.png"] disabledSpriteFrame:nil];
        
        [resetBtn setTarget:self selector:@selector(resetBtnPressed:)];
        
        CCLayoutBox *btnMenu = [[CCLayoutBox alloc] init];
        btnMenu.anchorPoint = ccp(0.5f, 0.5f);
        btnMenu.position = CGPointMake(winSize.width/2, winSize.height * 0.5);
        [btnMenu addChild:resetBtn];
        
        [self addChild:btnMenu];
    }
    
    return self;
    
}

-(void)resetBtnPressed:(id)sender {
    
    CCLOG(@"reset button pressed");
    [[CCDirector sharedDirector] replaceScene:[[MainScene alloc] init]];
}

@end
