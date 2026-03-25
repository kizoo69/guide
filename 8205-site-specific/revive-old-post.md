<<<<<<< HEAD
# AI Job Rule: content/log/ 옛글 한 조각 되살리기
=======
# AI Job Rule: content/log/ 긴 글을 여러 부분으로 나누는 workflow
>>>>>>> 637a220 (Update site-specific AI guidelines for content log)

대상 글을 읽고 아래 순서로 작업한다. 한 번에 한 조각(part)씩 완결하여 `draft: false`로 publish한다.

### 1. 분할 계획
- 글 전체를 읽고 자연스러운 흐름 단위로 분할 안을 제시, 오빠와 확인 후 진행
- 각 조각은 별도 page bundle (`slug-part2/index.md` 등) 또는 같은 bundle 내 별도 파일
- **분할 확정 즉시 모든 조각을 `draft: true`로 먼저 생성**해두고 작업 시작 (내용 유실 방지)

### 2. Front matter 정비
<<<<<<< HEAD
- `title`: 블로그 제목 (영어 또는 현재 시각에서 다시 붙인 제목, 원제와 달어도 됨)
- `subtitle`: 부 번호 및 소제목 (예: "Part 1: 이야기의 시작")
=======
- `title`: 블로그 제목 (영어 또는 현재 시각에서 다시 붙인 제목, 원제와 달라도 됨)
- `subtitle`: 내용에 맞는 소제목
- 한 기사를 여러 조각으로 나눌 때: title에 통합 순번 사용 (예: `"Generic Programming in C++, Part 5"`), slug도 통합 순번 (예: `gp-cpp-5`). 원문 한 회분의 경계와 무관하게 전체 시리즈에서 연속 번호를 매긴다.
>>>>>>> 637a220 (Update site-specific AI guidelines for content log)
- `categories`: 현행 용어 기준으로 정리
- `description`: 서지 정보 형식 — `저자, "원제", 잡지명, 연도 월호, pp. ??–??`
- `draft: false`

### 3. 잡지 서사 숨기기
아래 유형은 `<details><summary>요약 제목</summary>…</details>`로 접는다:
- 이전 호 정오표
- 컴파일러·환경 추천 등 시대적 학습 환경 서사
- 편집 사정·연재 맥락 등 잡지 고유 서사

### 4. 원문 주석 달기
- **사실 오류·코드 버그**: 글 텍스트는 원문 그대로 두고 `{{< marginnote >}}`로 지적. 코드 버그는 직접 수정하고 marginnote로 설명 (코드는 글과 달리 원문 보존 가치가 낮음; 판단이 헛갈리면 오빠에게 확인)
- **빗나간 예측·억지 주장**: `~~취소선~~` + `{{< sidenote >}}`로 반성문
- **더 이상 사실이 아닌 것**: `{{< sidenote >}}`로 현재 상황 첨언
- **SOTA 첨언**: `{{< sidenote >}}`로 현재 표준·관행 안내

### 4a. C++ 연재 기사 코드 현대화 병기
<<<<<<< HEAD
- 원문 코드(C++98)와 현대화 코드(C++20)를 `cols` shortcode로 병기: `{{< cols lang="C++98,C++20" >}}`
=======
- 원문 코드(C++98)와 현대화 코드(C++20)를 `tabs`/`tab` shortcode로 병기: `{{< tabs >}}{{< tab "C++98" >}}…{{< /tab >}}{{< tab "C++20" >}}…{{< /tab >}}{{< /tabs >}}`
>>>>>>> 637a220 (Update site-specific AI guidelines for content log)
- C++23/26에 의미 있는 변화가 있으면 `{{< sidenote >}}`로 귀띔
- 다른 언어 기사는 원문 언어·버전 ↔ 현행 안정 버전으로 같은 방식 적용

### 5. 참고문헌
- 웹 공개본 있으면 직접 URL (섹션·페이지까지 지칭)
- 없으면 ISBN + 페이지

### 6. 용어 처리
- 어색한 번역어는 원문 보존 원칙의 예외로 현행 용어로 교체 가능
- 첫 등장에 `{{< sidenote >}}`로 원문 표현과 교체 이유 명시
- 단, 서지 정보·출판 정보 안의 원제는 반드시 원문 보존

### 7. 마무리
- 조각 끝에 다음 부 예고 텍스트만 추가 (링크는 다음 부 publish 후 돌아와서 연결)
- 작업 중인 글은 `draft: true`로 유지; 오빠 검토 후 `draft: false`로 전환
- 빌드(`./site dev`) 후 렌더링 확인
