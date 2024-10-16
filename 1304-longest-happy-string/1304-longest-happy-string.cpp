class Solution {
public:
    string longestDiverseString(int a, int b, int c) {
        int currA = 0, currB = 0, currC = 0;
        int maxLen = a + b + c, i = 0;
        string result; 
        while (i < maxLen) {
            if ((currA != 2 && a >= b && a >= c) || (a > 0 && (currB == 2 || currC == 2))) {
                result += 'a';
                currA++;
                currB = 0;
                currC = 0;
                a--;
            } 
            else if ((currB != 2 && b >= a && b >= c) || (b > 0 && (currA == 2 || currC == 2))) {
                result += 'b';
                currB++;
                currA = 0;
                currC = 0;
                b--;
            } 
            else if ((currC != 2 && c >= a && c >= b) || (c > 0 && (currA == 2 || currB == 2))) {
                result += 'c';
                currC++;
                currA = 0;
                currB = 0;
                c--;
            }
            i++;
        }
        
        return result;
    }
};


// Intuition & Approch
// lets keep track the consecutive count for a, b and c , say they are currA =0, currB =0, currC=0 initially.

// now lets say we gonna construct our String using 'a' , 'b', anc 'c'.
// also as per question the variable a, b and c has total allowed repeation in the string respectivly.

// our string can have max length maxLen = a+b+c only.
// to add a char while we are constructing a string :-

// to add a character lets 'a' character we have to check :-

// point-1:-
// let say a has highest value ==> a>=b and a>=c and suppose the string still doesn't have two consecutive 'a'==> currA!=2

// ==> means we can add this character 'a' to string without any violation ====> agree??

// for example ===> a =5, b=3, c=2 and current String ==> bca
// at this point currA=1, currB = 1 , currC = 1
// ===> here i can add my character 'a'
// =====> bcaa ===> now i need to update my varibales===>
// currB = 0 , currC = 0 ==> why?? ===> because now when we gonna add new 'b' or 'c' there is no consecutive count for 'b' or 'c' as they will start from zero.

// ===> currA ===> currA + 1 => 1 + 1 = 2
// a = a-1 ===> 5-1 = 4
// because we just added 'a' so remaining allowed count would decrease by 1.

// Point-2:-
// if point-1 condition is not matched means a is not greatest or a already occured 2 times consecutively ==> currA==2 then we can not proceed then what is another condition to add character 'a' to stringBuilder
// ??

// so there is another condtion ===> if a>0 and either currB==2 or currC==2 ==> if we have value of a is still have non-zero value and either 'b' or 'c' has appeared 2 consecutive times ===> means we can still add character 'a'

// so in both points 1 or 2 if anyone of them matches we need to update the variables like this

// a--, currA++, currB=0, currC=0

// so same thing applies to add charactwer 'b' and 'c' as well so we would look for these conditions using else - if becasue at any point of time one of them would fulfill the condition and keep on checking this till our while loop executes maxLentimes.

// finally return the string that we constructed.