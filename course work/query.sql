-- ТО каждые 10000км, создадим запрос в котором увидим автомобили с просроченным и подходящим ТО, для согласования автомобиля на ремонт
SELECT
c.car_plate,
c.mileage - c.last_inspection as overrun,
p.`name`,
p.phone,
p.adress
FROM taxopark.having_cars as c
join car_park as p on p.id = c.car_park_id
having overrun > 8500
order by overrun desc;


-- 5 везунчиков водителей, имеющие самую дорогую среднюю стоимость заказов
SELECT
concat(d.first_name, ' ', d.second_name) as driver,
sum(o.price)/count(o.price) as `avg`
FROM orders as o
join drivers as d on o.drivers_id = d.id
group by o.drivers_id
order by `avg` desc
limit 5;
