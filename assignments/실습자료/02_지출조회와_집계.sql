-- 여러 번 실행해도 저장된 기록은 바뀌지 않습니다.
SET NAMES utf8mb4;
USE student_expense_demo_2025011890;

-- 10월 지출 목록
SELECT expense_id, spent_on, category, place, amount
FROM expenses
WHERE spent_on >= '2026-10-01' AND spent_on < '2026-11-01'
ORDER BY spent_on, expense_id;

-- 10월 총지출
SELECT COUNT(*) AS expense_count, SUM(amount) AS total_amount
FROM expenses
WHERE spent_on >= '2026-10-01' AND spent_on < '2026-11-01';

-- 10월 항목별 지출 합계
SELECT category, SUM(amount) AS category_total
FROM expenses
WHERE spent_on >= '2026-10-01' AND spent_on < '2026-11-01'
GROUP BY category
ORDER BY category_total DESC, category;

-- 10월 금액이 큰 지출 5건
SELECT expense_id, spent_on, category, place, amount
FROM expenses
WHERE spent_on >= '2026-10-01' AND spent_on < '2026-11-01'
ORDER BY amount DESC, expense_id ASC
LIMIT 5;

-- 월별 지출 합계
SELECT DATE_FORMAT(spent_on, '%Y-%m') AS expense_month,
       COUNT(*) AS expense_count, SUM(amount) AS total_amount
FROM expenses
GROUP BY DATE_FORMAT(spent_on, '%Y-%m')
ORDER BY expense_month;

-- 10월 합계가 5만 원 이상인 항목
SELECT category, SUM(amount) AS category_total
FROM expenses
WHERE spent_on >= '2026-10-01' AND spent_on < '2026-11-01'
GROUP BY category
HAVING SUM(amount) >= 50000
ORDER BY category_total DESC, category;

