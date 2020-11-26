"""
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', 
determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
 

Example 1:

Input: s = "()"
Output: true
Example 2:

Input: s = "()[]{}"
Output: true
Example 3:

Input: s = "(]"
Output: false
Example 4:

Input: s = "([)]"
Output: false
Example 5:

Input: s = "{[]}"
Output: true
 

Constraints:

1 <= s.length <= 104
s consists of parentheses only '()[]{}'.
"""

class Solution:
	def isValid(self, s: str) -> bool:
		if len(s) % 2 != 0:
			return False
		
		d = {
			')': '(', 
			'}': '{', 
			']': '['
		}

		l = [s[0]] # stack
		for i in range(1, len(s)):
			if len(l) > 0 and l[-1] == d[s[i]]: # match
				l.pop()
			else:
				l.append(s[i])
		return len(l) == 0

def main() -> None:
	sol = Solution()
	assert sol.isValid("()")
	assert not sol.isValid("()[]{}")
	assert not sol.isValid("(]")
	assert not sol.isValid("([)]")
	assert sol.isValid("{[]}")


'''
Runtime: 52 ms, faster than 6.54% of Python3 online submissions for Valid Parentheses.
Memory Usage: 14.3 MB, less than 18.57% of Python3 online submissions for Valid Parentheses.
'''















