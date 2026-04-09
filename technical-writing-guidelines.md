## Korean Technical Writing Guidelines

When writing technical documentation in Korean for this site, follow these language conventions:

### Terminology Standards

1. **Use Original English Terms Instead of Korean Transliterations**
   - Principle: Korean phonetic transcriptions don't aid comprehension; use the original English term
   - [Correct]: CSS, JavaScript, API, cache, class, annotation
   - [Wrong]: 클래스 (keullaeseu), 애노테이션 (aenoteisyeon)
   - **초중등 교육과정의 기초 학술 용어(수학/과학)는 관례적 한국어 표현을 허용함**
      - [허용]: 벡터(vector), 행렬(matrix), 내적(inner product), 차원(dimension), 분포(distribution), 함수(function), 변수(variable), 정수(integer), 실수(real number), 회전(rotation), 격자(grid), 오차(error)
    - [설명]: 공교육을 통해 개념이 정착된 용어는 한국어로 기술하는 것이 직관적 이해에 유리함. 단, 최초 등장 시 필요한 경우 side note를 활용하여 원어를 병기할 수 있음.     
2. **Use Natural Korean Instead of Obscure Chinese-Derived Terms**
   - [Correct]: "마음대로 정할" (not "임의로 지정할")
   - [Avoid]: 재귀(호출), 객체, 개체, 객체 지향, 상속, 명령줄, 기민, 예외 - these Chinese-based terms obscure meaning
   - Use plain Korean or the original English term based on context and clarity
   - Exception은 "예외"로 옮기지 말고 그냥 Exception으로 쓰기
   - floating point는 "부동소수점"으로 옮기지 말고 그냥 floating point로 쓰기 ("부동"이 "움직이지 않는다"로 오해될 수 있음)

3. **Context-Dependent Technical Terms**
   - **Established loan words**: 웹 (web), 파일 (file), 브라우저(browser) 등 - already part of Korean
   - **Proper translations**: 글꼴 (font) - use "웹 글꼴" not "웹 폰트", "글꼴 파일" not "font file"
   - **Mathematical terms**: 함수 (function), 변수 (variable) - acceptable when used in mathematical context
     - When first using such terms, explain your choice in a side note (margin note or footnote)
     - Use Hugo shortcode: `{{<sidenote>}}function은 수학 용어 '함수'와 같은 개념이므로 이하 '함수'로 표기{{</sidenote>}}`

4. **Avoid Redundant "사용자 정의" Prefix**
   - [Avoid]: "사용자 정의 함수", "사용자 정의 타입", "사용자 정의 exception"
   - [Correct]: "함수 정의", "타입 정의", "custom exception"
   - Principle: "정의"만으로 의미가 충분히 전달됨. "사용자"는 불필요한 수식어

5. **Avoid OOP Jargon - Use Well-Defined Academic Terms Instead**

   OOP, 객체지향, 상속(inheritance) 같은 용어는 수학적으로 정확히 규정하기 어려운 개념을 성의 없이 뭉뚱그려 표현한 것이다. 글과 말을 모호하게 만드는 대표적인 사례이므로 피한다.

   **[Avoid] 피해야 할 모호한 용어**:
   - OOP, 객체지향, 객체지향 프로그래밍
   - 상속 (inheritance) - 무엇을 상속하는지 불분명
   - 다형성 (polymorphism) - 너무 넓은 의미
   - 캡슐화 - 모호한 번역어
   - OOP 몇 대 원칙 같이 학술 근거 없는 주장

   **[Use] 대신 쓸 학술적으로 잘 정의된 용어**:
   - **Abstract Data Type (ADT)**: 연산으로 정의되는 data type
   - **Type definition**: type을 정의하는 것
   - **Encapsulation**: client와 implementation을 information hiding으로 분리하는 것.[^encapsulation]
   - **Modularization**: code를 독립적인 module로 분리
   - **Subtyping**: type 간의 대체 가능성 관계 (Java의 `implements`가 비슷)
   - **Subclassing**: class 간의 구현 공유 관계 (Java의 `extends`가 비슷)

   **언어별 keyword 사용**:
   - 특정 언어 기능을 설명할 때는 해당 언어의 keyword를 그대로 쓴다
   - Java: `class`, `interface`, `extends`, `implements`, `abstract`
   - Python: `class`, `def`
   - "상속한다"라고 쓰지 말고 "`extends`한다", "`implements`한다"로 표현

   **주의사항**:
   - Java/C++/C# 같이 `class`(dynamic module 정의)와 type(값의 집합 정의)을 구분하지 못하는 언어에서는 특히 OOP 용어 사용에 주의
   - 굳이 "상속"을 다뤄야 하는 경우:
     - implementation inheritance → subclassing (Java의 `extends`)
     - interface inheritance → subtyping (Java의 `implements`)
     - 둘을 명확히 구분해서 쓴다

6. **Expand Abbreviations on First Use**
   - First mention: "CSS (Cascading Style Sheets)"
   - First mention: "CDN (Content Delivery Network)"
   - First mention: "API (Application Programming Interface)"
   - Subsequent uses: Use the abbreviation alone


### Writing Style

- **Be Concrete**: Use specific examples and actual code snippets
- **Be Evidence-Based**: Support claims with measurements, test results, or documentation references
- **Use Code Formatting**: Always use backticks for code terms: `font-family`, `@font-face`, `pyftsubset`
- **Include Context**: Explain why decisions were made, not just what was done
- **Plain Korean**: Prefer everyday Korean over formal Chinese-derived expressions when possible
- **Avoid `~적` expressions**: Use concrete terms instead of vague adjective forms
  - [Wrong] "직관적으로", "개념적으로", "수학적"
  - [Right] Rephrase to be more specific or use the English term
- **Avoid unnecessary "주어진(given)"**: In most contexts, "주어진" is redundant
  - [Wrong] "주어진 text 다음에"
  - [Right] "text 다음에"
- **Avoid filler phrases**: Remove unnecessary commentary that doesn't aid understanding
  - [Wrong] "놀랍게도", "흥미롭게도", "중요한 점은", "사실상" 등.
  - [Right] Just state the fact directly
- **Use simple words**: When context is clear, prefer everyday words over formal terms
  - [Wrong] "변환하다", "수행하다", "활용하다", "추가하다"
  - [Right] "바꾸다", "하다", "쓰다", "더하다"
- **Avoid progressive tense when simple present works**:
  - [Wrong] "길어지고 있어요", "복잡해지고 있어요"
  - [Right] "길어요", "복잡해요"

- **Avoid Emoticons and Icons**: Do not use emoticons (e.g., rocket, snake, sparkles) or unnecessary special characters in titles, headers, or lists.
  - [Wrong] "## 🚀 A Quick Start"
  - [Right] "## A Quick Start"

