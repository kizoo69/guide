# AI Job Rule: Hugo 사이트 빌드 및 시험

- **Hugo extended >= 0.134.0** 필수 (table render hook 등 최신 템플릿 API 사용)
1. `./site` 또는 `./site dev`로 빌드 (`hugo` 직접 실행 금지)
2. `./site view`로 실제 사이트처럼 시험
3. 실행 전 `pgrep hugo`와 포트 1313 사용 여부 확인 → 이미 실행 중이면 새로 띄우지 않음
4. 불가피하게 새 인스턴스를 띄우면 (1313 외 포트 사용) → 시험 후 해당 프로세스 종료까지 마무리
