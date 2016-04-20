{\rtf1\ansi\ansicpg936\cocoartf1404\cocoasubrtf340
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset134 PingFangSC-Regular;}
{\colortbl;\red255\green255\blue255;\red170\green13\blue145;\red63\green110\blue116;\red46\green13\blue110;
\red92\green38\blue153;\red38\green71\blue75;\red28\green0\blue207;\red0\green116\blue0;\red196\green26\blue22;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab674
\pard\tx674\pardeftab674\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \CocoaLigature0 \

\f1\fs28 \'b3\'f5\'ca\'bc\'bb\'af\'b4\'fa\'c2\'eb\'a3\'ba
\f0   
\fs24 \
	\cf2 self\cf0 .\cf3 popView\cf0  = [[\cf3 ZDXPopupView\cf0  \cf4 alloc\cf0 ] \cf4 initWithFrame\cf0 :\cf2 self\cf0 .\cf5 view\cf0 .\cf5 bounds\cf0 ];\
    \cf2 self\cf0 .\cf3 popView\cf0 .\cf3 animationOptions\cf0  = \cf6 ZDXPopupViewAnimationOptionsFromBottom\cf0 ;\
    \cf2 self\cf0 .\cf3 popView\cf0 .\cf5 backgroundColor\cf0  = [\cf5 UIColor\cf0  \cf4 colorWithWhite\cf0 :\cf7 0.000\cf0  \cf4 alpha\cf0 :\cf7 0.400\cf0 ];\
\cf8 //    self.popView.duration = 0.3;\cf0 \
    \cf2 self\cf0 .\cf3 popView\cf0 .\cf3 dataSource\cf0  = \cf2 self\cf0 ;\
\

\f1\fs28 \'ca\'fd\'be\'dd\'d4\'b4\'b4\'fa\'c2\'eb\'a3\'ba
\fs24 \
	
\f0 - (\cf5 UIView\cf0  *)viewForContentInPopupView:(\cf3 ZDXPopupView\cf0  *)popupVie \{\
    \cf5 UIView\cf0  *v = [[\cf5 UIView\cf0  \cf4 alloc\cf0 ] \cf4 initWithFrame\cf0 :\cf4 CGRectMake\cf0 (\cf7 100\cf0 , \cf7 200\cf0 , \cf7 200\cf0 , \cf7 200\cf0 )];\
    v.\cf5 backgroundColor\cf0  = [\cf5 UIColor\cf0  \cf4 yellowColor\cf0 ];\
    \cf8 //    [v addTarget:self action:@selector(test3) forControlEvents:UIControlEventTouchUpInside];\cf0 \
    \
    \cf5 UIButton\cf0  *b1 = [[\cf5 UIButton\cf0  \cf4 alloc\cf0 ] \cf4 initWithFrame\cf0 :\cf4 CGRectMake\cf0 (\cf7 0\cf0 , \cf7 0\cf0 , \cf7 200\cf0 , \cf7 100\cf0 )];\
    b1.\cf5 backgroundColor\cf0  = [\cf5 UIColor\cf0  \cf4 greenColor\cf0 ];\
    [b1 \cf4 setTitle\cf0 :\cf9 @"Look"\cf0  \cf4 forState\cf0 :\cf4 UIControlStateNormal\cf0 ];\
    b1.\cf5 tag\cf0  = \cf7 1000\cf0 ;\
    [v \cf4 addSubview\cf0 :b1];\
    [b1 \cf4 addTarget\cf0 :\cf2 self\cf0  \cf4 action\cf0 :\cf2 @selector\cf0 (test5:) \cf4 forControlEvents\cf0 :\cf4 UIControlEventTouchUpInside\cf0 ];\
    \
    \cf5 UIButton\cf0  *b2 = [[\cf5 UIButton\cf0  \cf4 alloc\cf0 ] \cf4 initWithFrame\cf0 :\cf4 CGRectMake\cf0 (\cf7 0\cf0 , \cf7 100\cf0 , \cf7 200\cf0 , \cf7 100\cf0 )];\
    b2.\cf5 backgroundColor\cf0  = [\cf5 UIColor\cf0  \cf4 redColor\cf0 ];\
    [b2 \cf4 setTitle\cf0 :\cf9 @"Here"\cf0  \cf4 forState\cf0 :\cf4 UIControlStateNormal\cf0 ];\
    b2.\cf5 tag\cf0  = \cf7 1001\cf0 ;\
    [v \cf4 addSubview\cf0 :b2];\
    [b2 \cf4 addTarget\cf0 :\cf2 self\cf0  \cf4 action\cf0 :\cf2 @selector\cf0 (test5:) \cf4 forControlEvents\cf0 :\cf4 UIControlEventTouchUpInside\cf0 ];\
    \
    \cf2 return\cf0  v;\
\}\
\

\f1\fs28 \'cf\'d4\'ca\'be\'ca\'d3\'cd\'bc\'b4\'fa\'c2\'eb\'a3\'ba
\f0\fs24 \
    [\cf2 self\cf0 .\cf3 popView\cf0  \cf6 show\cf0 ];}