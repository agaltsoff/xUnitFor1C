﻿#Область Инициализация

&НаКлиенте
Перем МенеджерТестКлиентов;

&НаКлиенте
Перем Ожидаем;

&НаКлиенте
Перем СтатусыРезультатаТестирования;

&НаКлиенте
Функция ОписаниеПлагина(ВозможныеТипыПлагинов) Экспорт
	Возврат ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов);
КонецФункции

&НаСервере
Функция ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов)
	Возврат ЭтотОбъектНаСервере().ОписаниеПлагина(ВозможныеТипыПлагинов);
КонецФункции

&НаКлиенте
Процедура Инициализация(КонтекстЯдра) Экспорт
	
	МенеджерТестКлиентов= КонтекстЯдра.Плагин("МенеджерТестКлиентов");
	Ожидаем= КонтекстЯдра.Плагин("УтвержденияBDD");
	
КонецПроцедуры

#КонецОбласти

#Область ИнтерфейсАвтоматическогоТестирования

&НаКлиенте
Функция ПодключениеКлиентаТестирования(ИмяПользователя = "", Пароль = "", Порт = 1538) Экспорт
	
	ТекущийКлиент = МенеджерТестКлиентов.ТестКлиентПоПараметрам(ИмяПользователя, Пароль, Порт);
	
	Если ТекущийКлиент = Неопределено Тогда
		ПроверяемоеЗначение= СтрШаблон("Клиент тестирования с именем пользователя %1", ИмяПользователя);
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ ПОДКЛЮЧЕН.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ОтключениеКлиентаТестирования() Экспорт
	
	МенеджерТестКлиентов.ЗавершитьВсеТестКлиенты();
	
	//TODO: Проверка отключения тест клиентов
	//Если ТекущийКлиент <> Неопределено Тогда
	//	ПроверяемоеЗначение= СтрШаблон("Клиент тестирования на порту %1", XMLСтрока(ТекущийПорт));
	//	СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ ОТКЛЮЧЕН.");
	//	ВызватьОшибкуПроверки(СообщениеОшибки);
	//КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ОткрытиеФормыСписка(ПолноеИмяОбъектаМетаданных, ЗаголовокОкнаФормыСписка) Экспорт
	
	МенеджерТестКлиентов.ОткрытьФормуСписка(ПолноеИмяОбъектаМетаданных, ЗаголовокОкнаФормыСписка);
	
	ОкноФормыСписка= МенеджерТестКлиентов.ПолучитьТестируемоеОкно();
	
	Если ОкноФормыСписка = Неопределено Тогда
		ПроверяемоеЗначение= СтрШаблон("Окно формы списка объекта %1 с заголовком %2", ПолноеИмяОбъектаМетаданных, ЗаголовокОкнаФормыСписка);
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ ОТКРЫТО.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	ТеструемыйЭлемент= МенеджерТестКлиентов.ПолучитьТестируемыйЭлемент();
	
	Если ТеструемыйЭлемент = Неопределено Тогда
		ПроверяемоеЗначение= СтрШаблон("Открытое окно формы списка объекта %1 с заголовком %2", ПолноеИмяОбъектаМетаданных, ЗаголовокОкнаФормыСписка);
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "СОДЕРЖИТ СПИСОК.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ПоискВСписке(СтруктураПоиска) Экспорт
	
	СтрокаНайдена= МенеджерТестКлиентов.НайтиВсписке(СтруктураПоиска);
	
	Если Не СтрокаНайдена Тогда
		
		ПредставлениеСтруктурыПоиска= "";
		Для Каждого Элемент Из СтруктураПоиска Цикл
			ПредставлениеСтруктурыПоиска= ПредставлениеСтруктурыПоиска + СтрШаблон("%1= %2; ", Элемент.Ключ, Элемент.Значение);
		КонецЦикла;
		ПредставлениеСтруктурыПоиска= Лев(ПредставлениеСтруктурыПоиска, СтрДлина(ПредставлениеСтруктурыПоиска) - 2);
		
		ПроверяемоеЗначение= СтрШаблон("Строка формы списка с реквизитами %1", ПредставлениеСтруктурыПоиска);
		
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ НАЙДЕНА.");
		
		ВызватьОшибкуПроверки(СообщениеОшибки);
		
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция УстановкаОтбораВСписке(СтруктураПоиска= Неопределено) Экспорт
	
	ОборУстановлен= МенеджерТестКлиентов.УстановитьОтборВСписке(СтруктураПоиска);
	
	Если Не ОборУстановлен Тогда
		
		Если СтруктураПоиска = Неопределено Тогда
			ПроверяемоеЗначение= "Отбор в списке";
		Иначе
			ПредставлениеСтруктурыПоиска= КСтроке(СтруктураПоиска);
			ПроверяемоеЗначение= СтрШаблон("Отбор в списке по реквизитами %1", ПредставлениеСтруктурыПоиска);
		КонецЕсли;
		
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ УСТАНОВЛЕН.");
		
		ВызватьОшибкуПроверки(СообщениеОшибки);
		
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция УстановкаОтбораВСпискеПоРегистратору(ЗаголовокСпискаРегистратора, ПредставлениеТипаРегистратора, СтруктураПоискаРегистратора) Экспорт
	
	ОборУстановлен= МенеджерТестКлиентов.УстановитьОтборВСпискеПоРегистратору(ЗаголовокСпискаРегистратора, ПредставлениеТипаРегистратора, СтруктураПоискаРегистратора);
	
	Если Не ОборУстановлен Тогда
		
		ПредставлениеСтруктурыПоиска= КСтроке(СтруктураПоискаРегистратора);
		ПроверяемоеЗначение= СтрШаблон("Отбор в списке по регистратору типа %1 с реквизитами %2", ПредставлениеТипаРегистратора, ПредставлениеСтруктурыПоиска);
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ УСТАНОВЛЕН.", МенеджерТестКлиентов.ПолучитьОписаниеОшибки());
		
		ВызватьОшибкуПроверки(СообщениеОшибки);
		
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ОткрытиеВСписке(ТекстЗаголовка, СтруктураПоиска= Неопределено) Экспорт
	
	СтрокаОткрыта= МенеджерТестКлиентов.ОткрытьВсписке(ТекстЗаголовка, СтруктураПоиска);
	
	Если Не СтрокаОткрыта Тогда
		
		Если СтруктураПоиска = Неопределено Тогда
			ПроверяемоеЗначение= СтрШаблон("Окно с заголовком %1 по текущей строке формы списка", ТекстЗаголовка);
		Иначе
			ПредставлениеСтруктурыПоиска= КСтроке(СтруктураПоиска);
			ПроверяемоеЗначение= СтрШаблон("Окно с заголовком %1 по строке формы списка с реквизитами %2", ТекстЗаголовка, ПредставлениеСтруктурыПоиска);
		КонецЕсли;
		
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ ОТКРЫТО.");
		
		ВызватьОшибкуПроверки(СообщениеОшибки);
		
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция Проведение(ЗакрытьПослеПроведения= Ложь) Экспорт
	
	ПроверяемоеЗначение= МенеджерТестКлиентов.ПолучитьТестируемоеОкно().Заголовок;
	
	ПроведениеВыполнено= МенеджерТестКлиентов.Провести(ЗакрытьПослеПроведения);
	
	Если Не ПроведениеВыполнено Тогда
		
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, СтрШаблон("БУДЕТ ПРОВЕДЕНО%1.", ?(ЗакрытьПослеПроведения, "И ЗАКРЫТО", "")), МенеджерТестКлиентов.ПолучитьОписаниеОшибки());
		
		ВызватьОшибкуПроверки(СообщениеОшибки);
		
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция КоличествоСтрокВСписке(Знач Сообщение= "", КоличествоСлужебныхСтрок= 0) Экспорт
	
	Объект.ПроверяемоеЗначение= МенеджерТестКлиентов.КоличествоСтрокВСписке(, КоличествоСлужебныхСтрок);
	
	Если Сообщение <> "" Тогда
		Объект.ДопСообщениеОшибки= Сообщение;
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ЭтотСписокПустой(Знач Сообщение= "", КоличествоСлужебныхСтрок= 0) Экспорт
	
	Ожидаем.Что(МенеджерТестКлиентов.ЭтотСписокПустой(КоличествоСлужебныхСтрок), Сообщение).ЭтоИстина();
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ПолучитьПроверяемоеЗначение() Экспорт
	Возврат Объект.ПроверяемоеЗначение;
