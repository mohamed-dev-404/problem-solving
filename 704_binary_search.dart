//* problem link: https://leetcode.com/problems/binary-search

class Solution {
  int search(List<int> nums, int target) {
    int low = 0;
    int high = nums.length - 1;

    while (low <= high) {
      // Use integer division (/~) to find the middle index
      int mid = (low + high) ~/ 2;
      // Get the value at the middle index ( to test if it is equal to the target)
      int guess = nums[mid];

      if (guess == target) {
        return mid; // Target found, return the index
      } else if (guess < target) {
        low = mid + 1; // Target is in the right half, adjust the low index
      } else {
        high = mid - 1; // Target is in the left half, adjust the high index
      }
    }

    return -1; // Target not found, return -1
  }
}
