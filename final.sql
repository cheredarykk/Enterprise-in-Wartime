-------
# Count of distinct companies by categories 
SELECT COUNT( DISTINCT FIRM_EDRPOU), kvedtype_en
FROM fin_res 
GROUP BY kvedtype_en;
# Count total distinct companies
SELECT COUNT(DISTINCT FIRM_EDRPOU)
FROM fin_res;
-------
###Create a new column with kved type in fin_res
ALTER TABLE fin_res
ADD kvedtype VARCHAR(250);

UPDATE balance
SET kvedtype = CASE
    WHEN LEFT(COALESCE(FIRM_KVED), 2) IN ('01', '02', '03') THEN 'Сільське господарство, лісове господарство та рибне господарство'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) IN ('04', '05', '06', '07', '08', '09') THEN 'Добувна промисловість і розроблення кар\'єрів'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '10' AND '33' THEN 'Переробна промисловість'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) = '35' THEN 'Постачання електроенергії, газу, пари та кондиційованого повітря'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) IN ('36', '37', '38', '39') THEN 'Водопостачання; каналізація, поводження з відходами'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '41' AND '43' THEN 'Будівництво'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '45' AND '47' THEN 'Оптова та роздрібна торгівля; ремонт автотранспортних засобів і мотоциклів'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '49' AND '53' THEN 'Транспорт, складське господарство, поштова та кур\'єрська діяльність'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '55' AND '56' THEN 'Тимчасове розміщування й організація харчування'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '58' AND '63' THEN 'Інформація та телекомунікації'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '64' AND '66' THEN 'Фінансова та страхова діяльність'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) = '67' THEN 'Допоміжні послуги у сфері фінансового посередництва та страхування'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) = '68' THEN 'Операції з нерухомим майном'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '69' AND '75' THEN 'Професійна, наукова та технічна діяльність'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '77' AND '82' THEN 'Діяльність у сфері адміністративного та допоміжного обслуговування'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) = '84' THEN 'Державне управління й оборона; обов\'язкове соціальне страхування'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) = '85' THEN 'Освіта'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '86' AND '88' THEN 'Охорона здоров\'я та надання соціальної допомоги'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '90' AND '93' THEN 'Мистецтво, спорт, розваги та відпочинок'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '94' AND '96' THEN 'Надання інших видів послуг'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) BETWEEN '97' AND '98' THEN 'Діяльність домашніх господарств'
    WHEN LEFT(COALESCE(FIRM_KVED), 2) = '99' THEN 'Діяльність екстериторіальних організацій і органів'
    ELSE "Не наданий"
END;

###Create a new column with kved type in fin_res but EN version
ALTER TABLE balance
ADD kvedtype_en VARCHAR(250);

UPDATE balance
SET kvedtype_en = CASE
    WHEN LEFT(FIRM_KVED, 2) IN ('01', '02', '03') THEN 'Agriculture, forestry and fishing'
    WHEN LEFT(FIRM_KVED, 2) IN ('04', '05', '06', '07', '08', '09') THEN 'Mining and quarrying'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '10' AND '33' THEN 'Manufacturing'
    WHEN LEFT(FIRM_KVED, 2) = '35' THEN 'Electricity, gas, steam and air conditioning supply'
    WHEN LEFT(FIRM_KVED, 2) IN ('36', '37', '38', '39') THEN 'Water supply; sewerage, waste management and remediation activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '41' AND '43' THEN 'Construction'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '45' AND '47' THEN 'Wholesale and retail trade; repair of motor vehicles and motorcycles'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '49' AND '53' THEN 'Transportation and storage; postal and courier activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '55' AND '56' THEN 'Accommodation and food service activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '58' AND '63' THEN 'Information and communication'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '64' AND '66' THEN 'Financial and insurance activities'
    WHEN LEFT(FIRM_KVED, 2) = '67' THEN 'Auxiliary services in the field of financial intermediation and insurance'
    WHEN LEFT(FIRM_KVED, 2) = '68' THEN 'Real estate activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '69' AND '75' THEN 'Professional, scientific and technical activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '77' AND '82' THEN 'Administrative and support service activities'
    WHEN LEFT(FIRM_KVED, 2) = '84' THEN 'Public administration and defence; compulsory social security'
    WHEN LEFT(FIRM_KVED, 2) = '85' THEN 'Education'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '86' AND '88' THEN 'Human health and social work activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '90' AND '93' THEN 'Arts, entertainment and recreation'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '94' AND '96' THEN 'Other service activities'
    WHEN LEFT(FIRM_KVED, 2) BETWEEN '97' AND '98' THEN 'Activities of households as employers'
    WHEN LEFT(FIRM_KVED, 2) = '99' THEN 'Activities of extraterritorial organizations and bodies'
    ELSE "Not given"
