# 테이블 스타일 리팩터링 계획

> 상태: 분석 완료, 방향 선택 전 대기
> 작성: 2026-02-08

## 작업 배경

테마(`themes/tufte/`)의 테이블 스타일이 원본 tufte-css, booktabs, 사이트 커스텀 세 가지가 혼재.
이를 분리·정리하는 두 가지 방향을 준비한다.

## 현재 상태 (파일별 테이블 관련 코드 위치)

### 테마 파일 (themes/tufte/)

| 파일 | 줄 | 내용 | 분류 |
|------|-----|------|------|
| `assets/scss/tufte.scss:200-209` | `.table-caption` 정의 | 원본 tufte-css에 없음 | 커스텀 |
| `assets/scss/tufte.scss:249-257` | `table, .table-wrapper, .table-wrapper-small, .supertable-wrapper>p, .booktabs-wrapper { width: 55% }` | 원본은 `section > table`만. 나머지는 유령 셀렉터 | 혼재 |
| `assets/scss/tufte.scss:259-262` | `.fullwidth, table.fullwidth { width: 100% }` | 원본 동일 | 원본 |
| `assets/scss/tufte.scss:264-270` | `.table-wrapper { overflow-x: auto; table { width: 100% } }` | 원본 기반 + 내부 `table 100%` 추가 | 혼재 |
| `assets/scss/tufte.scss:451-461` | 모바일 `.table-caption` | 원본에 없음 | 커스텀 |
| `assets/scss/tufte.scss:463-467` | 모바일 `.table-wrapper, table, table.booktabs { width: 85% }` | `table.booktabs` 추가분은 커스텀 | 혼재 |
| `assets/scss/tufte.scss:469-471` | 모바일 `.table-wrapper { border-right: 1px solid #efefef }` | 원본에 없음 | 커스텀 |
| `assets/scss/general.scss:62-71` | `details` 내부 `table, .table-wrapper { width: 100% }` | HTML5 details 대응 | 커스텀 |
| `assets/scss/general.scss:92-118` | **`table:not(.lntable)` 스타일 + `table.lntable` 리셋** | **핵심 문제 영역** | 커스텀 |
| `assets/scss/components/code-highlight.scss:29-42` | `.lntable` 코드 하이라이팅 | 코드 전용 | 무관 |
| `layouts/_default/_markup/render-table.html` | 모든 MD 테이블을 `div.table-wrapper`로 감싸기 | Hugo 렌더 훅 | Hugo 통합 |

### 사이트 파일 (assets/)

| 파일 | 내용 |
|------|------|
| `assets/css/custom.scss` | 현재 `details summary` 폰트만 있음. 테이블 관련 없음 |

### 콘텐츠에서 테이블 사용하는 글 (6개)

- `content/log/1998/09/pse-cpp-stl-2/index.md`
- `content/log/2003/12/02-Two-Prefaces/index.md`
- `content/archive/tip/RegularExpressionsAndAutomata/index.md`
- `content/archive/java/draft/DynamicDispatch.md`
- `content/log/2025/11/18-Experience-Changing-Fonts.md`
- `content/log/tufte-features.md`

### 원본 tufte-css vs 현재 테마 비교 (핵심)

| 관점 | 원본 tufte-css (v1.8.0) | 현재 테마 | 정통 booktabs |
|------|------------------------|-----------|---------------|
| `th` 스타일 | 없음 (의도적 무장식) | `border-bottom: 1px solid #111` + `uppercase` | 상단 2px, 헤더 아래 1px, 하단 2px |
| 테이블 선 | 없음 | 헤더 아래 선만 | 삼선 규칙 (top/mid/bottom) |
| 너비 셀렉터 | `section > table` | `table, .table-wrapper, .booktabs-wrapper...` | — |
| `.table-wrapper` 폰트 | `sans-serif (Trebuchet MS, Gill Sans...)` | 생략 (본문 serif 유지) | — |

## 공통 작업: 커스텀 스타일을 사이트로 분리

**테마에서 빼서 `assets/css/custom.scss`로 옮겨야 할 코드:**

1. **general.scss:92-118** — `table:not(.lntable)` 전체 블록 + `table.lntable` 블록
   - `margin-top: 1.4em`, `font-size: 1.4rem`, `width: auto`
   - `border-bottom: 1px solid #111`, `text-transform: uppercase`
   - `padding-right: 0.5rem`
   - `table.lntable` 리셋
2. **general.scss:62-71** — `details` 내부 테이블 `width: 100%`

