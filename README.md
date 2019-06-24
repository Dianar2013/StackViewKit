
###一、PartView的所有属性

| 顺序 | 属性 | 类型 | 取值 | 含义 | json代码 |
| -------- | -------- | -------- | -------- | -------- | -------- |
| 1、 | width | float | | 宽度 |
| 2、 | height | float | |  高度 |
| 5、 | partAlignment | string |center\\right\\left\\top\\bottom |   |
| 6、 | alignmentMargin | float | | 表示与assembleView的间距|
| 7、 | hugging | string |fit\\low\\high\\reqeired| 抗拉伸优先级越高越不容被拉伸|
| 8、 | compression | string |fit\\low\\high\\reqeired|  抗压缩优先级越高越不容被压缩|
| 9、 | minWidth | float ||最小宽度|
| 10、 | maxWidth | float ||最大宽度|
| 11、 | backColor | UIColor ||背景颜色|
| 12、 | backColorHexString | string ||背景色16进制值| 
| 13、 | backPaddingHorizontal | float ||partView与背景的水平距离|
| 14、 | backPaddingVertical | float ||partView与背景的垂直距离|
| 15、 | backBorderColor | UIColor ||背景的边框颜色|
| 16、 | backBorderColorHexString | string ||背景边框色16进制值|
| 16、 | backBorderWidth | float ||背景边框宽度|
| 17、 | backBorderRadius | float ||背景图圆角|
| 18、 | button | UIButton ||按钮|
| 19、 | buttonHighlightColor | UIColord ||按钮选择颜色|
| 20、 | text | string ||标签文本内容|
| 21、 | fontSize | float ||标签文本字体大小|
| 22、 | font | UIFont ||标签文本字号|
| 23、 | color | UIColor ||标签文本颜色|
| 24、 | colorHexString |  string ||标签文本颜色16进制值|
| 25、 | imageName |  string ||图片路径名称|
| 26、 | image |  UIImage ||图片对象|
| 27、 | imageUrl |  string ||图片网络下载路径|
 
###二、AssembleView 属性

| 顺序 | 属性 | 类型 | 取值 | 含义 | json代码|
| -------- | -------- | -------- | -------- | -------- | -------- |
| 1、 | arrange | 整型枚举 | Horizontal\\Vertical| 水平排布\\垂直排布 |h\\v|
| 2、 | alignment | 整型枚举 | Center\\Left\\Right\\Top\\Bottom| 居中\\靠左\\靠右\\靠顶部\\靠底部| c\\l\\r\\t\\b|
| 3、 | padding | float | | 每个partView默认间距|
| 4、 | topMargin | float | | AssembleView 顶部间距|
| 5、 | bottomMargin | float | | AssembleView 底部间距|
| 6、 | leftMargin | float | | AssembleView 左边间距|
| 7、 | rightMargin | float | | AssembleView 右边边间距|

###三、使用实例
#### 1、json 配置

