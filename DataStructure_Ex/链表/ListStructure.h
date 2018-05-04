//
//  ListStructure.h
//  DataStructure_Ex
//
//  Created by plum on 2018/5/4.
//  Copyright © 2018年 plum. All rights reserved.
//

#ifndef ListStructure_h
#define ListStructure_h

#include <stdio.h>
#include <stdlib.h>

struct Node;
typedef int ElementType;
typedef struct Node *PtrToNode;
typedef PtrToNode List;
typedef PtrToNode Position;

// method
List makeEmpty(List l);
int isEmpty(List l);
int isLast(Position p, List l);
Position find(ElementType x, List l);
void delete(ElementType x, List l);
Position findPrevious(ElementType x, List l);
void insert(ElementType x, List l, Position p);
void deleteList(List l);
Position header(List l);
Position first(List l);
Position advance(Position p);
ElementType retrieve(Position p);


#endif /* ListStructure_h */
