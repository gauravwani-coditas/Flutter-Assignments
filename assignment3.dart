import 'dart:io';

List<int> getIntersectionArray(List<int> nums1,List<int> nums2,int length1,int length2){


int lowerIndex = 0;
int higherIndex = 0;

List<int> intersectionArray = [];
  
while(lowerIndex < length1){

  if(nums1[lowerIndex] == nums2[higherIndex]){
    intersectionArray.add(nums1[lowerIndex]);
    lowerIndex++;
    higherIndex++;
  }
  else if(nums1[lowerIndex] < nums2[higherIndex]){
    lowerIndex++;
  }
  else{
    higherIndex++;
  }
}

return intersectionArray;

}

bool isAnagram(String word1,String word2){

  if(word1.length != word2.length){
    return false;
  }

  Map<String,int> word1Map = {};
  Map<String,int> word2Map = {};

  //maping values of word1
  for(int index = 0;index<word1.length;index++){
    if(word1Map.containsKey(word1[index])){
      word1Map[word1[index]] = word1Map[word1[index]]!+1;
    }
    else{
      word1Map[word1[index]] = 1;
    }
  }

  //maping values of word2
  for(int index = 0;index<word2.length;index++){
    if(word2Map.containsKey(word2[index])){
      word2Map[word2[index]] = word2Map[word2[index]]!+1;
    }
    else{
      word2Map[word2[index]] = 1;
    }
  }

  //checking mapped values
  for(int index = 0;index<word1.length;index++){
    String character = word1[index];
    if(word1Map.containsKey(character) && word2Map.containsKey(character)){
      if(word1Map[character] != word2Map[character] ){
        return false;
      }
    }
    else{
     return false;
    }
  }

  return true;
}

String getReverse(String sentence){

  List<String> sentenceArray = sentence.split(" ");

  String reversedSentence = "";
  for(int index = sentenceArray.length-1;index>=0;index--){
    reversedSentence+= sentenceArray[index];
    reversedSentence+= " ";
  }
  
  return reversedSentence.trim();

}

String getRoman(int number){

  List<String> ones = ["","I","II","III","IV","V","VI","VII","VIII","IX"];
  List<String> tens = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"];
  List<String> hundereds = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"];
  List<String> thousands = ["","M","MM","MMM"];
  //50
  //5
  //0
  String roman =  thousands[(number~/1000)] + hundereds[(number%1000)~/100] + tens[(number%100)~/10] + ones[number%10] ;
  
  return roman;

}

class TreeNode{

  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val,this.left,this.right);
    
}

void preorder(TreeNode? root){

  if(root == null){
    return;
  }
  stdout.write("${root.val} ");
  preorder(root.left);
  preorder(root.right);
}

void inorder(TreeNode? root){

  if(root == null){
    return;
  }
  preorder(root.left);
  stdout.write("${root.val} ");
  preorder(root.right);
}

void postorder(TreeNode? root){

  if(root == null){
    return;
  }
  postorder(root.left);
  postorder(root.right);
  stdout.write("${root.val} ");
}

int lengthOfLongestSubstring(String s) {

  int maxLength = 0;
  Set<String> charSet = {};
  int left = 0;

  for (int right = 0; right < s.length; right++) {
    if (!charSet.contains(s[right])) {
      charSet.add(s[right]);
      maxLength = maxLength > right - left + 1 ? maxLength : right - left + 1;
    } else {
      while (charSet.contains(s[right])) {
        charSet.remove(s[left]);
        left++;
      }
      charSet.add(s[right]);
    }
  }

  return maxLength;
}


void main() {

  //1
  print("\n--------Return Array of Squares--------\n");
  List<int> numbers = [-4, -1, 0, 3, 10];

  
  for (int index = 0; index < numbers.length; index++) {
    numbers[index] = numbers[index] * numbers[index];
  }
  

  numbers.sort();
  numbers.map((element) => element * element);
  print(numbers);

  //2
  print("\n---------Two sum----------");
  List<int> array = [2, 7, 11, 15];
  int target = 9;

  Map<int, int> frequencyMap = {};

  for (int index = 0; index < array.length; index++) {
    frequencyMap[array[index]] = index;
  }

  List<int> ans = [];

  for(int index = 0;index<array.length;index++){
    int complement = target-array[index];

    if(frequencyMap.containsKey(complement)){
      int index1 = frequencyMap[complement]!;
      ans.add(index);
      ans.add(index1);
      break;
    }
  }
  
  print(ans);

//3
print("\n---------Longest Common Prefix ----------\n");

List<String> strs = ["flower","flow","flight"];
strs.sort();

String first = strs[0];
String last = strs[strs.length-1];

String longestCommonPrefix = "";

for(int index = 0;index<first.length;index++){
  if(first[index] == last[index]){
    longestCommonPrefix+= first[index];
  }
  else{
    break;
  }
}

print("Longest Common prefix : ${longestCommonPrefix}");


//4
print("\n------Longest substring ----------\n");
stdout.write("Enter string : ");
String string = stdin.readLineSync()!;
int longestSubstringLengthWithoutRepeatingCharacters = lengthOfLongestSubstring(string);
print(longestSubstringLengthWithoutRepeatingCharacters);


// 5
print("----------Intersection of Array---------");
List<int> nums1 = [4,9,5];
List<int> nums2 =  [9,4,9,8,4];

nums1.sort();
nums2.sort();

int length1 = nums1.length;
int length2 = nums2.length;
List<int> intersectionArray = [];

if(length1 < length2){
  intersectionArray = getIntersectionArray(nums1,nums2,length1,length2); 
}
else{
  intersectionArray = getIntersectionArray(nums2, nums1, length2, length1);
}


print(intersectionArray);


//6
print("\n------------Anagram---------");
stdout.write("Enter word1 : ");
String word1 = stdin.readLineSync()!;
stdout.write("Enter word2 : ");
String word2 = stdin.readLineSync()!;

print(isAnagram(word1,word2));

//7. Tree Traversals :
print("\n---------Tree Traversals--------\n");
TreeNode root = TreeNode(1,null,null);
TreeNode node1 = TreeNode(2,null,null);
TreeNode node2 = TreeNode(3,null,null);

root.left = node1;
root.right = node2;

stdout.write("Preorder Traversal : ");
preorder(root);

stdout.write("\nInorder Traversal : ");
inorder(root);

stdout.write("\nPostorder Traversal : ");
postorder(root);




//8
//roman numbers;
print("\n----------Integer to Roman----------\n");
stdout.write("Enter number : ");
String numberString = stdin.readLineSync()!;
int realNumber = int.parse(numberString);
String romanNumber = getRoman(realNumber);
print("Roman number is : ${romanNumber}");

//9
print("\n----------Reversed Sentence---------\n");
stdout.write("Enter sentence : ");
String sentence = stdin.readLineSync()!;//"Hello World !";
String reversedSentence = getReverse(sentence);
print("Revesed sentence : ${reversedSentence}");

//10
print("\n----------Remove Duplicates---------");

stdout.write("Enter string : ");
String duplicateString = stdin.readLineSync()!;
List<String> charArray= duplicateString.split("");
charArray.sort();

String uniqueCharacterString = "";

uniqueCharacterString+= charArray[0];
for(int index = 1;index<charArray.length;index++){
  if(charArray[index] != charArray[index-1]){
    uniqueCharacterString+= charArray[index];
  }
}

print(uniqueCharacterString);



}
