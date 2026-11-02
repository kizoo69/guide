---
name: programming
description: >
  Core principles, conventions, and defensive standards for writing, refactoring,
  and reviewing any software program across all languages. Covers guard clauses,
  pre-condition checks, boundary defense, immutability, error context preservation,
  idempotency, and test-first practices. Use whenever designing, writing, editing,
  or reviewing code in any language.
---

# General Programming Standards

모든 언어(Python, Shell, Java, Rust, TypeScript 등)의 코드 작성, 리팩토링, 코드 리뷰 시 지켜야 할 범용 기본 원칙이다.
언어별 전용 스킬(`shell-standards`, `java-defaults` 등)은 이 공통 원칙을 바탕으로 언어 환경에 맞게 구체화한다.

## 1. Core Philosophy

1. **Defensive by Default**: 가정하지 않고 조기에 검증한다. 입력값, 의존성, 시스템 상태를 시작부에서 확인(Guard clauses)하고 실패 시 빠르게 알린다(Fail Fast).
2. **Verbose on Errors**: 에러가 났을 때는 원인과 맥락(디버깅 정보)을 충분히 보존하고 명시적으로 드러낸다. 에러를 조용히 삼키지 않는다.
3. **Immutability & Side Effect Control**: 공유 가변 상태를 피하고 불변 데이터와 순수 함수를 기본으로 둔다. 상태 변경이 필요하면 범위를 최소로 좁힌다.
4. **Idempotency & Clean-up**: 같은 연산을 반복해도 부작용이 없어야 하며, 임시 파일·메모리·연결 등 사용한 자원은 안전하게 정리한다.

## 2. Implementation Rules

1. **Pre-condition & Boundary Defense**: 함수나 모듈 진입 시 null/nil, 빈 값, 경계값, 타입 유효성을 먼저 검증하고 조기 반환(Early Return)한다.
2. **Fail-Safe Defaults**: 알 수 없는 상태나 예외 분기에서는 시스템을 안전한 기본값(Safe fallback 또는 안전한 거부)으로 둔다.
3. **Test-First & Verifiability**: 코드를 짜기 전 검증 방법(단위 테스트, 재현 케이스)을 먼저 확보하고, 테스트하기 쉬운 작은 단위로 모듈화한다.
4. **DRY & Standard Comments**: 코드가 명확히 드러내는 동작을 주석으로 중복 설명하지 않는다. 주석은 '어떻게'가 아니라 '왜(배경과 의도)'를 적는다. 한국어로 주석을 쓸 때는 `technical-writing` 스킬(`../technical-writing/SKILL.md`)의 전문 어휘·문체 규칙(영문 원어 표기, 모호한 OOP 용어 배제, 쉬운 말)을 따른다.
5. **Clear Naming**: 변수·함수·타입 이름은 축약하지 않고 역할을 명확히 드러내며, 플랫폼 표준 스타일을 따른다.
