//
//  LevelSelectionScene.m
//  Untitled
//
//  Created by Hildequias Junior on 5/30/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "LevelSelectionScene.h"
#import "LevelSelectionBtn.h"
#import "GameplayScene.h"

@implementation LevelSelectionScene

+(CCScene*)scene{
    
    return[[self alloc]init];
}

-(id)init{
    
    if(self = [super init]){
        
        self.userInteractionEnabled = TRUE;
        CGSize winSize = [[CCDirector sharedDirector]viewSize];
        
        //Add Background Image
        CCSprite* backgroundImage = [CCSprite spriteWithImageNamed:@"Bg.png"];
        backgroundImage.position = CGPointMake(winSize.width/2, winSize.height/2);
        [self addChild:backgroundImage];
        
        //add text heading for file
        CCLabelTTF *mainmenuLabel = [CCLabelTTF labelWithString:@"LevelSelectionScene" fontName:@"AmericanTypewriter-Bold" fontSize: 36.0f];
        mainmenuLabel.position = CGPointMake(winSize.width/2, winSize.height * 0.8);
        [self addChild:mainmenuLabel];
        
        //initialize array
        buttonSpritesArray = [NSMutableArray array];
        
        int widthCount = 5;
        int heightCount = 5;
        float spacing = 70.0f;
        
        float halfWidth = winSize.width/2 - (widthCount-1) * spacing * 0.5f;
        float halfHeight = winSize.height/2 + (heightCount-1) * spacing * 0.5f;
        
        int levelNum = 1;
        
        for(int i = 0; i < heightCount; ++i){
            
            float y = halfHeight - i * spacing;
            
            for(int j = 0; j < widthCount; ++j){
                
                float x = halfWidth + j * spacing;
                
                LevelSelectionBtn* lvlBtn = [[LevelSelectionBtn alloc] initWithFilename:@"btnBG.png" StartlevelNumber:levelNum];
                lvlBtn.position = CGPointMake(x,y);
                lvlBtn.name = [NSString stringWithFormat:@"%d",levelNum];
                
                [self addChild:lvlBtn];
                
                [buttonSpritesArray addObject: lvlBtn];
                
                levelNum++;
            }
        }
    }
    
    return self;
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
    CGPoint location = [touch locationInNode:self];
    
    for (CCSprite *sprite in buttonSpritesArray) {
        
        if (CGRectContainsPoint(sprite.boundingBox, location)){
            
            CCLOG(@" you have pressed: %@", sprite.name);
            self.userInteractionEnabled = false;
            
            CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:0.20];
            
            [[CCDirector sharedDirector] replaceScene:[[GameplayScene alloc] initWithLevel:sprite.name] withTransition:transition];
        }
    }
    
}

@end