КонецФункции

&НаКлиенте
Функция ПолучитьДопСообщениеОшибки() Экспорт
	Возврат Объект.ДопСообщениеОшибки;
КонецФункции


#КонецОбласти 

#Область СлужебныеМетоды

&НаКлиенте
Функция КСтроке(СтруктураПоиска)
	
	Если ТипЗнч(СтруктураПоиска) = Тип("Строка") Тогда
		ПредставлениеСтруктуры= СтруктураПоиска;
	Иначе
		ПредставлениеСтруктуры= "";
		Для Каждого Элемент Из СтруктураПоиска Цикл
			ПредставлениеСтруктуры= ПредставлениеСтруктуры + СтрШаблон("%1= %2; ", Элемент.Ключ, Элемент.Значение);
		КонецЦикла;
		ПредставлениеСтруктуры= Лев(ПредставлениеСтруктуры, СтрДлина(ПредставлениеСтруктуры) - 2);
	КонецЕсли;
	
	Возврат ПредставлениеСтруктуры;
	
КонецФункции

&НаКлиенте
Процедура ВызватьОшибкуПроверки(Знач СообщениеОшибки)
	Префикс = "["+ СтатусыРезультатаТестирования.ОшибкаПроверки + "]";
	ВызватьИсключение Префикс + " " + СообщениеОшибки;
