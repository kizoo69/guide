---
name: technical-writing
description: >
  Guidelines and standards for Korean technical writing and documentation.
  Covers English terminology usage over phonetic transliteration, plain Korean
  over obscure Hanja/OOP jargon, writing style (active, concise, concrete,
  evidence-based), and avoidance of emoticons or filler words.
  Use whenever authoring, translating, or reviewing technical documents,
  posts, comments, or explanations in Korean.
---

# Korean Technical Writing Guidelines

한국어로 기술 문서를 쓸 때 따르는 소프트웨어·프로그래밍 전문 용어와 문서 작성 규칙이다.
공통 글쓰기 규칙(쉬운 말, 능동태, 한자어·`~적`/이모지 지양 등)을 따르며, 기술 문서 작성 시 이 스킬의 지침을 얹는다.

## Terminology Standards

### 1. Use Original English Terms Instead of Korean Transliterations

한국어 음차는 이해를 돕지 못한다. 원어를 그대로 쓴다.

- [Correct] CSS, JavaScript, API, cache, class, annotation
- [Wrong] 클래스, 애노테이션

초중등 교육과정의 기초 학술 용어(수학·과학)는 관례적 한국어 표현을 쓴다. 공교육으로 개념이 자리 잡은 말은 한국어 쪽이 이해에 유리하다.

- [Correct] 벡터(vector), 행렬(matrix), 내적(inner product), 차원(dimension), 분포(distribution), 함수(function), 변수(variable), 정수(integer), 실수(real number), 회전(rotation), 격자(grid), 오차(error)

함수·변수처럼 프로그래밍 용어와 겹치는 말은 수학의 개념과 같을 때만 한국어로 쓴다.

이런 용어는 처음 쓸 때 원어를 괄호 속에 병기할 수 있다.

### 2. Use Natural Korean Instead of Obscure Chinese-Derived Terms

- [Avoid] 뜻을 가리는 한자 번역어. 원어를 쓴다.
  - 재귀(호출) → recursion, 객체 → object, 개체 → entity, 객체 지향 → object-oriented,
    상속 → inheritance, 명령줄 → command line, 기민 → agile,
    예외 → exception, 부동소수점 → floating point
- 기술 용어가 아닌 딱딱한 한자어는 쉬운 말로 바꾼다 — [Wrong] "임의로 지정할" — [Right] "마음대로 정할"

### 3. Terms That Are Already Korean

- **Established loan words**: web → 웹, file → 파일, browser → 브라우저 등 — 이미 한국어의 일부다
- **Proper translations**: font → 글꼴 — "웹 폰트"가 아니라 "웹 글꼴", "font file"이 아니라 "글꼴 파일"

### 4. Avoid the Redundant "사용자 정의" Prefix

"정의"만으로 뜻이 통한다. "사용자"는 군더더기다.

- [Correct] 함수 정의, 타입 정의, custom exception
- [Wrong] 사용자 정의 함수, 사용자 정의 타입, 사용자 정의 exception

### 5. Avoid OOP Jargon — Use Well-Defined Academic Terms Instead

OOP, 객체지향, 상속(inheritance) 같은 용어는 수학적으로 정확히 규정하기 어려운 개념을 성의 없이 뭉뚱그린 것이다. 글과 말을 모호하게 만드는 대표적인 사례이므로 피한다.

**[Avoid]**

- OOP, 객체지향, 객체지향 프로그래밍
- 상속(inheritance) — 무엇을 상속하는지 불분명
- 다형성(polymorphism) — 뜻이 너무 넓다
- 캡슐화 — 모호한 번역어
- "OOP 몇 대 원칙" 같이 학술 근거 없는 주장

**[Use]**

- **Abstract Data Type (ADT)**: 연산으로 정의되는 data type
- **Type definition**: type을 정의하는 것
- **Encapsulation**: client와 implementation을 information hiding으로 나누는 것
- **Modularization**: code를 독립된 module로 나누는 것
- **Subtyping**: type 사이의 대체 가능성 관계. Java의 `implements`가 가깝다
- **Subclassing**: class 사이의 구현 공유 관계. Java의 `extends`가 가깝다

언어 기능을 설명할 때는 그 언어의 keyword를 그대로 쓴다. "상속한다" 대신 "`extends`한다", "`implements`한다"로 쓴다.

- Java: `class`, `interface`, `extends`, `implements`, `abstract`
- Python: `class`, `def`

Java·C++·C#은 `class`(dynamic module 정의)와 type(값의 집합 정의)을 구분하지 못하므로 OOP 용어를 특히 조심한다. 굳이 "상속"을 다뤄야 하면 implementation inheritance는 subclassing(`extends`), interface inheritance는 subtyping(`implements`)으로 나눠 쓴다.

### 6. Expand Abbreviations on First Use

처음 나올 때 "CSS (Cascading Style Sheets)", "CDN (Content Delivery Network)"처럼 풀어 쓰고, 그다음부터는 약어만 쓴다.

## Writing Style

- **Be Concrete**: 실제 예시와 code를 쓴다
- **Be Evidence-Based**: 측정값, test 결과, 문서 근거로 주장을 받친다
- **Include Context**: 무엇을 했는지만이 아니라 왜 그렇게 정했는지 쓴다
- **Use Code Formatting**: code 용어는 backtick으로 감싼다 — `font-family`, `@font-face`, `pyftsubset`
- **Avoid `~적` expressions**: [Wrong] 직관적으로, 개념적으로, 수학적 — 더 구체적으로 고쳐 쓰거나 원어를 쓴다
- **Avoid unnecessary "주어진(given)"**: [Wrong] "주어진 text 다음에" — [Right] "text 다음에"
- **Avoid filler phrases**: [Wrong] 놀랍게도, 흥미롭게도, 중요한 점은, 사실상 — 사실만 바로 쓴다
- **Use simple words**: 뜻이 분명하면 쉬운 말을 쓴다 — [Wrong] 변환하다, 수행하다, 활용하다, 추가하다, 통합하다 — [Right] 바꾸다, 하다, 쓰다, 더하다, 묶다, 엮다, 짜다
- **Avoid progressive tense when simple present works**: [Wrong] "길어지고 있어요" — [Right] "길어요"
- **Avoid Emoticons and Icons**: 제목, 헤더, 목록에 이모지나 불필요한 특수문자를 넣지 않는다
