//
//  main.m
//  DataStructure_Ex
//
//  Created by plum on 2018/4/26.
//  Copyright © 2018年 plum. All rights reserved.
//

#import <Foundation/Foundation.h>

//O(n^2)
int MaxSequenceSum1(int p[], int length) {
    int max = 0;
    for (int i = 0; i < length; i++) {
        int sum = 0;
        for (int j = i; j < length; j++) {
            sum += p[j];
            if (sum > max) {
                max = sum;
            }
        }
    }
    return max;
};

// O(N^3)
int MaxSequenceSum2(int *p, int length) {
    int max = 0;
    for (int i = 0; i < length; i++) {
        for (int j = i; j < length; j++) {
            int temp = 0;
            for (int k = i; k <= j; k++) {
                temp += p[k];
            }
            if (temp > max) {
                max = temp;
            }
        }
    }
    return max;
}

int MaxSequenceSum3(int *p, int left, int right) {
    int maxLeftSum, maxRightSum;
    int maxLeftBorderSum, maxRightBorderSum;
    int leftBorderSum, rightBorderSum;
    int center, i;
    
    if (left == right) {
        if (p[left] > 0) {
            return p[left];
        } else {
            return 0;
        }
    }
    
    center = (left + right) / 2;
    maxLeftSum = MaxSequenceSum3(p, left, center);
    maxRightSum = MaxSequenceSum3(p, center + 1, right);
    
    maxLeftBorderSum = 0;
    leftBorderSum = 0;
    for (i = center; i >= left; i--) {
        leftBorderSum += p[i];
        if (leftBorderSum > maxLeftBorderSum) {
            maxLeftBorderSum = leftBorderSum;
        }
    }
    rightBorderSum = 0;
    maxRightBorderSum = 0;
    for (i = center + 1; i <= right; i++) {
        rightBorderSum += p[i];
        if (rightBorderSum > maxRightBorderSum) {
            maxRightBorderSum = rightBorderSum;
        }
    }
    
    int number = MAX(maxLeftSum, maxRightSum);
    return MAX(number, maxLeftBorderSum + maxRightBorderSum);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        int a[] = {1,-2,3,1,-3,9};
        int max1 = MaxSequenceSum1(a, 6);
        int max2 = MaxSequenceSum2(a, 6);
        int max3 = MaxSequenceSum3(a, 0, 5);
        NSLog(@"");
        
    }
    return 0;
}



