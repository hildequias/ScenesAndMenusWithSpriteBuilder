#import "MainScene.h"
#import "cocos2d-ui.h"
#import "GameplayScene.h"
#import "LevelSelectionScene.h"

@implementation MainScene

+(CCScene*)scene{
    
    return[[self alloc]init];
}

-(id)init{
    
    if(self = [super init]){
        
        winSize = [[CCDirector sharedDirector]viewSize];
        
        CCSprite *backgroundImage = [CCSprite spriteWithImageNamed:@"Bg.png"];
        backgroundImage.position = CGPointMake(winSize.width/2, winSize.height/2);
        
        [self addChild:backgroundImage];
        
        CCLabelTTF *mainmenuLabel = [CCLabelTTF labelWithString:@"Main Menu"
                           fontName:@"AmericanTypewriter-Bold"
                           fontSize: 36.0f];
        
        mainmenuLabel.position = CGPointMake(winSize.width/2, winSize.height * 0.8);
        
        //adding shadow
        mainmenuLabel.shadowColor = [CCColor colorWithRed:0.0 green:0.0 blue:1.0];
        mainmenuLabel.shadowOffset = ccp(1.0, 1.0);
        
        //adding outline
        mainmenuLabel.outlineColor = [CCColor colorWithRed:1.0 green:0.0 blue:0.0];
        mainmenuLabel.outlineWidth = 2.0;
        
        [self addChild:mainmenuLabel];
        
        CCButton *playBtn = [CCButton buttonWithTitle:nil spriteFrame:[CCSpriteFrame frameWithImageNamed:@"playBtn_normal.png"] highlightedSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"playBtn_pressed.png"] disabledSpriteFrame:nil];
        
        [playBtn setTarget:self selector:@selector(playBtnPressed:)];
        
        CCButton *menuBtn = [CCButton buttonWithTitle:nil spriteFrame:[CCSpriteFrame frameWithImageNamed:@"menuBtn.png"] highlightedSpriteFrame:[CCSpriteFrame frameWithImageNamed:@"menuBtn.png"] disabledSpriteFrame:nil];
        
        [menuBtn setTarget:self selector:@selector(menuBtnPressed:)];
        
        
        
        
        
        CCLayoutBox *btnMenu = [[CCLayoutBox alloc] init];
        btnMenu.anchorPoint = ccp(0.5f, 0.5f);
        btnMenu.position = CGPointMake(winSize.width/2, winSize.height * 0.5);
        btnMenu.direction = CCLayoutBoxDirectionVertical;
        btnMenu.spacing = 10.0f;
        
        [btnMenu addChild:menuBtn];
        [btnMenu addChild:playBtn];
        
        [self addChild:btnMenu];
    }
    
    return self;
}

-(void)playBtnPressed:(id)sender{
    
    CCLOG(@"play button pressed");
    
    CCTransition *transition = [CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:0.20];
    
    [[CCDirector sharedDirector] replaceScene:[[GameplayScene alloc] initWithLevel:@"1"] withTransition:transition];
}

-(void)menuBtnPressed:(id)sender {
    CCLOG(@"menu button pressed");
    
    CCTransition *transition = [CCTransition transitionCrossFadeWithDuration:0.20];
    
    [[CCDirector sharedDirector] replaceScene: [[LevelSelectionScene alloc] init] withTransition:transition];
}

@end
