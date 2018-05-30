//
//  Graphic.c
//  DataStructure_Ex
//
//  Created by plum on 2018/5/30.
//  Copyright © 2018年 plum. All rights reserved.
//

#include "Graphic.h"

typedef char VertexType;

typedef int EdgeType;

#define MAXVEX 100
#define INFINITY 65535

typedef struct {
    VertexType vexs[MAXVEX];//顶点
    EdgeType arc[MAXVEX][MAXVEX];//邻接矩阵
    int numVertexes, numEdges;//总顶点数和边数
} MGraph;


void MiniSpanTree_Prim(MGraph G) {
    int min, i, j, k;
    int adjvex[MAXVEX];
    int lowcost[MAXVEX];
    
    lowcost[0] = 0;
    adjvex[0] = 0;//关联的点
    
    for (i = 1; i < G.numEdges; i++) {
        lowcost[i] = G.arc[0][i];
        adjvex[i] = 0;
    }
    
    for (i = 1; i < G.numVertexes; i++) {
        min = INFINITY;
        j = 1; k = 0;
        while (j < G.numVertexes) {
            if (lowcost[j] != 0 && lowcost[j] < min) {
                min = lowcost[j];
                k = j;
            }
            j++;
        }
        printf("(%d, %d)", adjvex[k], k);
        lowcost[k] = 0;
        
        for (j = 1; j < G.numVertexes; j++) {
            if (lowcost[j] != 0 && G.arc[k][j] < lowcost[j]) {
                lowcost[j] = G.arc[k][j];
                adjvex[j] = k;
            }
        }
    }
}
