//* problem link: https://leetcode.com/problems/search-in-rotated-sorted-array-ii

class Solution {
  bool search(List<int> nums, int target) {
    int low = 0;
    int high = nums.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      if (nums[mid] == target) {
        return true;
      }

      // Handle duplicates: If the values at low, mid, and high are equal,
      //we cannot determine which half is sorted. In this case
      //, we can safely move the low and high pointers inward to skip the duplicates.
      if (nums[low] == nums[mid] && nums[mid] == nums[high]) {
        low++;
        high--;
        continue;
      }

      if (nums[low] <= nums[mid]) {
        //  Left half is sorted
        if (target >= nums[low] && target < nums[mid]) {
          high = mid - 1; // Target is in the left half, adjust the high index
        } else {
          low = mid + 1; // Target is in the right half, adjust the low index
        }
      } else {
        // Right half is sorted
        if (target > nums[mid] && target <= nums[high]) {
          low = mid + 1; // Target is in the right half, adjust the low index
        } else {
          high = mid - 1; // Target is in the left half, adjust the high index
        }
      }
    }

    return false;
  }
}