END;
-------

### NET REVENUE 

# Calculate net rev growth in YoY
WITH lagged_values AS (
    SELECT 
        FIRM_EDRPOU, 
        PERIOD_YEAR, 
        A2000,
        LAG(A2000) OVER (PARTITION BY FIRM_EDRPOU ORDER BY PERIOD_YEAR ASC) AS prY
    FROM 
        fin_res
)
UPDATE 
    fin_res t1
JOIN 
    lagged_values t2
ON 
    t1.FIRM_EDRPOU = t2.FIRM_EDRPOU AND t1.PERIOD_YEAR = t2.PERIOD_YEAR
SET 
    t1.NetrevGYoY = CASE
        #WHEN t1.PERIOD_YEAR = 2020 THEN NULL
        #WHEN t2.prY = NULL THEN NULL
        WHEN t2.prY = 0 THEN NULL
        WHEN t1.PERIOD_YEAR IN (2020, 2021, 2022, 2023) THEN ((t1.A2000 - t2.prY) / t2.prY)
        ELSE t1.NetrevGYoY  -- Keep the current value for other years
    END;
-------

### PROFIT/LOSS

###Create a new column with profit/loss
ALTER TABLE fin_res
ADD NetFinRes float;
UPDATE fin_res 
SET NetFinRes = CASE 
	WHEN A2350 is null then (0-A2355) 
	WHEN A2355 is null then A2350
	ELSE A2350 - A2355
END;

------- 
### Transfer UAH to EUR (avarage in year x) / Due to the war and the economic downturn in Ukraine, the exchange rate skyrocketed after the war began.
# 2020 - 30,79 / 2021 - 32,31	/ 2022 - 33,98	/ 2023 - 39,56
SELECT A2000, NetFinRes, A2350, A2355,NetRevEUR,NetFinResEUR  FROM fin_res;
SET SQL_SAFE_UPDATES = 0;                          -- SQL SAFE MODE

# Net Rev in UAH to EUR 
ALTER TABLE fin_res
ADD NetRevEUR float;
UPDATE fin_res 
SET NetRevEUR = CASE 
	WHEN PERIOD_YEAR = 2020 THEN (A2000/30.79)
    WHEN PERIOD_YEAR = 2021 THEN (A2000/32.31)
    WHEN PERIOD_YEAR = 2022 THEN (A2000/33.98)
    WHEN PERIOD_YEAR = 2023 THEN (A2000/39.56)
END;

# Net PROFIT/LOSS in UAH to EUR 
ALTER TABLE fin_res
ADD NetFinResEUR float;
UPDATE fin_res 
SET NetFinResEUR = CASE 
	WHEN PERIOD_YEAR = 2020 THEN (NetFinRes/30.79)
    WHEN PERIOD_YEAR = 2021 THEN (NetFinRes/32.31)
    WHEN PERIOD_YEAR = 2022 THEN (NetFinRes/33.98)
    WHEN PERIOD_YEAR = 2023 THEN (NetFinRes/39.56)
END;

------
# Create new table to store values * thousand 
CREATE TABLE fin_res_TH (
    A2000_TH float,
    NetFinRes_TH float,
    NetFinResEUR_TH float,
    NetRevEUR_TH float,
    id_year varchar(14),
    PRIMARY KEY (id_year)
);

alter table fin_res_th
add column FIRM_EDRPOU varchar(10);

INSERT INTO fin_res_th (id_year)
SELECT id_year
FROM fin_res;

#Add info regarding firm edrpou
UPDATE fin_res_TH AS th
JOIN fin_res AS res ON th.id_year = res.id_year
SET 
    th.FIRM_EDRPOU = res.FIRM_EDRPOU;
#Add info from fin_res
UPDATE fin_res_TH AS th
JOIN fin_res AS res ON th.id_year = res.id_year
SET 
    th.A2000_TH = res.A2000 * 1000,
    th.NetFinRes_TH = res.NetFinRes * 1000,
    th.NetFinResEUR_TH = res.NetFinResEUR * 1000,
    th.NetRevEUR_TH = res.NetRevEUR * 1000;
