# Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.


# Example 1:


# Input: l1 = [1,2,4], l2 = [1,3,4]
# Output: [1,1,2,3,4,4]
# Example 2:

# Input: l1 = [], l2 = []
# Output: []
# Example 3:

# Input: l1 = [], l2 = [0]
# Output: [0]


# Constraints:

# The number of nodes in both lists is in the range [0, 50].
# -100 <= Node.val <= 100
# Both l1 and l2 are sorted in non-decreasing order.

# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    """
    Understand pointers
    """

    def mergeTwoLists(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = ListNode()
        cur_l1 = l1
        cur_l2 = l2
        cur = head
        while cur_l1 and cur_l2:
            if cur_l1.val <= cur_l2.val:
                cur.next = ListNode(cur_l1.val)
                cur_l1 = cur_l1.next
                cur = cur.next
            else:
                cur.next = ListNode(cur_l2.val)
                cur_l2 = cur_l2.next
                cur = cur.next
        if cur_l1:
            cur.next = cur_l1
        if cur_l2:
            cur.next = cur_l2
        return head.next


# Runtime: 40 ms, faster than 46.00% of Python3 online submissions for Merge Two Sorted Lists.
# Memory Usage: 14.4 MB, less than 30.77% of Python3 online submissions for Merge Two Sorted Lists.
