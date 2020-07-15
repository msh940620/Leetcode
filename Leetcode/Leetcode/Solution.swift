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
        var node1 = l1;
        var node2 = l2;
        var rootNode : ListNode?;
        var currentNode : ListNode?;
        var carry = false;
        while node1 != nil || node2 != nil || carry {
            var i = node1?.val
            var j = node2?.val
            node1 = node1?.next;
            node2 = node2?.next;
            if (i == nil) {
                i = 0;
            }
            if (j == nil) {
                j = 0;
            }
            var sum = i! + j!;
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
