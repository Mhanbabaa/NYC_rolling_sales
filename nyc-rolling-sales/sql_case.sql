#A
SELECT
    *,
    (SALE_PRICE - AVG(SALE_PRICE) OVER ()) / STDDEV(SALE_PRICE) OVER () AS sale_price_zscore
FROM stg.nyc_rolling_sales

#B
SELECT
    *,
    (SALE_PRICE - AVG(SALE_PRICE) OVER (PARTITION BY NEIGHBORHOOD, BUILDING_CLASS_CATEGORY)) /
        STDDEV(SALE_PRICE) OVER (PARTITION BY NEIGHBORHOOD, BUILDING_CLASS_CATEGORY) AS sale_price_zscore_neighborhood
FROM stg.nyc_rolling_sales


#C
SELECT
    *,
    GROSS_SQUARE_FEET / TOTAL_UNITS AS square_ft_per_unit,
    SALE_PRICE / TOTAL_UNITS AS price_per_unit
FROM stg.nyc_rolling_sales