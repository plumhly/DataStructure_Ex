//
//  main.m
//  DataStructure_Ex
//
//  Created by plum on 2018/4/26.
//  Copyright © 2018年 plum. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 最大序列和
//O(n^2)
int maxSequenceSum1(int p[], int length) {
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
int maxSequenceSum2(int *p, int length) {
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

// O(Nlog(N))
int maxSequenceSum3(int *p, int left, int right) {
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
    maxLeftSum = maxSequenceSum3(p, left, center);
    maxRightSum = maxSequenceSum3(p, center + 1, right);
    
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

// O(N)
int maxSequenceSum4(int *p, int length) {
    int thisSum, maxSum, j;
    thisSum = maxSum = 0;
    for (j = 0; j < length; j++) {
        thisSum += p[j];
        if (thisSum > maxSum) {
            maxSum = thisSum;
        } else if (thisSum < 0) {
            thisSum = 0;
        }
    }
    return maxSum;
}

#pragma mark - 最大公约数

int gcd1(int a, int b) {
    int index;
    if (a < b) {
        index = a;
    } else {
        index = b;
    }
    int temp = 1;
    for (int i = 1; i <= index; i ++) {
        bool tempa = a % i == 0;
        bool tempb = b % i == 0;
        if (tempa && tempb) {
            temp = i;
        }
    }
    return temp;
}

int gcd2(int a, int b) {
    int rem;
    while (b > 0) {
        rem = a % b;
        a = b;
        b = rem;
    }
    return a;
}

#pragma mark - 幂运算
// O(2log(N))
long int powCustom(long int x, int n) {
    if (n == 0) {
        return 1;
    }
    
    if (n == 1) {
        return x;
    }
    if (n % 2 == 0) {//偶数
        return powCustom(x * x, n / 2);// 6
    } else {
        return powCustom(x * x, n / 2) * x;
    }
}

//思考把6行替换成 return powCustom(x, n / 2) * powCustom(x, n / 2);
// 这样时间 T(n) = T(n) + 2T(n) + 4T(n) + ......

#pragma mark - 基数排序
#define BASE 10
#define MAX 20

void radix(int *p, int length) {
    int max = 0;
    
    for (int i = 0; i < length; i++) {
        if (p[i] > max) {
            max = p[i];
        }
    }
    
    int exp = 1;
    int b[MAX] = {0};
    while ((max / exp) > 0) {
        int backet[BASE] = {0};
        for (int i = 0; i < length; i++) {
            backet[(p[i] / exp) % BASE]++;
        }
        
        for (int i = 1; i < BASE; i++) {
            backet[i] += backet[i - 1];
        }
        
        for (int i = length - 1; i >= 0; i--) {
            b[--backet[(p[i] / exp) % BASE]] = p[i];
        }
        
        for (int i = 0; i < length; i++) {
            p[i] = b[i];
        }
        exp *= BASE;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//-------------------------------最大序列号-------------------------------------
//        int a[] = {1,-2,3,1,-3,9};
//        int max1 = maxSequenceSum1(a, 6);
//        int max2 = maxSequenceSum2(a, 6);
//        int max3 = maxSequenceSum3(a, 0, 5);
//        int max4 = maxSequenceSum4(a, 6);
//---------------------------------------------------------------------

//-----------------------------最大公约数----------------------------------------
        CFAbsoluteTime time = CFAbsoluteTimeGetCurrent();
        
        for (int i = 0; i < 10000; i++) {
            int a1 = gcd1(1989, 1590);
        }
        NSLog(@"gcd1: %f", CFAbsoluteTimeGetCurrent() - time);
        
        time = CFAbsoluteTimeGetCurrent();
        for (int i = 0; i < 10000; i++) {
            int a2 = gcd2(1989, 1590);
        }
         NSLog(@"gcd2: %f", CFAbsoluteTimeGetCurrent() - time);
        
//-----------------------------基数排序--------------------------------------
        int p[4] = {244, 4, 134, 24};
        radix(p, 4);
        NSLog(@"");
        
    }
    return 0;
}



