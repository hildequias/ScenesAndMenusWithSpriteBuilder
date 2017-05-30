//
//  GameplayScene.h
//  Untitled
//
//  Created by Hildequias Junior on 5/30/17.
//  Copyright © 2017 Apportable. All rights reserved.
//

#import "CCScene.h"

@interface GameplayScene : CCNode

+(CCScene *) sceneWithLevel:(NSString *) lvlNum;
-(id) initWithLevel:(NSString *) lvlNum;

@end
