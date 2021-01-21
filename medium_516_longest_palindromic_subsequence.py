# Given a string s, find the longest palindromic subsequence's length in s. You may assume that the maximum length of s is 1000.

# Example 1:
# Input:

# "bbbab"
# Output:
# 4
# One possible longest palindromic subsequence is "bbbb".


# Example 2:
# Input:

# "cbbd"
# Output:
# 2
# One possible longest palindromic subsequence is "bb".


# Constraints:

# 1 <= s.length <= 1000
# s consists only of lowercase English letters.


# DP solution
# O(n^2)
# Be careful when using [0] * n
# this make copies of pointers


class Solution:
    def longestPalindromeSubseq(self, s: str) -> int:
        if len(s) == 0:
            return 0
        if len(s) == 1:
            return 1
        s_rev = s[::-1]
        n = len(s) + 1
        l = [[0] * n for i in range(n)]
        # for line in l:
        #     print(line)
        # print()
        for i in range(1, n):
            for j in range(1, n):
                if s[i - 1] == s_rev[j - 1]:
                    l[i][j] = l[i - 1][j - 1] + 1
                else:
                    l[i][j] = max(l[i - 1][j], l[i][j - 1])
                # for line in l:
                #     print(line)
                # print()

        return l[n - 1][n - 1]
