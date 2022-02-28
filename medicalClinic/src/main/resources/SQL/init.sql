insert into medical_inst.patient values
(1, 'Рома', 'М', '26', 'Москва', 'something', to_date('31.08.1995','DD.MM.YYYY'), 'something', 'Russia', '1234', '12345', '+7777'),
(2, 'Аня', 'Ж', '24', 'Москва', 'something', to_date('06.10.1997','DD.MM.YYYY'), 'something', 'Russia', '1234', '12345', '+7777'),
(3, 'Рафаэль', 'М', '26', 'Москва', 'something', to_date('11.10.1995','DD.MM.YYYY'), 'something', 'Russia', '1234', '12345', '+7777');

insert into medical_inst.medical_history values
(1, 1, '893475737', current_date, current_date, 'Василий Пупкин', '', 0),
(2, 2, '346798564', current_date, current_date, 'Василий Пупкин', '', 0),
(3, 3, '086648397', current_date, current_date, 'Василий Пупкин', '', 0);