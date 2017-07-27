//
//  HerbModel.m
//  BeginnerCook
//
//  Created by zyon on 27/07/2017.
//  Copyright © 2017 Zyon. All rights reserved.
//

#import "HerbModel.h"

@implementation HerbModel

+ (NSArray <HerbModel*>*)all {
    return @[[HerbModel modelWithName:@"Basil" image:@"basil.jpg" desc:@"Basil is commonly used fresh in cooked recipes. In general, it is added at the last moment, as cooking quickly destroys the flavor. The fresh herb can be kept for a short time in plastic bags in the refrigerator, or for a longer period in the freezer, after being blanched quickly in boiling water. The dried herb also loses most of its flavor, and what little flavor remains tastes very different."],
             [HerbModel modelWithName:@"Saffron" image:@"saffron.jpg" desc:@"Saffron's aroma is often described by connoisseurs as reminiscent of metallic honey with grassy or hay-like notes, while its taste has also been noted as hay-like and sweet. Saffron also contributes a luminous yellow-orange colouring to foods. Saffron is widely used in Indian, Persian, European, Arab, and Turkish cuisines. Confectioneries and liquors also often include saffron."],
             [HerbModel modelWithName:@"Marjoram" image:@"marjorana.jpg" desc:@"Marjoram is used for seasoning soups, stews, dressings and sauce. Majorana has been scientifically proved to be beneficial in the treatment of gastric ulcer, hyperlipidemia and diabetes. Majorana hortensis herb has been used in the traditional Austrian medicine for treatment of disorders of the gastrointestinal tract and infections."],
             [HerbModel modelWithName:@"Rosemary" image:@"rosemary.jpg" desc:@"The leaves, both fresh and dried, are used in traditional Italian cuisine. They have a bitter, astringent taste and are highly aromatic, which complements a wide variety of foods. Herbal tea can be made from the leaves. When burnt, they give off a mustard-like smell and a smell similar to burning wood, which can be used to flavor foods while barbecuing. Rosemary is high in iron, calcium and vitamin B6."],
             [HerbModel modelWithName:@"Anise" image:@"anise.jpg" desc:@"Anise is sweet and very aromatic, distinguished by its characteristic flavor. The seeds, whole or ground, are used in a wide variety of regional and ethnic confectioneries, including black jelly beans, British aniseed balls, Australian humbugs, and others. The Ancient Romans often served spiced cakes with aniseseed, called mustaceoe at the end of feasts as a digestive. "],
             ];
}

+ (HerbModel *)modelWithName:(NSString *)name
                       image:(NSString *)image
                        desc:(NSString *)desc{
    HerbModel *herb = [HerbModel new];
    herb.name = name;
    herb.image = image;
    herb.desc = desc;
    return herb;
}

@end