```
{
    "type": "MultiPolygon",
    "ads": [
        {
        "postion": 1201,
        "type": "新大图",
        "assemble": {
            "arrange": "vertical",
            "alignment": "left",
            "padding": 10,
            "leftMargin":10,
            "rightMargin":10,
            "topMargin":10,
            "bottomMargin":10,
            "partview": [
                {
                    "assemble":{
                        "arrange":"horizontal",
                        "alignment":"center",
                        "padding":10,
                        "partAlignment":"right",
                        "partview": [
                            {
                                "imageName": "twochilid.png",
                                "width": 36,
                                "height": 36
                            },
                            {
                                "assemble":{
                                    "arrange":"vertical",
                                    "alignment":"left",
                                    "padding":5,
                                    "partview": [
                                        {
                                            "text": "神州专车",
                                            "fontsize": 14,
                                            "color": "ABCD00"
                                        },
                                        {
                                            "text": "广告",
                                            "fontsize": 12,
                                            "color": "ABCD00"
                                        }
                                    ]
                                }
                            },
                            {
                                "imageName": "ic_ad_close.png",
                                "width": 18,
                                "height": 18
                            }
                        ]
                    }
                },
                {
                    "text": "说得好打发聊得来的glad漏斗和阿丹近阶段看南大街的目的担担面，m大米的满满的面对面你我出家门是内容有投南瓜谷拉黄飞鸿凤凰军事，aLFJDJHGJFNdhd耷拉了的回调廉价劳动力萨哈；蛋糕盒；again；打过架；",
                    "fontsize": 12,
                    "color": "00000",
                    "numberOfLines":2
                    
                },
               {
                "imageName": "twochilid.png",
                "partAlignment":"right"
               }
            ]
        }
    },
        {
            "postion": 1201,
            "type": "三图",
            "assemble": {
                "arrange": "vertical",
                "alignment": "top",
                "padding": 10,
                "leftMargin":10,
                "rightMargin":10,
                "topMargin":10,
                "bottomMargin":10,
                "partview": [
                    {
                        "text": "说得好打发聊得来的glad漏斗和阿丹近阶段看南大街的目的担担面，m大米的满满的面对面你我出家门是内容有投南瓜谷拉黄飞鸿凤凰军事，aLFJDJHGJFNdhd耷拉了的回调廉价劳动力萨哈；蛋糕盒；again；打过架；",
                        "fontsize": 12,
                        "color": "00000",
                        "numberOfLines":2
                        
                    },
                    {
                        "assemble": {
                            "arrange": "horizontal",
                            "alignment": "center",
                            "partAlignment":"right",
                            "padding":5,
                            "partview":[
                                {
                                    "imageName": "twochilid.png",
                                    "width": 110,
                                    "height": 60
                                },
                                {
                                    "imageName": "twochilid.png",
                                    "width": 110,
                                    "height": 60
                                },
                                {
                                    "imageName": "twochilid.png",
                                    "width": 110,
                                    "height": 60
                                }
                            ]
                        }
                    },
                    {
                        "assemble": {
                            "arrange": "horizontal",
                            "alignment": "center",
                            "partAlignment":"right",
                            "padding":5,
                            "partview":[
                                {
                                    "text": "女人通",
                                    "fontsize": 12,
                                    "color": "00000"
                                },
                                
                                {
                                    "text": "广告",
                                    "fontsize": 12,
                                    "color": "00000"
                                },
                                {
                                    "imageName": "ic_ad_close.png",
                                    "width": 9,
                                    "height": 9
                                }
                            ]
                        }
                    }
                ]
            }
        },
        {
            "postion": 1201,
            "type": "图文",
            "assemble": {
                "arrange": "horizontal",
                "alignment": "center",
                "padding": 10,
                "leftMargin":10,
                "rightMargin":10,
                "topMargin":10,
                "bottomMargin":10,
                "partview": [
                    {
                        "assemble":{
                            "arrange":"vertical",
                            "alignment":"top",
                            "padding":5,
                            "height": 90,
                            "partview": [
                                {
                                    "text": "我是广告标题呀安懊恼了国家来的噶",
                                    "fontsize": 14,
                                    "color": "ABCD00",
                                    "numberOfLines":2,
                                    "horizontalAlignment":"left",
                                    "verticalAlignment":"top",
                                    "hugging":"fit"
                                },
                                {
                                    "assemble": {
                                        "arrange": "horizontal",
                                        "alignment": "center",
                                        "partAlignment":"right",
                                        "padding":8,
                                        "partview":[
                                            {
                                                "text": "女人通",
                                                "fontsize": 12,
                                                "color": "00000",
                                                "hugging":"required"
                                            },
                                            {
                                                "text": "广告",
                                                "fontsize": 12,
                                                "color": "ABCD00"
                                                
                                            },
                                            {
                                                "imageName": "ic_ad_close.png",
                                                "width": 9,
                                                "height": 9
                                            }
                                        ]
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "imageName": "twochilid.png",
                        "width": 120,
                        "height": 90
                    }
                ]
            }
        }
        
    ]
}
```

#### 2、代码使用方式

```

- (void)setupAdWithDict:(NSDictionary*)adDict
{
    UIView *view = [IMYAdAssembleView createViewWithDict:adDict];
    
    _contentView = [[UIView alloc] init];
//    [self es_addSubviews];
    [_contentView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
    
    CGSize headerSize = [self.contentView  systemLayoutSizeFittingSize:CGSizeMake(self.view.bounds.size.width - 20, 0) withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityDefaultLow];
    _contentView.frame = CGRectMake(10,80,headerSize.width,headerSize.height);
 
    [self.view addSubview:_contentView];
    _contentView.layer.borderColor = [UIColor redColor].CGColor;
    _contentView.layer.borderWidth = 1.0;
    
    NSLog(@"adDict=%@",adDict);
}
```



