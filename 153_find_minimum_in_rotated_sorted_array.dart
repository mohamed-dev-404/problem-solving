//* problem link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array

class Solution {
  int findMin(List<int> nums) {
    int low = 0;
    int high = (nums.length) - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      //when remaining two elements only (pivot and min), return the minimum of the two
      if ((low + 1) == high && nums[low] > nums[high]) {
        return nums[high];
      } else if ((low + 1) == high && nums[low] < nums[high]) {
        return nums[low];
      }

      if (nums[low] <= nums[mid]) {
        // left side sorted
        if (nums[mid] <= nums[high]) {
          // right side sorted too (first element is the minimum)
          return nums[low];
        }
        low = mid + 1; // left side only sorted, so pivot must be in right side
      } else {
        // right side only sorted, so pivot must be in left side
        high = mid;
      }
    }

    return -1;
  }
}
