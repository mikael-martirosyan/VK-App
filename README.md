# VK-App

## Standalone приложение, работающее с API VK. 
Разрабатывается в рамках I четверти обучения на факультете iOS-разработки образовательного портала GeekBrains.
Текущий курс 3: Производительность iOS-приложений.

### Задания к уроку №1 (Тема: Параллельное программирование. Thread):

1. Провести рефакторинг кода ленты новостей, разработанной в прошлом курсе;
2. Новость теперь нужно будет отображать не одной ячейкой, как раньше, а одной секцией;
3. Внутри секции новости вам нужно создать несколько типов и прототипов ячеек, например: ячейка текста новости, ячейка фотографии новости, ячейка с автором и временем публикации, ячейка с количеством лайков и комментариев.

Учитывайте, что разные новости могут содержать разное количество внутренних элементов — например, где-то будет фото, а где-то нет. 
Это должно получить отражение в методах dataSource-таблицы.

Заполнение реальными данными начнёте на следующем уроке, пока продолжаем работать с данными-заглушками.
Высота ячейки с фото пусть будет фиксированной, к ней мы вернёмся в лекциях 7–8.

### Задания к уроку №2 (Тема: Параллельное программирование. GCD):

1. Создать сервис для получения ленты новостей из ВК.
2. Добавить запрос для получения новостей типа post.
3. Создать класс для представления новости типа post.
4. *Добавить запрос для получения новостей типа photo.
5. *Создать класс для представления новости типа photo.
Вынести работу с сетью и парсинг в глобальную очередь для вк-сервиса.

### Задание к уроку №3 (Тема:  Параллельное программирование. NSOperation):

1. Взять один из workflow либо групп, либо друзей и перевести его на Operations. У вас должны быть операции загрузки данных от сервера, парсинга данных в соответствующие структуры, сохранения данных в БД Realm.

### Задание к уроку №4 (Тема: Асинхронный код. Futures/Promises)

1. Самостоятельно изучить документацию PromiseKit, познакомиться с операторами when, race, recover, attempt.
2. Перевести на PromiseKit отправку сетевого запроса на получение друзей, или групп пользователя. Другой workflow в зависимости от того, что у вас переведено на Operations.
