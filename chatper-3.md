3.1.1 根据3.1.2节中的讨论，将下面的C++程序划分成正确的词素序列。哪些词应该有相关联的词法值？应该具有什么值？  
```
float limitedSquare(x) {  
    float x;  
    /*return x s-quared,but never more than 100*/  
    return (x <= -10.0||x > 10.0)?100:x*x  
}  
```  

解：
```
    <float,float>     
    <id,limitedSquare>  
    <左括号,(>   
    <id,x>  
    <右括号,)>   
    <左花括号,{>   
    <float,float>     
    <id,x>  
    <return,return>     
    <左括号,(>   
    <id,x>  
    <comparision,<=>  
    <op,->  
    <number,10.0>  
    <op,||>  
    <id,x>  
    <comparision,>>  
    <number,10.0>  
    <右括号,)>   
    <op,?>  
    <number,100>  
    <id,x>  
    <op,*>  
    <id,x>  
```

3.1.2 像HTML或XML之类的标记语言不同于传统的程序设计语言，他们要么包含有很多标点符号（标记），如HTML，要么使用由用户自己定义的标记合集，如XML。而且标记还可以带有参数。请指出如何把如下的HTML文档划分成适当的词素序列。哪些词素应该有相关联的词法值？应该具有什么样的值？
```
Here is a photo of <B>my house</B>;
<P><IMG SRC="house.gif"><BR>
See <A HREF = "morePix.html">More Picture</A>if you liked that one.</P>
```
解：
```
<literal,"Here is a photo of">  
<NodeStart,<B>>  
<literal,"my house">  
<NodeEnd,</B>>  
<NodeStart,<P>>  
<NodeStart,<IMG SRC="house.gif">>  
<NodeStart,<BR>>  
<literal,"See">  
<NodeStart,<A HREF = "morePix.html">>  
<literal,"More Picture">  
<NodeEnd,</A>>  
<literal,"if you liked that one.">  
<NodeEnd,</P>>  
```
3.3.1 对于下列语言，查询语言使用手册以确定：(i)形成各语言的输入字母表的字符集分别是什么（不包括那些只能出现在字符串或注释中的字符）？(ii)各语言的数字常量的词法形式是什么？(iii)各语言的标识符的词法形式是什么？  
(1)C (2)C++ (3)C# (4)Fortran (5)Java (6)Lisp (7)SQL

3.3.2 试描述下列正则表达式定义的语言：
1) a(a|b)*a 
2) (($\epsilon$|a)b*)*
3) (a|b)*a(a|b)(a|b)
4) a\*ba\*ba\*ba*
5) (aa|bb)*((ab|ba)(aa|bb)\*(ab|ba)(aa|bb)\*)\*

解：
1) a(a|b)*a定义的语言是字母表{a,b}上的开头和结尾均为字母a的串的集合
2) (($\epsilon$|a)b*)*定义的语言是字母表{a,b}上的集合{$\epsilon$,a,b,aa,bb,ab,aaa,bbb,abb,aaaa,bbbb,aabb,abbb,aaaaa,abbbb,bbbbb,...}，其中长度为n的串中，a的个数为n的因数或0
3) (a|b)*a(a|b)(a|b)定义的语言为字母表{a,b}上的倒数第三个字符为a的串的集合
4) a\*ba\*ba\*ba*定义的语言为字母表{a,b}上的集合{bbb,abbb,ababb,ababab,abababa,...},其中任意个a可以出现在bbb的任意b之前或之后
5) (aa|bb)*((ab|ba)(aa|bb)\*(ab|ba)(aa|bb)\*)\*
定义的语言为{$\epsilon$,aa,bb,aaaa,aabb,bbaa,bbbb,abab,abba,baab,baba,aaaaaa,aaaabb,aabbaa,aabbbb,bbaaaa,bbaabb,bbbbaa,bbbbbb,abaaab,abbbab,abaaba,abbbba,baaaab,babbab,baaaba,babbba}

3.3.3 试说明在一个长度为n的字符串中，分别有多少个
1) 前缀
2) 后缀
3) 真前缀
4) 子串
5) 子序列

解：
1) 前缀长度可以从0增加至n，每个长度下有且仅仅有一个，所以有$n+1$个前缀  
2) 后缀长度可以从0增加至n，每个长度下有且仅仅有一个，有$n+1$个后缀
3) 真前缀长度不可等于原来的字符串，也不可为$\epsilon$ ，所以有$n-1$个真前缀
4) 子串长度可以从0增加至n，设每个长度x下的子串有l(x)个，总的子串数为L,则
$$
L =
\begin{cases}
1, & n = 0 \\
1+\sum _{x=1} ^n {(n-x+1)} &,n > 1
\end{cases} 
=
\begin{cases}
1, & n = 0 \\
= 1+n^2- \sum_{x=1}^n{x}+n &,n > 1
\end{cases}\\    
=
\begin{cases}
1, & n = 0 \\
1+n^2 - \frac 1 2 {n(n+1)} + n &,n > 1
\end{cases}\\    
=
\begin{cases}
1, & n = 0 \\
1 + \frac 1 2 n(n+1)   &,n > 1
\end{cases}\\$$
5) 原字符串中每个位均可在子序列中出现，所以有$2^n$个子序列

