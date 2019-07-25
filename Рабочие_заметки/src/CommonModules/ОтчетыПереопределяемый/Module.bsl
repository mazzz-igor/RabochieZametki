#Область ПрограммныйИнтерфейс

// В данной процедуре следует описать дополнительные зависимости объектов метаданных
//   конфигурации, которые будут использоваться для связи настроек отчетов.
//
// Параметры:
//   СвязиОбъектовМетаданных - ТаблицаЗначений - Таблица связей.
//       * ПодчиненныйРеквизит - Строка - Имя реквизита подчиненного объекта метаданных.
//       * ПодчиненныйТип      - Тип    - Тип подчиненного объекта метаданных.
//       * ВедущийТип          - Тип    - Тип ведущего объекта метаданных.
//
Процедура ДополнитьСвязиОбъектовМетаданных(СвязиОбъектовМетаданных) Экспорт
	
	
	
КонецПроцедуры

// Вызывается в форме отчета и в форме настройки отчета перед выводом настройки 
// для указания дополнительных параметров выбора.
//
// Параметры:
//   Форма - УправляемаяФорма, Неопределено - Форма отчета.
//   СвойстваНастройки - Структура - Описание настройки отчета, которая будет выведена в форме отчета.
//     * ПолеКД        - ПолеКомпоновкиДанных - Выводимая настройка.
//     * ОписаниеТипов - ОписаниеТипов        - Тип выводимой настройки.
//     * ЗначенияДляВыбора - СписокЗначений - Указать объекты, которые будут предложены пользователю в списке выбора.
//           Дополняет список объектов, уже выбранных пользователем ранее.
//           При этом не следует присваивать в этот параметр новый список значений.
//     * ЗапросЗначенийВыбора - Запрос - Указать запрос для выборки объектов, которыми необходимо дополнить 
//           ЗначенияДляВыбора. Первой колонкой (с индексом 0) должен выбираться объект,
//           который следует добавить в ЗначенияДляВыбора.Значение.
//           Для отключения автозаполнения в свойство ЗапросЗначенийВыбора.Текст следует записать пустую строку.
//     * ОграничиватьВыборУказаннымиЗначениями - Булево - Указать Истина, чтобы ограничить выбор пользователя
//           значениями, указанными в ЗначенияДляВыбора (его конечным состоянием).
//
// Пример:
//   1. Для всех настроек типа СправочникСсылка.Пользователи скрыть и не разрешать выбирать помеченных на удаление, 
//   недействительных и служебных пользователей.
//
//   Если СвойстваНастройки.ОписаниеТипов.СодержитТип(Тип("СправочникСсылка.Пользователи")) Тогда
//     СвойстваНастройки.ОграничиватьВыборУказаннымиЗначениями = Истина;
//     СвойстваНастройки.ЗначенияДляВыбора.Очистить();
//     СвойстваНастройки.ЗапросЗначенийВыбора.Текст =
//       "ВЫБРАТЬ Ссылка ИЗ Справочник.Пользователи
//       |ГДЕ НЕ ПометкаУдаления И НЕ Недействителен И НЕ Служебный";
//   КонецЕсли;
//
//   2. Для настройки "Размер" предусмотреть дополнительное значение для выбора.
//
//   Если СвойстваНастройки.ПолеКД = Новый ПолеКомпоновкиДанных("ПараметрыДанных.Размер") Тогда
//     СвойстваНастройки.ЗначенияДляВыбора.Добавить(10000000, НСтр("ru = 'Больше 10 Мб'"));
//   КонецЕсли;
//
Процедура ПриОпределенииПараметровВыбора(Форма, СвойстваНастройки) Экспорт
	
КонецПроцедуры

// Вызывается в обработчике одноименного события формы отчета после выполнения кода формы.
// См. "УправляемаяФорма.ПриСозданииНаСервере" в синтакс-помощнике и ОтчетыКлиентПереопределяемый.ОбработчикКоманды.
//
// Параметры:
//   Форма - УправляемаяФорма - Форма отчета.
//   Отказ - Булево - Признак отказа от создания формы.
//   СтандартнаяОбработка - Булево - Признак выполнения стандартной (системной) обработки события.
//
// Пример:
//	//Добавление команды с обработчиком в ОтчетыКлиентПереопределяемый.ОбработчикКоманды:
//	Команда = ФормаОтчета.Команды.Добавить("МояОсобеннаяКоманда");
//	Команда.Действие  = "Подключаемый_Команда";
//	Команда.Заголовок = НСтр("ru = 'Моя команда...'");
//	
//	Кнопка = ФормаОтчета.Элементы.Добавить(Команда.Имя, Тип("КнопкаФормы"), ФормаОтчета.Элементы.<ИмяПодменю>);
//	Кнопка.ИмяКоманды = Команда.Имя;
//	
//	ФормаОтчета.ПостоянныеКоманды.Добавить(КомандаСоздать.Имя);
//
Процедура ПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
	
КонецПроцедуры

// Вызывается в обработчике одноименного события формы отчета и формы настройки отчета.
// См. "Расширение управляемой формы для отчета.ПередЗагрузкойВариантаНаСервере" в синтакс-помощнике.
//
// Параметры:
//   Форма - УправляемаяФорма - Форма отчета или настроек отчета.
//   НовыеНастройкиКД - НастройкиКомпоновкиДанных - Настройки для загрузки в компоновщик настроек.
//
Процедура ПередЗагрузкойВариантаНаСервере(Форма, НовыеНастройкиКД) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти
