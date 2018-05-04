//
//  ListStructure.c
//  DataStructure_Ex
//
//  Created by plum on 2018/5/4.
//  Copyright © 2018年 plum. All rights reserved.
//

#include "ListStructure.h"

struct Node {
    ElementType element;
    Position next;
};

int isEmpty(List l) {
    return l->next == NULL;
}

int isLast(Position p, List l) {
    return p->next == NULL;
}

Position find(ElementType x, List l) {
    Position p;
    p = l->next;
    while (p != NULL && p->element != x) {
        p = p->next;
    }
    return p;
}

void delete(ElementType x, List l) {
    Position p, temp;
    p = findPrevious(x, l);
    if (!isLast(p, l)) {
        temp = p->next;
        p->next = temp->next;
        free(temp);
    }
}

Position findPrevious(ElementType x, List l) {
    Position p = l;
    while (p->next != NULL && p->next->element != x) {
        p = p->next;
    }
    return p;
}

void insert(ElementType x, List l, Position p) {
    Position temp = malloc(sizeof(struct Node));
    if (temp == NULL) {
        FatalError("out of space");
    }
    temp->next = p->next;
    temp->element = x;
    p->next = temp;
}