3.3.4 很多语言都是大小写敏感的（case sensitive），因为这些语言的关键字只能有一种写法，描述这些关键字的词素的正则表达式就很简单，但是，像SQL这样的语言是大小写不敏感的（case insensitive），一个关键字既可以大写，也可以小写，还可以大小写混用。因此SQL中的关键词SELECT可以写成select、Select或sElEcT。请描述出如何用正则表达式来表示大小写不敏感的语言中的关键字。给出SQL语言的关键字select的表达式，以说明你的的思想。

解：(S|s)(E|e)(L|l)(E|e)(C|c)(T|t)

3.3.5 试写出下列语言的正则定义：
1) 包含5个元音的所有小写字母串，这些串中的元音按顺序出现
2) 所有按词典递增序排列的小写字母组成的串
3) 注释即/\*和*/之间的串，且串中没有不在双引号(")中的*/
4) 所有不重复的数位组成的串。提示：首先尝试解决只含有少量数位（比如|0，1，2|）的数位串
5) 所有最多只有一个重复数位的串
6) 所有由偶数个a和奇数个b构成的串
7) 以非正式方式表示的国际象棋的步法的集合，如p-k4或kbp×qn
8) 所有由a和b组成且不含子串abb的串
9) 所有由a和b组成且不含子序列abb的串

解：
1) $$
    letter \rightarrow [a-z]^*\\
    L \rightarrow letter \ a^+ \  letter\ e^+ \  letter \ i^+ \ letter\ o^+ \ letter\ u^+ \ letter
$$
2) 
$$ 
    L \rightarrow a^* b^* c^* d^* e^* f^* g^* h^* i^* j^* k^* l^* m^* n^* o^* p^* q^* m^* n^* o^* p^* q^* r^* s^* t^* u^* v^* w^* x^* y^* z^*
$$ 

3) 
$$
    begin \rightarrow /* \\
    end \rightarrow */  \\
    letter_digit \rightarrow [A-Za-z0-9] \\
    quote \rightarrow ' \\
    dquote \rightarrow " \\
    plus \rightarrow  + \\
    minus \rightarrow - \\
    star \rightarrow * \\
    div \rightarrow / \\
    equal \rightarrow = \\
    lparenthesis \rightarrow ( \\
    rparenthesis \rightarrow ) \\
    lbracket  \rightarrow [   \\
    rbracket  \rightarrow ]   \\
    percent \rightarrow \% \\
    dollar \rightarrow \$ \\
    L \rightarrow begin (letter_digit|'end'|quote|dquote|plus|minus|star|div|equal|lparenthesis|rparenthesis|lbracket|rbracket|!|@|_|dollar|percent|~|)^* end
$$
4) $$
    1digit0 = 0?\\
    1digit1 = 1?\\
    1digit2 = 2?\\
    1digit3 = 3?\\
    1digit4 = 4?\\
    1digit5 = 5?\\
    1digit6 = 6?\\
    1digit7 = 7?\\
    1digit8 = 8?\\
    1digit9 = 9?\\
    2digit1 = 0?1?\\
    2digit2 = 0?2?\\
    
    10digit0 \rightarrow 0?[1-9]?
$$
5) $$

$$
6) $$
    L \rightarrow ((aa)?)^*b((bb)?)^*      
$$

7) $$

$$

8) $$
    L \rightarrow  (a^*|b^*)(aba?)^*a^*
$$

9) $$
    L \rightarrow  b^*a^*b?
$$

3.3.6 为下列的字符集合写出对应的字符类。  
1) 英文字母的前10个字母（从a到j）,包括大写和小写
2) 所有小写的辅音字母的集合
3) 十六进制中的“数位”（对大于9的数位，自己决定大小写）
4) 可以出现在一个合法的英文句子后面的字符集，比如感叹号。
   
解：
1) [A-Ja-j]
2) {b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z}
3) 0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f
4) 
{
    句点：英国英语（BrE）：Full Stop；美国英语（AmE）：Period，“.”  
    问号：Question Mark，“ ? ”  
    感叹号：Exclamation Mark，“!”  
    逗号：Comma，“ , ”
    冒号：Colon，“  : ”  
    省略号：Ellipsis (众数：Ellipses)，“ ... ”  
    分号：Semicolon，“ ; ”  
    连字符：Hyphen，“ - ”  
    连接号：En Dash，“ – ”  
    破折号：Em Dash，“ — ”  
    括号：Parentheses，  
    小括号（圆括号）“ ( ) ”（parenthesis; round brackets）；  
    中括号“ [ ] ”（square brackets）；  
    大括号“ { } ”（brackets; braces）  
    引号：Quotation Marks，  
    双引号“ " ”（quote）；  
    单引号“ ' ”（single quotation marks）
    缩写及所有格符号：Apostrophe，“ ' ”
}

