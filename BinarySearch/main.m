#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
        NSMutableArray *numbers = [[NSMutableArray alloc]init];
        
        
        // create array of numbers from 1 to 1000000
        for (int i=1; i <=1000000; i++) {
            [numbers addObject:[NSString stringWithFormat:@"%d",i]];
        }
    
    NSString *targetNumber = @"999";

//linear search
    NSDate *methodStart = [NSDate date];
    
    
    for (int i=0; i<[numbers count]; i++)
    {
        if ([numbers[i] isEqualToString:targetNumber])
        {
            NSLog(@"index is %d (linear search)", i);
        }
    }
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"executionTime = %f", executionTime);

// binary search
    
    NSDate *methodStart2 = [NSDate date];

    long int minimumIndex = 0;
    long int maximumIndex = [numbers count];
    long int midIndex = round((maximumIndex-minimumIndex)/2);
    
    
    int targetNumberInt = [targetNumber intValue];
    
    while ([[numbers objectAtIndex:midIndex]intValue] != targetNumberInt) {
        if (maximumIndex <minimumIndex) {
            return -1;
        }
        midIndex = minimumIndex +(maximumIndex - minimumIndex)/2;
        {
            if ([[numbers objectAtIndex:midIndex]intValue] <targetNumberInt)
            {
                minimumIndex = midIndex +1;
            }
            else if ([[numbers objectAtIndex:midIndex]intValue] >targetNumberInt)
                {
                    maximumIndex = midIndex-1;
                }
            else if ([[numbers objectAtIndex:midIndex]intValue] == targetNumberInt){
            NSLog(@"index is: %ld (binary search)", midIndex);
                
            NSDate *methodFinish2 = [NSDate date];
            NSTimeInterval executionTime2 = [methodFinish2 timeIntervalSinceDate:methodStart2];
            NSLog(@"executionTime = %f", executionTime2);

            return 0;
        }
    }
    }

    
    return 0;
}