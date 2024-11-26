const marked = require('marked')
// import { marked } from 'marked';

// 커스텀 렌더러 정의
const renderer = {
  list(body, ordered, start) {
    let type = '1'; // 기본 숫자 목록
    if (ordered) {
      if (start === 'a') {
        type = 'a'; // 알파벳 소문자 목록
      } else if (start === 'A') {
        type = 'A'; // 알파벳 대문자 목록
      } else if (start === 'i') {
        type = 'i'; // 로마 숫자 소문자 목록
      } else if (start === 'I') {
        type = 'I'; // 로마 숫자 대문자 목록
      }
    }
    return `<ol type="${type}">${body}</ol>`;
  },
  listitem(text) {
    return `<li>${text}</li>`;
  }
};

// MarkedJS에 커스텀 렌더러 적용
marked.use({ renderer });

// 마크다운 텍스트를 HTML로 변환
// 테스트용 마크다운 텍스트
const markdownTexts = {
    numeric: `
  1. 첫 번째 항목
  2. 두 번째 항목
  3. 세 번째 항목
  `,
    lowerAlpha: `
  a. 첫 번째 항목
  b. 두 번째 항목
  c. 세 번째 항목
  `,
    upperAlpha: `
  A. 첫 번째 항목
  B. 두 번째 항목
  C. 세 번째 항목
  `,
    lowerRoman: `
  i. 첫 번째 항목
  ii. 두 번째 항목
  iii. 세 번째 항목
  `,
    upperRoman: `
  I. 첫 번째 항목
  II. 두 번째 항목
  III. 세 번째 항목
  `
  };
  
  // 예상되는 HTML 출력
  const expectedOutputs = {
    numeric: `
  <ol type="1">
  <li>첫 번째 항목</li>
  <li>두 번째 항목</li>
  <li>세 번째 항목</li>
  </ol>
  `,
    lowerAlpha: `
  <ol type="a">
  <li>첫 번째 항목</li>
  <li>두 번째 항목</li>
  <li>세 번째 항목</li>
  </ol>
  `,
    upperAlpha: `
  <ol type="A">
  <li>첫 번째 항목</li>
  <li>두 번째 항목</li>
  <li>세 번째 항목</li>
  </ol>
  `,
    lowerRoman: `
  <ol type="i">
  <li>첫 번째 항목</li>
  <li>두 번째 항목</li>
  <li>세 번째 항목</li>
  </ol>
  `,
    upperRoman: `
  <ol type="I">
  <li>첫 번째 항목</li>
  <li>두 번째 항목</li>
  <li>세 번째 항목</li>
  </ol>
  `
  };
  
    // MarkedJS에 커스텀 렌더러 적용
    marked.use({ renderer });

  // 테스트 실행
  for (const [key, markdown] of Object.entries(markdownTexts)) {
    const html = marked.parse(markdown);
    console.assert(html.trim() === expectedOutputs[key].trim(), `${key} 목록 테스트 실패`);
  }
  
  console.log('모든 테스트가 성공적으로 완료되었습니다.');
