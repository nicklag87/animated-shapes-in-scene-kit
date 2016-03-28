//
//  ViewController.m
//  obj-c practice
//
//  Created by Nicholas Lagerstedt on 3/27/16.
//  Copyright © 2016 Nicholas Lagerstedt. All rights reserved.
//

#import "ViewController.h"
#define arc4randommax   0x100000000


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SCNView *myScene = [[SCNView alloc] init];
    self.view = myScene;
    myScene.backgroundColor = [UIColor blackColor];
    
    
    SCNScene *basicScene = [[SCNScene alloc] init];
    myScene.scene = basicScene;
    
    myScene.autoenablesDefaultLighting = true;
    myScene.allowsCameraControl = true;
    
    
    
    // create camera
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    [basicScene.rootNode addChildNode:cameraNode];
    
    // position camera
    cameraNode.position = SCNVector3Make(0.0, 0.0, 10.0);
    
    
    // create capsule
    
    SCNBox *box = [SCNBox boxWithWidth:0.5 height:0.5 length:0.5 chamferRadius:0.0]; // 7th
    SCNPyramid *pyramid = [SCNPyramid pyramidWithWidth:0.5 height:0.5 length:0.5];  // 8th
    SCNSphere *sphere = [SCNSphere sphereWithRadius:.50];
    SCNPlane *plane = [SCNPlane planeWithWidth:2.0 height:1.0];
    SCNCapsule *capsule = [SCNCapsule capsuleWithCapRadius:0.5 height:1.0];
    SCNCylinder *cylinder = [SCNCylinder cylinderWithRadius:0.5 height:0.5];
    SCNTube *tube = [SCNTube tubeWithInnerRadius:0.2 outerRadius:0.5 height:0.5];
    SCNTorus *torus = [SCNTorus torusWithRingRadius:0.5 pipeRadius:0.2];
    
    // x values
    float first = 0.0;
    float second = (-1 * sqrt(2)/2);
    float third = -1.0;
    float fourth = (-1 *sqrt(2)/2);
    float fifth = 0.0;
    float sixth = sqrt(2)/2;
    float seventh = 1.0;
    float eigth = sqrt(2)/2;
    
    // y values
    float firstY = 1.0;
    float secondY = sqrt(2)/2;
    float thirdY = 0.0;
    float fourthY = -1 * (sqrt(2)/2);
    float fifthY = -1.0;
    float sixthY = -1 * (sqrt(2)/2);
    float seventhY = 0.0;
    float eigthY = sqrt(2)/2;
    
    
    NSArray *shapes = [[NSArray alloc] initWithObjects: sphere, plane, capsule, cylinder,
                       tube, torus, box, pyramid, nil];
    float xValues[8] = {first, second, third, fourth, fifth, sixth, seventh, eigth};
    float yValues[8] = {firstY, secondY, thirdY, fourthY, fifthY, sixthY, seventhY, eigthY};
    
    int num = 1;

    
    // shape loop
    
    for (int i = 0; i < shapes.count; i++) {
        SCNShape *shape = shapes[i];
        SCNNode *shapeNode = [SCNNode nodeWithGeometry:shape];
        shapeNode.position = SCNVector3Make(2 * xValues[i], 2 * yValues[i], 0.0);
        [basicScene.rootNode addChildNode:shapeNode];
        
        

        double val = ((double)arc4random() / arc4randommax);
        NSLog(@"%f", val);

        
        
        shape.firstMaterial.diffuse.contents = [UIColor colorWithHue:val saturation:1.0 brightness:1.0 alpha:1.0];
        
        // animation
        float x;
        float z;
        
        if (i % 2 == 0) {
            x = 1.0;
            z = -1.0;
        } else {
            x = -1.0;
            z = 1.0;
        }
        
        SCNAction *move1 = [SCNAction moveBy:SCNVector3Make(0.0, 0.0, x) duration:1];
        SCNAction *move2 = [SCNAction moveBy:SCNVector3Make(0.0, 0.0, z) duration:1];
        NSArray *moves = [NSArray arrayWithObjects:move1, move2, nil];
        SCNAction *sequence = [SCNAction sequence:moves];
        SCNAction *repeat = [SCNAction repeatActionForever:sequence];
        [shapeNode runAction:repeat];
        
        num++;
        
    }
    
    
    
    
    
    
    
    
    
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
