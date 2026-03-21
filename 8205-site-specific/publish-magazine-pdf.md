# AI Job Rule: 잡지 기고문 PDF를 블로그 글로 옮기기

`publish/` 디렉토리에 있는 잡지 기고문 PDF를 `content/log/`로 옮기는 작업 흐름:

1. **디렉토리 생성**: `content/log/YYYY/MM/slug/` 형식으로 Hugo page bundle 디렉토리 생성
2. **PDF 복사**: 원본 PDF를 디렉토리에 복사 (예: `article-YYYY-MM-magazine.pdf`)
3. **이미지 추출**: `pdftoppm -png -r 150 source.pdf magazine-layout` 명령으로 페이지별 이미지 추출
4. **index.md 작성**:
   - Front matter: `title`, `author`, `date`, `categories`, `description`, `meta: true`
   - `<details>` 태그로 출판 정보 감싸기 (잡지명, 호수)
   - `{{< figure type="full" link="pdf파일명" >}}`로 잡지 레이아웃 이미지 표시
   - 저자 소개는 `{{< marginnote >}}`
   - 부연 설명은 `{{< sidenote >}}`
   - 인용문은 `{{< blockquote author="" cite="" >}}`
5. PDF 텍스트 추출이 필요하면 `pdftotext -layout` 사용 (다단 레이아웃은 수동 정리 필요)
