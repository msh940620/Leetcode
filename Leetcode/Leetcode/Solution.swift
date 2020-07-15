//
//  main.swift
//  Leetcode
//
//  Created by Reminisce on 2020/7/15.
//  Copyright © 2020 Reminsice. All rights reserved.
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    // 96. 不同的二叉搜索树
    func numTrees(_ n: Int) -> Int {
        var array = [1,1];
        if (n > 1) {
            for index in 2 ... n {
                for subIndex in 1 ... index {
                    if (array.count < index + 1) {
                        array.append(array[subIndex-1] * array[index-subIndex]);
                    } else {
                        array[index] += array[subIndex-1] * array[index-subIndex];
                    }
                }
            }
        }
        return array[n];
    }
    
    // 2. 两数相加
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1Array = [Int]();
        if var teamNode = l1 {
            l1Array.append(teamNode.val);
            while teamNode.next != nil {
                teamNode = teamNode.next!;
                l1Array.append(teamNode.val);
            }
        }
        var l2Array = [Int]();
        if var teamNode = l2 {
            l2Array.append(teamNode.val);
            while teamNode.next != nil {
                teamNode = teamNode.next!;
                l2Array.append(teamNode.val);
            }
        }
        var rootNode : ListNode?;
        var currentNode : ListNode?;
        let maxLength = l1Array.count > l2Array.count ? l1Array.count : l2Array.count;
        var carry = false;
        for index in 0...maxLength {
            if (index == maxLength && !carry) {
                break;
            }
            let i = l1Array.count > index ? l1Array[index] : 0;
            let j = l2Array.count > index ? l2Array[index] : 0;
            var sum = i + j;
            if (carry) {
                sum += 1;
                carry = false;
            }
            if (sum >= 10) {
                carry = true;
            }
            let node = ListNode.init(sum % 10);
            if let lastNode = currentNode {
                lastNode.next = node;
            } else {
                rootNode = node;
            }
            currentNode = node;
        }
        return rootNode;
    }
}