**테마에 남겨야 할 코드 (원본 tufte-css 상당):**
- `tufte.scss` 너비 규칙 (`width: 55%`, `fullwidth`, `table-wrapper`)
- `render-table.html` (Hugo 통합)

## 방향 1: tufte 원본 vs booktabs 선택 가능

### 설계

테마 config에서 테이블 스타일을 고를 수 있게 함.

### 할 일

1. **유령 셀렉터 정리** (tufte.scss)
   - `div.table-wrapper-small`, `div.supertable-wrapper>p`, `div.booktabs-wrapper` → 제거
   - 모바일 `table.booktabs` → 제거
2. **`.table-caption` 결정**
   - 원본 tufte-css에 없음. 테마 기능으로 유지할지 판단
   - 콘텐츠에서 `.table-caption` 사용 여부 확인 필요
3. **테마 설정 파라미터 추가**
   - `params.tableStyle: "tufte" | "booktabs"` (기본값: `tufte`)
4. **조건부 SCSS 파일 분리**
   - `assets/scss/tables/_tufte.scss` — 원본 스타일 (무장식, 선 없음)
   - `assets/scss/tables/_booktabs.scss` — 삼선 규칙:
     - 상단 `border-top: 2px solid #333`
     - 헤더 아래 `border-bottom: 1px solid #333`
     - 하단 `border-bottom: 2px solid #333`
     - `text-align: center` (th), `font-weight: normal`
     - `padding: 0.65ex 0.5em 0.4ex 0.5em` (th)
   - 둘 다 `table:not(.lntable)` 스코프
5. **Hugo 템플릿에서 조건부 로드**
   - `baseof.html` 또는 SCSS 엔트리포인트에서 `params.tableStyle` 읽어 분기
6. **`custom.scss`에 사이트별 오버라이드 이동**
   - `text-transform: uppercase`, `font-size: 1.4rem` 등 개인 취향
7. **검증**
   - 테이블 사용하는 6개 콘텐츠에서 양쪽 스타일 모두 확인
   - `./site dev`로 빌드 확인

## 방향 2: booktabs 채택, 나머지 정리

### 설계

booktabs 삼선 스타일을 테마 기본값으로 확정. 선택지 없이 깔끔하게.

### 할 일

1. **유령 셀렉터 제거** (tufte.scss)
   - `div.table-wrapper-small`, `div.supertable-wrapper>p`, `div.booktabs-wrapper` → 제거
   - 모바일 `table.booktabs` → 제거
2. **general.scss 테이블 블록 교체** (92-118행)
   - 현재 절충안 제거, 정통 booktabs 삼선 규칙으로 교체:
     ```scss
     table:not(.lntable) {
       border-top: 2px solid #333;
       border-bottom: 2px solid #333;
       border-collapse: collapse;
       margin-top: 1.4em;
       font-size: 1.4rem;
       width: auto;
     }
     table:not(.lntable) thead th {
       border-bottom: 1px solid #333;
       padding: 0.65ex 0.5em 0.4ex 0.5em;
       font-weight: normal;
       text-align: center;
     }
     table:not(.lntable) tbody td {
       padding: 0 0.5em;
     }
     ```
   - `text-transform: uppercase` 제거 (booktabs에 없음)
3. **사이트 커스텀 분리** → `custom.scss`
   - `text-transform: uppercase` (원하면 사이트에서)
   - `table.lntable` 리셋
   - `details` 내부 테이블 너비 오버라이드
4. **`.table-caption` 판단**
   - 콘텐츠에서 사용 여부 확인 → 미사용이면 제거
5. **`div.table-wrapper` 모바일 border-right 판단**
   - `tufte.scss:469-471` — 스크롤 힌트용. 유지/제거 결정
6. **검증**
   - 6개 테이블 콘텐츠 시각 확인
   - `./site dev`로 빌드
   - 모바일 뷰포트에서 overflow 동작 확인

## 판단 보류 사항 (다음 세션에서 결정)

- [ ] `.table-caption` 클래스가 실제 콘텐츠/shortcode에서 쓰이는지 확인
- [ ] 방향 1 vs 2 중 어느 것으로 갈지 최종 결정
- [ ] `render-table.html`에 booktabs 클래스를 추가할지 (방향 1에서 스타일 전환용)
- [ ] `tufte.scss:264-270`의 `.table-wrapper table { width: 100% }`와 `general.scss`의 `width: auto` 충돌 해소
