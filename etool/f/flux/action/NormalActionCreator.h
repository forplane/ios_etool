//
//  NormalActionCreator.h
//  Pods
//
//  Created by jpmac on 2017/1/9.
//
//

#import "ActionsCreatorFactory.h"

@interface NormalActionCreator : ActionsCreatorFactory


+(instancetype)get;

/**
 * 不需要携带数据，不需要操作类型；只适用于一个tag中，单一的post操作
 */
-(void)post:(NSString*)__tag;

/**
 * 不需要携带数据，需要操作类型；适用于一个tag中，有2个以上的post操作
 */
-(void)post:(NSString*)__tag opeType:(int)__opetype;

/**
 * 需要携带数据，不需要操作类型；只适用于一个tag中，单一的post操作
 */
-(void)post:(NSString*)__tag obj:(id)__obj;

/**
 * 携带数据，需要操作类型；适用于一个tag中，有2个以上的post操作
 * @param __tag   标签
 * @param __opetype  操作类型
 * @param __obj    携带数据
 */
-(void)post:(NSString*)__tag opeType:(int)__opetype obj:(id)__obj;
@end
