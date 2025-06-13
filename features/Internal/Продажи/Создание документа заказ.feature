﻿#language: ru


Функционал: создание документа заказ и проверка расчета суммы

Как менеджер по продажам я хочу
создать документ заказ
чтобы проверить расчет суммы в документе  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание документа заказ покупателя
* Заполнение шапки
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Все для дома\""
	И я нажимаю кнопку выбора у поля с именем 'Покупатель'
	Тогда открылось окно "Контрагенты"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000012" | "Мосхлеб ОАО"  |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Малый"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' из выпадающего списка с именем 'ТоварыТовар' я выбираю точное значение "Bosch1234"
	И я перехожу к следующему реквизиту
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
* Заполнение табличной части и проверка изменения суммы
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыСумма'
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '3 000,00' | '2'          | '6 000,00' |	
	И я нажимаю на кнопку "Записать"
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '3 000,00' | '3'          | '9 000,00' |
	И я нажимаю на кнопку с именем 'ФормаЗаписать'		
* Номер документа
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
	И таблица "Список" содержит строки
	|"Номер"|
	|"$Номер$"|

