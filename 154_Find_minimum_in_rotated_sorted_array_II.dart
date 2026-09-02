//* problem link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii

class Solution {
  int findMin(List<int> nums) {
    int low = 0;
    int high = nums.length - 1;

    while (low < high) {
      int mid = (low + high) ~/ 2;

      if (nums[mid] > nums[high]) {
        // min in the right of mid
        low = mid + 1;
      } else if (nums[mid] < nums[high]) {
        // min is at mid or to the left
        high = mid;
      } else {
        // nums[mid] == nums[high] (Duplicates)
        high--;
      }
    }

    return nums[low];
  }
}
