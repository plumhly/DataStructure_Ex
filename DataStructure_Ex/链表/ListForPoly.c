//
//  ListForPoly.c
//  DataStructure_Ex
//
//  Created by plum on 2018/5/7.
//  Copyright © 2018年 plum. All rights reserved.
//

#include "ListForPoly.h"

#define maxDegree 10

typedef struct {
    int coeffArray[maxDegree + 1];
    int highPower;//最大幂次数
} *Polynomial;


int max(int a, int b) {
    return a > b ? a : b;
}

void zeroPolynomial(Polynomial poly) {
    int i;
    for (i = 0; i <= maxDegree; i++) {
        poly->coeffArray[i] = 0;
    }
    poly->highPower = 0;
}

void addPolynomial(const Polynomial poly1, const Polynomial poly2, Polynomial polySum) {
    zeroPolynomial(polySum);
    polySum->highPower = max(poly1->highPower, poly2->highPower);
    for (int i = polySum->highPower; i >= 0; i--) {
        polySum->coeffArray[i] = poly1->coeffArray[i] + poly2->coeffArray[i];
    }
}
