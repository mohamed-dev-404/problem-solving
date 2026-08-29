//* problem link: https://leetcode.com/problems/search-suggestions-system

class Solution {
  List<List<String>> suggestedProducts(
    List<String> products,
    String searchWord,
  ) {
    // Sort products lexicographically so the first 3 matches are always the lexicographically smallest suggestions.
    products.sort();

    List<List<String>> suggestedProductsResult = [];

    // Build the prefix one character at a time.
    for (var i = 0; i < searchWord.length; i++) {
      String prefix = searchWord.substring(0, i + 1);
      int suggestionCount = 0;

      // Find up to 3 products that start with the current prefix.
      List<String> suggest = products.where((element) {
        if (suggestionCount < 3 && element.startsWith(prefix)) {
          suggestionCount++;
          return true;
        }

        return false;
      }).toList();

      suggestedProductsResult.add(suggest);
    }

    return suggestedProductsResult;
  }
}
