# 작업 계획

## content/log/ — 옛글 아카이브 정비

- 원문은 손대지 않고 그대로 보존
- 사실 오류, 더 이상 사실이 아닌 것, 억지 주장, 겉멋 부린 표현 → 가로줄 + 주석으로 바로잡기
- 기술 변화에 따른 현재 SOTA 첨언
- 참고문헌·자료 보강 — 웹 공개본이 있으면 직접 URL 연결, 인용이면 섹션·페이지까지 지칭 (예: §3.5.1), 없으면 ISBN + 페이지
- 잡지 서사·편집 사정 등 개인 서사 → `<details>`로 접기
- 너무 긴 글은 연재 형식으로 분할 (원문 흐름 유지), 조각마다 `draft: false`로 publish
- 주석은 sidenote 위주로 절제

## content/archive/tip/ — 교육 콘텐츠 재정비

- `.ai/pedagogical-guidelines.md` 기반으로 구조 재설계
- 긴 글 → 짧은 미션 단위(`[해보기]` `[채우기]` `[엮기]`)로 분해
- MonteCarloMethod부터 시범, 패턴 잡히면 나머지 확장
- 원본 포맷: Hugo tufte markdown (순수 markdown, 코드 블록 직접 삽입)
- 연결 코드 레포(`kizoo69/llm`, `kizoo69/programming`, `kizoo69/calculator`)는 순수 코드만 — 문서는 이 레포

## 나중 과제 (지금은 보류)

- 다국어(Java/Python/Haskell/Rust) 병렬 탭 — 해당 언어 콘텐츠 있을 때만 탭 노출, Hugo shortcode 구현 필요
- 코드 레포 submodule 연결 + 빌드 파이프라인 자동화
