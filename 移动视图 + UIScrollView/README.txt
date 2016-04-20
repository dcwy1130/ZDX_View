{\rtf1\ansi\ansicpg936\cocoartf1404\cocoasubrtf340
{\fonttbl\f0\fnil\fcharset134 STHeitiSC-Light;\f1\fnil\fcharset0 Menlo-Regular;\f2\fnil\fcharset134 PingFangSC-Regular;
}
{\colortbl;\red255\green255\blue255;\red103\green29\blue0;\red0\green116\blue0;\red92\green38\blue153;
\red46\green13\blue110;\red170\green13\blue145;\red28\green0\blue207;\red196\green26\blue22;\red63\green110\blue116;
\red38\green71\blue75;}
\paperw11900\paperh16840\margl1440\margr1440\vieww19720\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs36 \cf2 \'d3\'a6\'d3\'c3\'ca\'be\'c0\'fd\'a3\'ba
\fs28 \cf0 \
\pard\tx674\pardeftab674\pardirnatural\partightenfactor0

\f1\fs26 \cf0 \CocoaLigature0     \cf3 // 
\f2 \'cc\'ed\'bc\'d3
\f1 N
\f2 \'b8\'f6\'c4\'da\'c8\'dd\'ca\'d3\'cd\'bc
\f1 \cf0 \
    \cf4 NSMutableArray\cf0  *tempAry = [\cf4 NSMutableArray\cf0  \cf5 array\cf0 ];\
    \cf6 for\cf0  (\cf6 int\cf0  i = \cf7 0\cf0 ; i < \cf7 5\cf0 ; i ++) \{\
        \cf4 UITableView\cf0  *tableView = [[\cf4 UITableView\cf0  \cf5 alloc\cf0 ] \cf5 init\cf0 ];\
        [tableView \cf5 registerClass\cf0 :[\cf4 UITableViewCell\cf0  \cf5 class\cf0 ] \cf5 forCellReuseIdentifier\cf0 :\cf8 @"CELL"\cf0 ];\
        tableView.\cf4 delegate\cf0  = \cf6 self\cf0 ;\
        tableView.\cf4 dataSource\cf0  = \cf6 self\cf0 ;\
        [tempAry \cf5 addObject\cf0 :tableView];\
    \}\
    \cf9 ZDXMoveAndScrollView\cf0  *moveAndScrollView = [[\cf9 ZDXMoveAndScrollView\cf0  \cf5 alloc\cf0 ] \cf10 initWithFrame\cf0 :\cf6 self\cf0 .\cf4 view\cf0 .\cf4 bounds\cf0 \
                                                                    \cf10 buttons\cf0 :\cf7 @[\cf8 @"
\f2 \'c8\'ab\'b2\'bf
\f1 "\cf0 , \cf8 @"
\f2 \'b4\'fd\'b8\'b6\'bf\'ee
\f1 "\cf0 , \cf8 @"
\f2 \'b4\'fd\'b7\'a2\'bb\'f5
\f1 "\cf0 , \cf8 @"
\f2 \'b4\'fd\'ca\'d5\'bb\'f5
\f1 "\cf0 , \cf8 @"
\f2 \'b4\'fd\'c6\'c0\'bc\'db
\f1 "\cf7 ]\cf0 \
                                                               \cf10 contentViews\cf0 :tempAry];\
    \
	moveAndScrollView.\cf9 delegate\cf0  = \cf6 self\cf0 ;\
    [\cf6 self\cf0 .\cf4 view\cf0  \cf5 addSubview\cf0 :moveAndScrollView];\
	// 
\f2 \'b4\'fa\'b1\'ed\'bf\'d8\'d6\'c6\'d1\'a1\'d6\'d0\'c4\'b3\'d0\'d0
\f1 \
	[moveAndScrollView \cf10 chooseButtonAtIndex\cf0 :\cf7 3\cf0 ];}