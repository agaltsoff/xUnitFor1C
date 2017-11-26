﻿&НаКлиенте
Перем ТестКлиенты;

&НаКлиенте
Перем СтатусыРезультатаТестирования;

// { Plugin interface
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
	
	ТестКлиенты= КонтекстЯдра.Плагин("ТестКлиенты");
	
КонецПроцедуры

// } Plugin interface

&НаКлиенте
Функция Что(Знач ПроверяемоеЗначениеПараметр, Знач Сообщение = "") Экспорт
	ВыполнитьМетодОбъектаНаСервере("Что", 2, ПроверяемоеЗначениеПараметр, Сообщение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Не_() Экспорт
	ВыполнитьМетодОбъектаНаСервере("Не_", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЭтоНе() Экспорт
	Возврат Не_();
КонецФункции

&НаКлиенте
Функция Метод(Знач ИмяМетода, Знач ПараметрыМетода = Неопределено) Экспорт
	ВыполнитьМетодОбъектаНаСервере("Метод", 2, ИмяМетода, ПараметрыМетода);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЭтоИстина() Экспорт
	ВыполнитьМетодОбъектаНаСервере("ЭтоИстина", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьИстина() Экспорт
	Возврат ЭтоИстина();
КонецФункции

&НаКлиенте
Функция ЭтоЛожь() Экспорт
	ВыполнитьМетодОбъектаНаСервере("ЭтоЛожь", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьЛожь() Экспорт
	Возврат ЭтоЛожь();
КонецФункции

&НаКлиенте
Функция Равно(Знач ОжидаемоеЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("Равно", 1, ОжидаемоеЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Больше(Знач МеньшееЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("Больше", 1, МеньшееЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция БольшеИлиРавно(Знач МеньшееИлиРавноеЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("БольшеИлиРавно", 1, МеньшееИлиРавноеЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Минимум(Знач МинимальноеЗначение) Экспорт
	Возврат БольшеИлиРавно(МинимальноеЗначение);
КонецФункции

&НаКлиенте
Функция МеньшеИлиРавно(Знач БольшееИлиРавноеЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("МеньшеИлиРавно", 1, БольшееИлиРавноеЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Максимум(Знач МаксимальноеЗначение) Экспорт
	Возврат МеньшеИлиРавно(МаксимальноеЗначение);
КонецФункции

&НаКлиенте
Функция Меньше(Знач БольшееЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("Меньше", 1, БольшееЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Заполнено() Экспорт
	ВыполнитьМетодОбъектаНаСервере("Заполнено", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Существует() Экспорт
	ВыполнитьМетодОбъектаНаСервере("Существует", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЭтоНеопределено() Экспорт
	ВыполнитьМетодОбъектаНаСервере("ЭтоНеопределено", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьНеопределено() Экспорт
	Возврат ЭтоНеопределено();
КонецФункции

&НаКлиенте
Функция ЭтоNull() Экспорт
	ВыполнитьМетодОбъектаНаСервере("ЭтоNull", 0);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ЕстьNull() Экспорт
	Возврат ЭтоNull();
КонецФункции

&НаКлиенте
Функция ИмеетТип(Знач ТипИлиИмяТипа) Экспорт
	ВыполнитьМетодОбъектаНаСервере("ИмеетТип", 1, ТипИлиИмяТипа);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Между(Знач НачальноеЗначение, Знач КонечноеЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("Между", 2, НачальноеЗначение, КонечноеЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция Содержит(Знач ИскомоеЗначение) Экспорт
	ВыполнитьМетодОбъектаНаСервере("Содержит", 1, ИскомоеЗначение);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ИмеетДлину(Знач ОжидаемаяДлина) Экспорт
	ВыполнитьМетодОбъектаНаСервере("ИмеетДлину", 1, ОжидаемаяДлина);
	
	Возврат ЭтаФорма;
КонецФункции

&НаКлиенте
Функция ВыбрасываетИсключение(Знач ФрагментИсключения = "") Экспорт
	ВыполнитьМетодОбъектаНаСервере("ВыбрасываетИсключение", 1, ФрагментИсключения);
	
	Возврат ЭтаФорма;
КонецФункции

// { Helpers
&НаСервере
Процедура ВыполнитьМетодОбъектаНаСервере(Знач ИмяМетода, Знач КоличествоПараметров, Знач Параметр1 = Неопределено, Знач Параметр2 = Неопределено)
	ОбъектНаСервере = ЭтотОбъектНаСервере();
	
	СтрокаПараметры = "";
	Если КоличествоПараметров = 1 Тогда
		СтрокаПараметры = "Параметр1";
	ИначеЕсли КоличествоПараметров = 2 Тогда
		СтрокаПараметры = "Параметр1, Параметр2";
	КонецЕсли;
	
	Попытка
		Выполнить("ОбъектНаСервере." + ИмяМетода + "(" + СтрокаПараметры + ")");
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
// } Helpers

// { Интерфейс автоматического тестирования

&НаКлиенте
Функция ПодключениеКлиентаТестирования(ИмяПользователя = "", Пароль = "", Порт = 1539) Экспорт
	
	ТекущийКлиент = ТестКлиенты.ТестКлиентПоПараметрам(ИмяПользователя, Пароль, Порт);
	
	Если ТекущийКлиент = Неопределено Тогда
		ПроверяемоеЗначение= СтрШаблон("Клиент тестирования с именем пользователя %1", ИмяПользователя);
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ ПОДКЛЮЧЕН.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

&НаКлиенте
Функция ОтключениеКлиентаТестирования() Экспорт
	
	ТестКлиенты.ЗавершитьВсеТестКлиенты();
	
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
	
	ТестКлиенты.ОткрытьФормуСписка(ПолноеИмяОбъектаМетаданных);
	
	ОкноФормыСписка= ТестКлиенты.ПолучитьОкно(ЗаголовокОкнаФормыСписка);
	
	//{ Через серверные методы сообщения менее информативные.
	//Объект.ПроверяемоеЗначение= ОкноФормыСписка;
	//Объект.ФлагОтрицания= Истина;
	//ИмяМетода= "ЭтоНеопределено";
	//объект.ДопСообщениеОшибки= СтрШаблон("Открытие формы списка %1, заголовок %2", ПолноеИмяОбъектаМетаданных, ЗаголовокОкнаФормыСписка);
	//ВыполнитьМетодОбъектаНаСервере(Имяме, 0);
	//}
	
	Если ОкноФормыСписка = Неопределено Тогда
		ПроверяемоеЗначение= СтрШаблон("Окно формы списка объекта %1 с заголовком %2", ПолноеИмяОбъектаМетаданных, ЗаголовокОкнаФормыСписка);
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БУДЕТ ОТКРЫТО.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтаФорма;
	
КонецФункции

// { Helpers

&НаКлиенте
Процедура ВызватьОшибкуПроверки(Знач СообщениеОшибки)
	Префикс = "["+ СтатусыРезультатаТестирования.ОшибкаПроверки + "]";
	ВызватьИсключение Префикс + " " + СообщениеОшибки;
КонецПроцедуры

&НаКлиенте
Функция СформироватьСообщениеОбОшибке(Знач ПроверяемоеЗначение, Знач Ожидание)
	Возврат 
		"Ожидали, что проверяемое значение (" + ПроверяемоеЗначение + ") " 
		//+ ?(ФлагОтрицанияДляСообщения, " НЕ ", " ") 
		+ Ожидание 
		//+ ФорматДСО(ДопСообщениеОшибки)
	;
КонецФункции

// } Helpers

// }

СтатусыРезультатаТестирования = Новый Структура;
СтатусыРезультатаТестирования.Вставить("ОшибкаПроверки", "Failed");
СтатусыРезультатаТестирования.Вставить("НеизвестнаяОшибка", "Broken");
СтатусыРезультатаТестирования.Вставить("ТестПропущен", "Pending");
СтатусыРезультатаТестирования = Новый ФиксированнаяСтруктура(СтатусыРезультатаТестирования);