КонецПроцедуры

&НаКлиенте
Функция СформироватьСообщениеОбОшибке(Знач ПроверяемоеЗначение, Знач Ожидание, Знач ДопСообщениеОшибки= Неопределено)
	Возврат 
		"Ожидали, что проверяемое значение (" + ПроверяемоеЗначение + ") " 
		//+ ?(ФлагОтрицанияДляСообщения, " НЕ ", " ") 
		+ Ожидание 
		+ ФорматДСО(ДопСообщениеОшибки)
	;
КонецФункции

Функция ФорматДСО(Знач ДопСообщениеОшибки)
	
	Если ДопСообщениеОшибки = "" Тогда
		Возврат "";
	Иначе
		Возврат Символы.ПС + ДопСообщениеОшибки;	
	КонецЕсли;
	
КонецФункции

&НаСервере
Процедура ВыполнитьМетодОбъектаНаСервере(Знач ИмяМетода, Знач КоличествоПараметров, Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено)
	ОбъектНаСервере = РеквизитФормыВЗначение("Объект");
	
	Попытка
		ОбъектНаСервере.ВыполнитьМетод(ИмяМетода, КоличествоПараметров, Параметр1, Параметр2);
	Исключение
		ОписаниеОшибки = ОписаниеОшибки();
		ВызватьИсключение "Вызов метода <" + ИмяМетода +">: " + ОписаниеОшибки;
	КонецПопытки;
	
	ЗначениеВРеквизитФормы(ОбъектНаСервере, "Объект");
КонецПроцедуры

&НаСервере
Функция ЭтотОбъектНаСервере()
	Возврат РеквизитФормыВЗначение("Объект");
КонецФункции

#КонецОбласти 

СтатусыРезультатаТестирования = Новый Структура;
СтатусыРезультатаТестирования.Вставить("ОшибкаПроверки", "Failed");
СтатусыРезультатаТестирования.Вставить("НеизвестнаяОшибка", "Broken");
СтатусыРезультатаТестирования.Вставить("ТестПропущен", "Pending");
СтатусыРезультатаТестирования = Новый ФиксированнаяСтруктура(СтатусыРезультатаТестирования);