3.3.7 请注意这些正则表达式中的下列字符（称为运算符字符）都具有特殊的含义：  
<center>        \ " . ^ $ [ ] * + ? { } | /   </center>
如果想要使得这些特殊字符在一个串中表示它们本身，就必须取消它们的特殊含义。我们将它们放置在一个长度大于等于1且加上双引号的串中就可以取消特殊含义。例如，正则表达式"**"和字符串**匹配。我们也可以在一个运算符字符前加一个反斜线，得到这个字符的字面含义。那么，正则表达式\*\*也和串**匹配。请写出一个和字符串"\匹配的正则表达式  

解：\\"\\\\

3.3.8 在Lex中，补集字符类（complemented character class）代表该子父类中列出的字符之外的所有字符。我们将^放在开头来表示一个补集字符类。除非^在该字符类内列出，否则这个字符不在被取补的字符类中。因此，[^A-Za*z]匹配所有不是大小写字母的字符，[^\^]匹配除^（以及换行符，因为它不在任何字符类中）之外的任何字符。试证明：对于每个带有补集字符类的正则表达式，都存在一个等价的不含补集字符类的正则表达式。  
证明：任取一个带有补集字符类的正则表达式，可将其中的补集字符类替换为一个组成字符为字母表中不在该字符类中的全体字符组成的字符类，即可得到一个等价的不含补集字符类的正则表达式

3.3.9: 正则表达式r{m,n}和模式r的m到n次重复出现相匹配。例如，a{1,5}和由1~5个a组成的串匹配。试证明：对于每一个包含这种形式的重复运算符的正则表达式，都存在一个等价的不包含重复运算符的正则表达式。  
证明：
定义$S(n)$为n个S连接形成的正则表达式，其中S为任意正则表达式
1.任取一个上述这种形式的重复运算符的正则表达式r=s{m,n}，则
$$
    r=s(m)|s(m+1)|...|s(n)
$$
2.若x中不包含上述这种形式的重复运算符则问题得证，否则，对s中包含的形如b{x,y}形式的重复运算符子表达式a，可将其替换为
$$
    a=b(x)|b(x+1)|...|b(y)
$$
3.重复上述过程直至表达式中不含重复运算符，问题即可得证

3.3.10: 运算符^匹配一行的最左端，$匹配一行的最右端。运筛符^也被用作补集字符类的首字符，但是通过上下文总是能够确定它的含义。例如，^[^aeiou]*\$匹配任何一个不包
含小写元音字符的行。  
l) 你怎样判断^到底表示哪一个意思？  
2) 是否总是能够将一个包括^和\$运算符的正则表达式替换为一个等价的不包含这些运算符的正则表达式？  
解：
1) 可以规定出现在[]中第一个[之后的^代表补集字符类的首字符，出现在其余位置匹配一行的最左端
2) 不可以，匹配首行的^无法用字符标识
   
3.3.11: UNIX的shell命令sh在文件名表达式中使用下表中的运算符来描述文件名的集合。例如，文件名表达式*.o和所有以.o结束的文件名匹配；sort1.?和所有形如sort1.c的文件名匹配，其中c可以是任何字符。试问如何使用只包含并、连接和闭包运算符的正则表达式来表示sh文件名表达式？  
|表达式|匹配|例子|
|----|-----|----|
|'s'|串s的字面值|'\\'|
|\c|字符c的字面值|\\'|
|*|任何串|*.o|
|?|任何字符|sort1.?|
|[s]|s中的任何字符|sort1.[cso]|
解：
$$
    letter \rightarrow A|...|Z|a|...|z\\
    digit \rightarrow 0|...|9\\
    symbol \rightarrow \_|-|=|+|.|!|\&|(|){|}|[|]|'|"|;|:|~|\#|@|\%\\
    s \rightarrow (letter|digit|symbol)*\\
    \\'s' \rightarrow s\\
    char \rightarrow letter|digit|symbol\\
    char  \rightarrow char\\
    name \rightarrow (s|string)*\\
    ? \rightarrow char\\
    * \rightarrow name\\
    [s] \rightarrow name
$$
练习3.3.12: SQL语言支持一种不成熟的模式描述方式，其中有两个具有特殊含义的字符；下划线(_)表示任意一个字符；百分号\%表示包含0个或多个字符的串。此外，程序员还可以将任意一个字符（比如e) 定义为转义字符。那么，在_、\%或者另一个e之前加上一个e, 就使得这个字符只表示它的字面值。假设我们巳经知道哪个字符是转义字符，说明如何将任意SQL模式表示为一个正则表达式。
解：
$$
    letter \rightarrow A|...|Z|a|...|z\\
    digit \rightarrow 0|...|9\\
    symbol \rightarrow e\_|-|=|+|.|!|\&|(|){|}|[|]|'|"|;|:|~|\#|@|e\% \\
    \_ \rightarrow letter|digit|symbol\\
    \% \rightarrow (letter|digit|symbol)*\\
    SQL \rightarrow \_\%
$$