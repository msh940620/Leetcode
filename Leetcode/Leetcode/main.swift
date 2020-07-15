//
//  main.swift
//  111
//
//  Created by Reminisce on 2020/7/15.
//  Copyright © 2020 Reminsice. All rights reserved.
//

import Foundation

let object = Solution();

var rootNode : ListNode?;
var currentNode : ListNode?;
var sum = "342";
for index in 0..<sum.count {
    let indexStart = sum.index(sum.endIndex, offsetBy: -1 - index)
    let indexEnd = sum.index(sum.endIndex, offsetBy: -index)
    let node = ListNode.init(Int(sum[indexStart..<indexEnd]) ?? 0);
    if (index != 0) {
        currentNode!.next = node;
    } else {
        rootNode = node;
    }
    currentNode = node;
}

sum = "465";
var rootNode2 : ListNode?;
for index in 0..<sum.count {
    let indexStart = sum.index(sum.endIndex, offsetBy: -1 - index)
    let indexEnd = sum.index(sum.endIndex, offsetBy: -index)
    let node = ListNode.init(Int(sum[indexStart..<indexEnd]) ?? 0);
    if (index != 0) {
        currentNode!.next = node;
    } else {
        rootNode2 = node;
    }
    currentNode = node;
}

var result = object.addTwoNumbers(rootNode, rootNode2);

print(result);
