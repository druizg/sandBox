//
//  STIViewController.m
//  sandBox
//
//  Created by chuck davila rios on 04/03/14.
//  Copyright (c) 2014 chuck davila rios. All rights reserved.
//

#import "STIViewController.h"

@interface STIViewController ()
- (IBAction)save:(id)sender;

@end

@implementation STIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    //obtener la ruta a la carpeta de la sandbox
    NSFileManager *fm = [NSFileManager defaultManager];
    
    //URL al directorio de cachés
    NSURL *url = [[fm URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject] ;
    
    //obtenemos la url a un fichero determinado de dicha carpeta
    url = [url URLByAppendingPathComponent:@"test.txt"];
    
    
    //guardamos algo en el fichero
    NSError *error = nil;
    
    BOOL rc = NO;
    
    rc = [@"Hola Mundo..." writeToURL:url
                           atomically:YES
                             encoding:NSUTF8StringEncoding
                                error:&error];
    
    if (rc == NO) {
        //algo malo pasó
        NSLog(@"Error al guardar...");
    }
    
    NSString *content = [NSString stringWithContentsOfURL:url
                                                 encoding:NSUTF8StringEncoding
                                                    error:&error];
    
    if (content == nil) {
        //Error al leer fichero
        NSLog(@"Error al leer el fichero %@", error);
    }else {
        self.aMessage.text = [@"Esto es tuyo: " stringByAppendingString:content];
    }
    
    
}
@end
