//
//  MyScene.m
//  SpriteKitPhysicsTest
//
//  Created by Jamie Hong on 3/3/14.
//  Copyright (c) 2014 JamieHong. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
{
    SKSpriteNode *_square;
    SKSpriteNode *_circle;
    SKSpriteNode *_triangle;
}

-(instancetype)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        _square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
        _square.position = CGPointMake(self.size.width *0.25, self.size.height *0.50);
        [self addChild:_square];
        _circle = [SKSpriteNode spriteNodeWithImageNamed:@"circle"];
        _circle.position = CGPointMake(self.size.width * 0.5, self.size.height *0.5);
        [self addChild:_circle];
        _triangle = [SKSpriteNode spriteNodeWithImageNamed:@"triangle"];
        _triangle.position = CGPointMake(self.size.width * 0.75, self.size.height * 0.5);
        [self addChild:_triangle];
        
        
        _circle.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_circle.size.width/2];
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        _square.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_square.size];
        //1
        CGMutablePathRef trianglePath = CGPathCreateMutable();
        //2
        CGPathMoveToPoint(
                          trianglePath, nil, -_triangle.size.width/2, -_triangle.size.height/2);
        //3
        CGPathAddLineToPoint(
                             trianglePath, nil, _triangle.size.width/2, -_triangle.size.height/2);
        CGPathAddLineToPoint(trianglePath, nil, 0, _triangle.size.height/2); CGPathAddLineToPoint(
                                                                                                  trianglePath, nil, -_triangle.size.width/2, -_triangle.size.height/2);
        //4
        _triangle.physicsBody =
        [SKPhysicsBody bodyWithPolygonFromPath:trianglePath];
        //5
        CGPathRelease(trianglePath);
    }
    return self;
}

@end
