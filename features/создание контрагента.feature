﻿#language: ru

@tree

Функционал: проверка создания клиента

Как Оператор я хочу
Создать клиента
чтобы вести клиентскую базу

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка создания клиента
	* Открытие формы создания клиента
		И В командном интерфейсе я выбираю "Продажи" "Контрагенты"
		Тогда открылось окно "Контрагенты"
		И я нажимаю на кнопку с именем 'ФормаСоздать'		
	* Заполнение наименования клиента
		Когда открылось окно "Контрагент (создание)"
		И в поле с именем 'Наименование' я ввожу текст "Тестовый контрагент"
		И из выпадающего списка с именем 'ВидЦен' я выбираю точное значение "Оптовая"					
	* Заполнение номера телефона клиента
		И в поле с именем 'Телефон' я ввожу текст "111111111"
		И я перехожу к закладке с именем 'АдресаИКонтакты'		
	* Сохранение
		И я нажимаю на кнопку с именем 'ФормаЗаписать'		
	* Проверка сохранения по коду
		И я запоминаю значение поля "Код" как "$Код$"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Тестовый контрагент (Контрагент)" в течение 20 секунд
		Тогда таблица 'Список' содержит строки:
			| 'Код'       |
			| '$Код$' |
		
						
