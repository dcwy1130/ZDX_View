{\rtf1\ansi\ansicpg936\cocoartf1404\cocoasubrtf340
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset134 PingFangSC-Regular;}
{\colortbl;\red255\green255\blue255;\red170\green13\blue145;\red63\green110\blue116;\red46\green13\blue110;
\red28\green0\blue207;\red92\green38\blue153;\red100\green56\blue32;\red196\green26\blue22;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab674
\pard\tx674\pardeftab674\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \CocoaLigature0 \

\f1\fs28 \'b3\'f5\'ca\'bc\'bb\'af\'b4\'fa\'c2\'eb\'a3\'ba
\f0   
\fs24 \
	\cf2 self\cf0 .\cf3 loopScrollView\cf0  = [[\cf3 ZDXLoopScrollView\cf0  \cf4 alloc\cf0 ] \cf4 initWithFrame\cf0 :\cf4 CGRectMake\cf0 (\cf5 0\cf0 , \cf5 0\cf0 , \cf2 self\cf0 .\cf6 view\cf0 .\cf6 frame\cf0 .\cf6 size\cf0 .\cf6 width\cf0 , \cf5 200\cf0 )];\
	\cf2 self\cf0 .\cf3 loopScrollView\cf0 .\cf3 delegate\cf0  = \cf2 self\cf0 ;\
	\cf2 self\cf0 .\cf3 loopScrollView\cf0 .\cf3 dataSource\cf0  = \cf2 self\cf0 ;\
	[\cf2 self\cf0 .\cf6 view\cf0  \cf4 addSubview\cf0 :\cf2 self\cf0 .\cf3 loopScrollView\cf0 ];\
\

\f1\fs28 \'ca\'fd\'be\'dd\'d4\'b4\'ba\'cd\'b4\'fa\'c0\'ed\'b7\'bd\'b7\'a8\'b4\'fa\'c2\'eb\'a3\'ba
\fs24 \
\pard\tx674\pardeftab674\pardirnatural\partightenfactor0

\f0 \cf7 #pragma mark - LoopScrollView DataSource And Delegate\
\pard\tx674\pardeftab674\pardirnatural\partightenfactor0
\cf0 - (\cf6 NSInteger\cf0 )numberOfItemsInLoopScrollView:(\cf3 ZDXLoopScrollView\cf0  *)loopScrollView \{\
    \cf2 return\cf0  \cf5 8\cf0 ;\
\}\
\
- (\cf6 UIView\cf0  *)loopScrollView:(\cf3 ZDXLoopScrollView\cf0  *)loopScrollView viewForItemAtIndex:(\cf6 NSInteger\cf0 )index \{\
    \cf6 UIImageView\cf0  *imageView = [[\cf6 UIImageView\cf0  \cf4 alloc\cf0 ]\cf4 initWithFrame\cf0 :loopScrollView.\cf6 bounds\cf0 ];\
    imageView.\cf6 image\cf0  = [\cf6 UIImage\cf0  \cf4 imageNamed\cf0 :[\cf6 NSString\cf0  \cf4 stringWithFormat\cf0 :\cf8 @"%ld"\cf0 , (\cf2 long\cf0 )index]];\
    \cf2 return\cf0  imageView;\
\}\
\
- (\cf2 void\cf0 )loopScrollView:(\cf3 ZDXLoopScrollView\cf0  *)loopScrollView didSelectItemAtIndex:(\cf6 NSInteger\cf0 )index \{\
    \cf6 NSString\cf0  *message = [\cf6 NSString\cf0  \cf4 stringWithFormat\cf0 :\cf8 @"
\f1 \cf8 \'b5\'e3\'bb\'f7\'c1\'cb\'b5\'da
\f0 \cf8 %ld
\f1 \cf8 \'b8\'f6
\f0 \cf8 "\cf0 , index + \cf5 1\cf0 ];\
    \cf6 UIAlertController\cf0  *alertController = [\cf6 UIAlertController\cf0  \cf4 alertControllerWithTitle\cf0 :\cf8 @"
\f1 \cf8 \'ce\'c2\'dc\'b0\'cc\'e1\'d0\'d1
\f0 \cf8 "\cf0  \cf4 message\cf0 :message \cf4 preferredStyle\cf0 :\cf4 UIAlertControllerStyleAlert\cf0 ];\
    \cf6 UIAlertAction\cf0  *alertAction = [\cf6 UIAlertAction\cf0  \cf4 actionWithTitle\cf0 :\cf8 @"
\f1 \cf8 \'c8\'b7\'b6\'a8
\f0 \cf8 "\cf0  \cf4 style\cf0 :\cf4 UIAlertActionStyleDefault\cf0  \cf4 handler\cf0 :^(\cf6 UIAlertAction\cf0  * \cf2 _Nonnull\cf0  action) \{\
        \cf4 NSLog\cf0 (\cf8 @"
\f1 \cf8 \'c8\'b7\'b6\'a8
\f0 \cf8 "\cf0 );\
    \}];\
    [alertController \cf4 addAction\cf0 :alertAction];\
    [\cf2 self\cf0  \cf4 presentViewController\cf0 :alertController \cf4 animated\cf0 :\cf2 YES\cf0  \cf4 completion\cf0 :\cf2 nil\cf0 ];\
\}}