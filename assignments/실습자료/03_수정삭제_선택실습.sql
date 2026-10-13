-- 선택 실습: 입력·수정·삭제 후 원래 상태로 되돌리기
-- 01 파일을 먼저 실행해야 합니다. 아래 전체 명령은 같은 연결에서 실행하세요.
-- 연습 행 번호 900001은 제공 데이터에 없는 번호입니다.
SET NAMES utf8mb4;
USE student_expense_demo_2025011890;
START TRANSACTION;
INSERT INTO expenses (expense_id, spent_on, category, place, amount)
VALUES (900001, '2026-10-15', '카페', '수정삭제 연습용', 4500);
SELECT expense_id, place, amount FROM expenses WHERE expense_id = 900001;
UPDATE expenses SET amount = 4000 WHERE expense_id = 900001;
SELECT expense_id, place, amount FROM expenses WHERE expense_id = 900001;
DELETE FROM expenses WHERE expense_id = 900001;
SELECT COUNT(*) AS practice_rows_remaining FROM expenses WHERE expense_id = 900001;
ROLLBACK;
-- 연습 전 28건 유지 여부 확인. 자동 번호의 다음 값은 커질 수 있습니다.
SELECT COUNT(*) AS total_rows, SUM(amount) AS total_amount FROM expenses;