#Add info from balance    
UPDATE fin_res_TH AS th
JOIN balance AS res ON th.id_year = res.id_year
SET 
    th.A1300_TH = res.A1300 * 1000,
    th.A1300EUR_TH = CASE 
		WHEN PERIOD_YEAR = 2020 THEN ((res.A1300 * 1000)/30.79)
		WHEN PERIOD_YEAR = 2021 THEN ((res.A1300 * 1000)/32.31)
		WHEN PERIOD_YEAR = 2022 THEN ((res.A1300 * 1000)/33.98)
		WHEN PERIOD_YEAR = 2023 THEN ((res.A1300 * 1000)/39.56)
    END;
#Add info regarding employees empl
UPDATE fin_res_TH AS th
JOIN balance AS res ON th.id_year = res.id_year
SET 
    th.empl = res.N3;
    
SELECT * FROM fin_res_TH;    
-----
### To better analyse enteprises, they will be transformed into categories: micro, small, medium, large
UPDATE fin_res_th
SET category = CASE 
	WHEN A1300EUR_TH <= 350000   AND (NetRevEUR_TH <= 700000    OR empl < 10 ) THEN "Micro"
    WHEN A1300EUR_TH <= 4000000  AND (NetRevEUR_TH <= 8000000   OR empl < 50)  THEN "Small"
    WHEN A1300EUR_TH <= 20000000 AND (NetRevEUR_TH <= 40000000  OR empl < 250) THEN "Medium"
    WHEN A1300EUR_TH >  20000000 AND (NetRevEUR_TH >  40000000  OR empl > 250) THEN "Large"
    WHEN (A1300EUR_TH <= 350000   OR NetRevEUR_TH  <= 700000 )   AND empl < 10  THEN "Micro"
    WHEN (A1300EUR_TH <= 4000000  OR NetRevEUR_TH<= 8000000)   AND empl < 50  THEN "Small"
    WHEN (A1300EUR_TH <= 20000000 OR NetRevEUR_TH <= 40000000)  AND empl < 250 THEN "Medium"
    WHEN (A1300EUR_TH >  20000000 OR NetRevEUR_TH  >  40000000)  AND empl > 250 THEN "Large"
    END;
    
SELECT COUNT(DISTINCT FIRM_EDRPOU) FROM fin_res_th WHERE category = "Micro"; -- 5047
SELECT COUNT(DISTINCT FIRM_EDRPOU) FROM fin_res_th WHERE category = "Small"; -- 8675
SELECT COUNT(DISTINCT FIRM_EDRPOU) FROM fin_res_th WHERE category = "Medium"; -- 7379
SELECT COUNT(DISTINCT FIRM_EDRPOU) FROM fin_res_th WHERE category = "Large";  -- 1705

#Top 3 Large by Net Rev
SELECT A1300EUR_TH, NetRevEUR_TH, FIRM_EDRPOU, category, empl, A1300EUR_TH 
FROM fin_res_th WHERE PERIOD_YEAR = 2020 and category = "Large" ORDER BY NetRevEUR_TH DESC LIMIT 4; -- 30487219, 20077720, 00191129

#Top 3 Medium
SELECT A1300EUR_TH, NetRevEUR_TH, FIRM_EDRPOU, category, empl, A1300EUR_TH 
FROM fin_res_th WHERE PERIOD_YEAR = 2020 and category = "Medium" and empl > 1 ORDER BY NetRevEUR_TH DESC LIMIT 4; -- 42419660, 42588390, 37039253

#Top 3 Small
SELECT A1300EUR_TH, NetRevEUR_TH, FIRM_EDRPOU, category, empl, A1300EUR_TH 
FROM fin_res_th WHERE PERIOD_YEAR = 2020 and category = "Small" and empl >= 1  ORDER BY NetRevEUR_TH DESC LIMIT 4; -- 43072513, 33682479, 43420368

#Top 3 Micro
SELECT A1300EUR_TH, NetRevEUR_TH, FIRM_EDRPOU, category, empl, A1300EUR_TH 
FROM fin_res_th WHERE PERIOD_YEAR = 2020 and category = "Micro" and empl >= 1 ORDER BY NetRevEUR_TH DESC LIMIT 5; -- 42046566, 21151996, 38359009

SELECT Firm_name FROM fin_res WHERE FIRM_EDRPOU = "37039253";
SELECT A1300EUR_TH, empl, NetRevEUR_TH FROM fin_res_th WHERE FIRM_EDRPOU = "37039253";

### Net Profit Margin
ALTER TABLE fin_res_th
ADD NetProfitM float;

UPDATE fin_res_th 
SET NetProfitM = CASE 
    WHEN NetRevEUR_TH = 0 THEN NULL
    ELSE NetFinResEUR_TH / NetRevEUR_TH
END;


